tput cnorm

zsh_config_dir="${XDG_CONFIG_HOME}/zsh"
zsh_plugins="${zsh_config_dir}/plugins.zsh"
zsh_plugins_src="${zsh_config_dir}/plugins.txt"

regen_plugins(){
    antidote bundle < $zsh_plugins_src > $zsh_plugins
    echo "Antidote plugins file was updated"
}

. ${XDG_DATA_DIR:-~/.local/share}/antidote/antidote.zsh
[ ! -e $zsh_plugins_src ] && regen_plugins
[ $zsh_plugins_src -nt $zsh_plugins ] && regen_plugins

zstyle ':omz:update' mode disabled

. $zsh_plugins
if [ -e "${zsh_config_dir}/aliases.zsh" ]; then
  . "${zsh_config_dir}/aliases.zsh"
fi
if [ -e "${zsh_config_dir}/aliases-nogit.zsh" ]; then
  . "${zsh_config_dir}/aliases-nogit.zsh"
fi

if [ -d /usr/share/fzf ]; then
. /usr/share/fzf/key-bindings.zsh
. /usr/share/fzf/completion.zsh
fi

autoload -Uz compinit
compinit

eval "$(zoxide init zsh)"

