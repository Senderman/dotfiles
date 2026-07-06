# dotfiles
My personal dotfiles and configs for different software

![Preview](./showcase/image.png)

## Installation
This repo is designed to be used with [GNU Stow](https://www.gnu.org/software/stow/).

To learn how to manage dotfiles using stow, read https://alexpearce.me/2016/02/managing-dotfiles-with-stow.

But here's quick start:

```
cd ~ # you should clone the repo to the $HOME directory because this is how stow works
git clone https://github.com/Senderman/dotfiles.git
cd dotfiles
stow openbox
```
This will symlink `~/dotfiles/openbox/*` to `$HOME` . Since you probably have `~/.config` directory, you will get `~/.config/openbox` directory which is symlink to `~/dotfiles/openbox/.config/openbox`:
```
~ $ readlink .config/openbox
  ../dotfiles/openbox/.config/openbox
```

if you want to uninstall symlink, run `stow -D waybar`

You're welcome to fork this repo, edit the dotfiles and add your own and create PR :)

## Move your config files to the dotfiles repository

This repository contains a script called [stowlink](scripts/.local/scripts/stowlink) which can help you to move your configuration files to the dotfiles repository in one command.

E.g. if you want to move and symlink your waybar config to the dotfiles repository, all you need to do is simply run `stowlink .config/polybar waybar`

Many thanks to [Vezono](https://github.com/vezono) for this script!

