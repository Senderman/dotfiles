# Create a key file

```bash
dd bs=512 count=4 if=/dev/random iflag=fullblock | install -m 0600 /dev/stdin /etc/cryptsetup-keys.d/cryptlvm.key
```

# Add key to the existing lvm

```bash
cryptsetup -v luksAddKey /dev/sda3 /etc/cryptsetup-keys.d/cryptlvm.key
```

