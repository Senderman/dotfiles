alias pacstore='doas pacman -Slq | fzf --multi --preview "pacman -Si {1}" | xargs -ro doas pacman -S'
alias pacin='doas pacman -S'
alias pacrem='doas pacman -Rns'
alias pacrmdeps='doas pacman -Rns $(pacman -Qdtq)'
alias pacupg='doas pacman -Syu'

alias aurstore='yay -Salq | fzf --multi --preview "yay -Sai {1}" | xargs -ro yay -S'
alias yain='yay -S'
alias yaupg='yay -Sau'

alias df='df -h -x tmpfs -x devtmpfs'
alias free='free -h'

alias e=$EDITOR
alias g='git'
alias f='ranger'
alias trr='transmission-remote'
alias s6-rc-user="s6-rc -l $XDG_RUNTIME_DIR/s6/s6-rc"
alias gen_psw="od -An -N16 -tx /dev/urandom | tr -d ' '"

which doas && alias sudo='doas'

