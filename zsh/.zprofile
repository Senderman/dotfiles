export PATH=$PATH:$HOME/scripts:$HOME/bin
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR=nvim
export LANG=en_US.UTF-8
export SSH_AUTH_SOCK="/run/user/$(id -u)/ssh-agent"
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt # for python

[ -e ~/.start_usertree ] && ~/.start_usertree

