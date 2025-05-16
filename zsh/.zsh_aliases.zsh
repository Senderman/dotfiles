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
alias git-find-deleted-paths='git log --diff-filter=D --summary | grep delete | grep'
alias git-find-deleted-log='git log --oneline --follow --'
alias f='ranger'
alias trr='transmission-remote'
alias s6-rc-user="s6-rc -l $XDG_RUNTIME_DIR/s6/s6-rc -v 2"
alias gen_psw="od -An -N16 -tx /dev/urandom | tr -d ' '"

which doas 1>/dev/null 2>/dev/null && alias sudo='doas'
which kubecolor 1>/dev/null 2>/dev/null && alias kubectl='kubecolor' && compdef kubecolor=kubectl
alias genpass='od -An -N16 -tx /dev/urandom | xargs | tr " " "-"'
alias hl='highlight --style nord'

