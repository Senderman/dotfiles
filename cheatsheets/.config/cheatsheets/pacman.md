# Remove orphans

```bash
pacman -Rns $(pacman -Qdtq)
```

# Find packages installed as deps, but only needed as optional deps

```bash
comm -23 <(pacman -Qdttq | sort) <(pacman -Qdtq | sort)
```

