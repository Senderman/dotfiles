# Remove package

```bash
dnf remove nginx
```

# Search remote

```bash
dnf search nginx
dnf list available '*nginx*'
dnf info nginx
```

# Search installed

```bash
dnf list installed '*nginx*'
rpm -qa | grep nginx
rpm -q nginx
```

# Info about installed

```bash
rpm -qi nginx
```

# List package files

```bash
rpm -ql nginx
```

# Query which local package owns the file

```bash
rpm -qf /path/to/file
```

# Query which remote package owns the file

```bash
dnf provides '*/file'
```

# Update cache

```bash
dnf makecache
dnf -c search/info/list
```

