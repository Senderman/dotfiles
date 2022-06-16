regen-plugins(){
    antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
}

[[ ! -e ~/.zsh_plugins.sh ]] && regen-plugins

zstyle ':omz:update' mode disabled

. ~/.zsh_plugins.sh
. /usr/share/fzf/key-bindings.zsh
. /usr/share/fzf/completion.zsh

autoload -Uz compinit
compinit

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
