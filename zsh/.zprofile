export PATH=$PATH:$HOME/scripts:$HOME/bin
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR=nvim
export LANG=en_US.UTF-8
export SSH_AUTH_SOCK="/run/user/$(id -u)/ssh-agent"

[ -e ~/.start_usertree ] && ~/.start_usertree

