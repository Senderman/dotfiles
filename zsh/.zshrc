regen-plugins(){
    antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
}

[[ ! -e ~/.zsh_plugins.sh ]] && regen-plugins

zstyle ':omz:update' mode disabled

. ~/.zsh_plugins.sh
. ~/.zsh_aliases.sh
. /usr/share/fzf/key-bindings.zsh
. /usr/share/fzf/completion.zsh

autoload -Uz compinit
compinit
