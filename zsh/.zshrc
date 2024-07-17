zsh_plugins=~/.zsh_plugins.zsh

regen-plugins(){
    antidote bundle < ~/.zsh_plugins.txt > $zsh_plugins
}

. ${ZDOTDIR:-~}/.antidote/antidote.zsh
[[ ! -e ~/.zsh_plugins.zsh ]] && regen-plugins

zstyle ':omz:update' mode disabled

. $zsh_plugins
if [ -e ~/.zsh_aliases.zsh ]; then
  . ~/.zsh_aliases.zsh
fi
if [ -e ~/.zsh_aliases-nogit.zsh ]; then
  . ~/.zsh_aliases-nogit.zsh
fi
if [ -d /usr/share/fzf ]; then
. /usr/share/fzf/key-bindings.zsh
. /usr/share/fzf/completion.zsh
fi

autoload -Uz compinit
compinit

# . <(git lfs completion zsh)
