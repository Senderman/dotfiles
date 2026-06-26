tput cnorm

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

# Antodote config
local zsh_config_dir="${ZDOTDIR:-${XDG_CONFIG_HOME}/zsh}"
local zsh_plugins="${zsh_config_dir}/plugins.zsh"
local zsh_plugins_src="${zsh_config_dir}/plugins.txt"

regen_plugins(){
    antidote bundle < $zsh_plugins_src > $zsh_plugins
    echo "Antidote plugins file was updated"
}

# Generate antidote.zsh when absent or when antidote.txt is newer than antidote.zsh
. ${XDG_DATA_DIR:-~/.local/share}/antidote/antidote.zsh
[ ! -e $zsh_plugins_src ] && regen_plugins
[ $zsh_plugins_src -nt $zsh_plugins ] && regen_plugins

# Emacs mode
bindkey -e

# Plugins and modules settings
zstyle ':vcs_info:*' enable git

source $zsh_plugins

# All modifications to fpath should be done BEFORE this line
autoload -Uz compinit
compinit
# All calls to compdef should be done AFTER this line
source "${zsh_config_dir}/options.zsh"
source "${zsh_config_dir}/termsupport.zsh"
source "${zsh_config_dir}/aliases.zsh"
source "${zsh_config_dir}/completion.zsh"
[ -e "${zsh_config_dir}/aliases-nogit.zsh" ] && source "${zsh_config_dir}/aliases-nogit.zsh"

# Load theme
autoload -Uz promptinit
promptinit
prompt adhde

