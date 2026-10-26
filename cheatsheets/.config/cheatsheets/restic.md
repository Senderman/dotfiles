# Environment variables

```
RESTIC_REPOSITORY # path to restic repo
RESTIC_PASSWORD # encryption password
```

# Backup path

```bash
restic backup /path
```

# Restore snapshot (do not create /path/path, restore to /path directly)
# WILL OVERWRITE DATA IN /path AND DELETE FILES NOT IN SNAPSHOT !!!

```bash
restic restore ID:/path --delete --target /path
```

# Dry-run restore

```bash
restic restore ID:/path --dry-run -vv --delete --target /path
```

# Explore snapshots via mount

```bash
restic mount /path
```

# Print file

```bash
restic dump ID /path/to/file
```

