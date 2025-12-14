# clipboard.yazi
Copy files to the clipboard

## dependcy
-  Windows:powershell
-  Linux x11 : xclip
- Linux wayland : wl-clipboard,xclip(xwayland)

> [!NOTE]
> You need yazi 3.x for this plugin to work.


## Configuration

Copy or install this plugin and add the following keymap to your `manager.prepend_keymap`:

```toml
on = "<C-y>"
run = ["plugin clipboard"]
```

