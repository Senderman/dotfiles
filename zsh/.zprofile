export PATH=$PATH:$HOME/scripts
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR=nvim

# start Xorg on tty1
[ -z "$DISPLAY"] && [ "$XDG_VTNR" = 1 ] && sx sh ~/.xinitrc

