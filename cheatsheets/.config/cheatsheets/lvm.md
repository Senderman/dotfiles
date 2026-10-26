# Add PV to VG, PV must be created before

```bash
vgextend vgname /dev/sdb
```

# Remove PV from VG

```bash
# Move data from PV
pvmove /dev/sdb
vgreduce vgname /dev/sdb
```

# Deactivate VG, do this when you want to physically remove device

```bash
vgchange --activate n vg0
```

# Create LV

```bash
lvcreate -L 10G -n name vgname
```

# Create LV with the rest of VG's capacity

```bash
lvcreate -l 100%FREE -n name vgname
```

# Create snapshot

```bash
lvcreate -s -L 10G -n snapshotname vgname/lvname
```

# Rollback LV to the snapshot

Can be done online, but would need reboot after

```bash
lvconvert --merge /dev/vgname/lvname
```

# Resize LV

-r (--resizefs) only for ext2/3/4 and xfs

```bash
lvresize -L +10G -r vgname/lvname
```

# Same but fill all the free space on a volume group

```bash
lvresize -l +10G%FREE -r vgname/lvname
```

# Reduce LV size, FS must be resized first!

```bash
lvresize -L -10G vgname/lvname
```

