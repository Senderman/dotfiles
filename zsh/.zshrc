regen-plugins(){
    antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
}

[[ ! -e ~/.zsh_plugins.sh ]] && regen-plugins

. ~/.zsh_plugins.sh
. /usr/share/fzf/key-bindings.zsh
. /usr/share/fzf/completion.zsh

alias aurstore='yay -Salq | fzf --multi --preview "yay -Sai {1}" | xargs -ro yay -S'
alias df='df -h'
alias free='free -h'
alias g='git'
alias pacstore='pacman -Slq | fzf --multi --preview "pacman -Si {1}" | xargs -ro sudo pacman -S'
alias udi='udisksctl info -b'
alias udm='udisksctl mount -b'
alias udp='udisksctl power-off -b'
alias udu='udisksctl unmount -b'
alias vim='nvim'
alias w-add='nmcli device wifi connect'
alias w-connect='nmcli con up'
alias w-list='nmcli device wifi list'
alias w-scan='nmcli device wifi rescan'
alias w='nmcli radio wifi'
