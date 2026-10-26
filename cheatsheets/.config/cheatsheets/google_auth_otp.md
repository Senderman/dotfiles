# Decode Google Authenticator's otp export to be used in oathtool

You will need: oathool, protoc (protobuf), qrtool (or zbar)

Google Authenticator's export data is a QR code, which, when decoded, looks like this:

```
otpauth-migration://offline?data=CioKCXNoYXcnYXJtYRINbmVrb0BuZWtvLmNvbRoIbmVrby5jb20gASgBMAIQARgBKJIh
```

The `data` parameter in the URI is a base64 encoded protobuf message with the following schema (may be inaccurate):

```
syntax = "proto2";

message OtpParameters {
	optional bytes secret = 1;

	optional string name = 2;

	optional string issuer = 3;

	optional Algorithm algorithm = 4;

	optional DigitCount digits = 5;

	optional OtpType type = 6;

	optional int64 counter = 7;
}

enum Algorithm {
	ALGORITHM_TYPE_UNSPECIFIED = 0;
	SHA1 = 1;
	SHA256 = 2;
	SHA512 = 3;
	MD5 = 4;
}

enum DigitCount {
	DIGIT_COUNT_UNSPECIFIED = 0;
	SIX = 1;
	EIGHT = 2;
}

enum OtpType {
	OTP_TYPE_UNSPECIFIED = 0;
	HOTP = 1;
	TOTP = 2;
}
```

TOTP is often 6 digits, uses SHA1 algorithm, and this is the default parameters for 99% OTP apps, so we only need the secret.

If the parameters are different, we can extract them from the protobuf message

The secret is base32 (not base64!) encoded arbitrary data (private key)

So, we need to

1. Decode QR
2. Extract the `data` value
3. Base64 decode it
4. Decode the protobuf message
5. Extract the secret bytes
6. Encode them as base32
7. Pass the value to oathtool

The 1-4 is easy and can be done with

```bash
qrtool decode otpexample.png | grep -o 'data=.*' | cut -d= -f2 | base64 -d | protoc --decode_raw
```

The output would look something like this:

```
1 {
  1: "shaw\'arma"
  2: "neko@neko.com"
  3: "neko.com"
  4: 1
  5: 1
  6: 2
}
2: 1
3: 1
5: 4242
```

Here 1.1 is the secret key, 1.2 is subject, 1.3 is issuer, 1.4 = 1 means the algo is SHA1, 1.5 = 1 means the OTP value is 6 digits, 1.6 = 2 means it is TOTP

Now our task is extract secret (in many cases, it would be written as bytes, for example, `\'8U\234...`) and encode it to base32

**WARNING**: If you use dash/zsh or any other shell where `printf` is **not** built-in command, you **must** remove all slashes (`\`) before any symbol which does not have to be escaped.
In this example, remove `\` before the `'` character, so `shaw\'arma` becomes `shaw'arma`:

```bash
printf "shaw'arma" | base32
```

Finally, use oathtool to get the OTP value:

```bash
oathtool --totp -b ONUGC5ZHMFZG2YI=
```

If you need to form `otpauth://` string (do not forget to urlencode):

```bash
otpauth://totp/Label:subject?secret=BASE32SECRET&period=30&digits=6&issuer=neko.com&algorithm=SHA1
```

`digits`=6, `algorithm`=SHA1, `period`=30 are defaults. `issuer` is optional


