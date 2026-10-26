# Generate diff via git

```bash
git diff REVISION > file.diff
```

# Generate diff via git for email

```bash
git format-patch --stdout REVISION > file.diff
```

# Generate diff via diff

```bash
cd modified-program-directory/..
diff -up original-program-directory modified-program-directory > file.diff
```

# Apply patch

```bash
patch -p1 < file.diff
```

# Apply patch via git

```bash
git apply file.diff
```

# Apply patch generated via git format-patch

```bash
git am file.diff
```

