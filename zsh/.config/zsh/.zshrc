tput cnorm

zsh_config_dir="${ZDOTDIR:-${XDG_CONFIG_HOME}/zsh}"
zsh_plugins="${zsh_config_dir}/plugins.zsh"
zsh_plugins_src="${zsh_config_dir}/plugins.txt"

regen_plugins(){
    antidote bundle < $zsh_plugins_src > $zsh_plugins
    echo "Antidote plugins file was updated"
}

. ${XDG_DATA_DIR:-~/.local/share}/antidote/antidote.zsh
[ ! -e $zsh_plugins_src ] && regen_plugins
[ $zsh_plugins_src -nt $zsh_plugins ] && regen_plugins

zstyle ':vcs_info:*' enable git

. $zsh_plugins

# All modifications to fpath should be done BEFORE this line
source ~/.cache/antidote/github.com/marlonrichert/zsh-autocomplete/zsh-autocomplete.plugin.zsh
bindkey '^I' menu-select

# All calls to compdef should be done AFTER this line

if [ -e "${zsh_config_dir}/aliases.zsh" ]; then
  . "${zsh_config_dir}/aliases.zsh"
fi
if [ -e "${zsh_config_dir}/aliases-nogit.zsh" ]; then
  . "${zsh_config_dir}/aliases-nogit.zsh"
fi

# Prevent any code from actually running after pasting (do not execute on newline)
set zle_bracketed_paste
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

# Load theme
autoload -Uz promptinit
promptinit
prompt adhde

