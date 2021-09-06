ZSH_THEME="fox" # set by `omz`

regen-plugins(){
    antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
}

[[ ! -e ~/.zsh_plugins.sh ]] && regen-plugins

. ~/.zsh_plugins.sh
. /usr/share/fzf/key-bindings.zsh
. /usr/share/fzf/completion.zsh

autoload -Uz compinit
compinit

alias aurstore='yay -Salq | fzf --multi --preview "yay -Sai {1}" | xargs -ro yay -S'
alias df='df -h'
alias free='free -h'
alias g='git'
alias pacstore='pacman -Slq | fzf --multi --preview "pacman -Si {1}" | xargs -ro sudo pacman -S'
alias trr='transmission-remote'
