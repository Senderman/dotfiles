# dotfiles
My personal dotfiles and configs for different software

## Installation
This repo is designed to be used with [GNU Stow](https://www.gnu.org/software/stow/).

To learn how to manage dotfiles using stow, read https://alexpearce.me/2016/02/managing-dotfiles-with-stow.

But here's quick start:

```
cd ~ # you NEED to clone the repo to the $HOME directory
git clone https://github.com/Senderman/dotfiles.git
cd dotfiles
stow openbox
```
This will symlink `~/dotfiles/openbox/*` to `$HOME` . Since you probably have `~/.config` directory, you will get `~/.config/openbox` directory which is symlink to `~/dotfiles/openbox/.config/openbox`:
```
~ $ readlink .config/openbox
  ../dotfiles/openbox/.config/openbox
```

if you want to uninstall symlink, run `stow -d openbox`

You're welcome to fork this repo, edit the dotfiles and add your own and create PR :)
