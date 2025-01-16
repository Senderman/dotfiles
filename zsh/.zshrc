zsh_plugins=~/.zsh_plugins.zsh
zsh_plugins_src=~/.zsh_plugins.txt

regen-plugins(){
    antidote bundle < $zsh_plugins_src > $zsh_plugins
    echo "Antidote plugins file was updated"
}

. ${ZDOTDIR:-~}/.antidote/antidote.zsh
[ ! -e $zsh_plugins_src ] && regen-plugins
[ $zsh_plugins_src -nt $zsh_plugins ] && regen-plugins

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
