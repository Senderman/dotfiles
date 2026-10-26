# Generate keystore

```bash
keytool -genkey -v -keystore my-release-key.jks -alias alias_name -keyalg RSA -keysize 2048 -validity 10000
```

# Align apk file

```bash
zipalign -P 16 -f -v 4 infile.apk outfile.apk
```

# Sign

```bash
apksigner sign --ks keystore.jks app.apk
```

# Verify

```bash
apksigner verify app.apk
```

# Fix INSTALL_FAILED_UPDATE_INCOMPATIBLE signatures do not match even if app is uninstalled

```bash
adb shell pm uninstall com.pkg.name
```

