export PATH=$PATH:$HOME/scripts
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR=nvim

# Unlock keyring
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# start Xorg on tty1
[ -z "$DISPLAY"] && [ "$XDG_VTNR = 1" ] && sx sh ~/.xinitrc
