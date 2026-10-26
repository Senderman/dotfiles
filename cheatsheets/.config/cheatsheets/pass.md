# Reencrypt data in subdirectory:

```bash
pass init -p <path-to-directory> <gpg-id-1> <gpg-id-2>
```

# Copy line n of entry to clipboard (Line 0 if none if specified):

```bash
pass -c <n> <path-to-data>
```

# Add OTP to an existing secret from the clipboard

```bash
wl-paste -n | qrtool decode | pass otp append <path-to-data>
```

