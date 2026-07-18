tput cnorm

# Antodote config
local zsh_config_dir="${ZDOTDIR:-${XDG_CONFIG_HOME}/zsh}"
local zsh_plugins="${zsh_config_dir}/plugins.zsh"
local zsh_plugins_src="${zsh_config_dir}/plugins.txt"
export ANTIDOTE_HOME="${HOME}/.local/share/antidote_bundles"

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
source "${zsh_config_dir}/aliases.zsh"
[ -e "${zsh_config_dir}/aliases-nogit.zsh" ] && source "${zsh_config_dir}/aliases-nogit.zsh"

# Additional modules
autoload -Uz zcalc

# Command completions
eval "$(zoxide init zsh)"
eval "$(tv init zsh)"
eval "$(kubie generate-completion zsh)"
eval "$(gowall completion zsh)"
eval "$(dua completions zsh)"

# Load theme
autoload -Uz promptinit
promptinit
prompt adhde cyan noclock


