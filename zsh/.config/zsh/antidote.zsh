# Antodote config
local zsh_config_dir="${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}"
local zsh_plugins="${zsh_config_dir}/plugins.zsh"
local zsh_plugins_src="${zsh_config_dir}/plugins.txt"
local antidote_location="${XDG_DATA_DIR:-${HOME}/.local/share}/antidote"
export ANTIDOTE_HOME="${XDG_DATA_DIR:-${HOME}/.local/share}/antidote_bundles"

get_antidote() {
    git clone --depth=1 https://github.com/mattmc3/antidote.git "${antidote_location}"
}

# No need to load antidote on shell startup - plugins file is enough
# But we leave a function for user to run it
source_antidote(){
    . ${XDG_DATA_DIR:-~/.local/share}/antidote/antidote.zsh
}

regen_plugins(){
    source_antidote
    antidote bundle < $zsh_plugins_src > $zsh_plugins
    echo "Antidote plugins file was updated"
}

# download antidote if not exist
[ ! -d "${antidote_location}" ] && get_antidote

# Generate antidote.zsh when absent or when antidote.txt is newer than antidote.zsh
[ ! -e $zsh_plugins ] && regen_plugins
[ $zsh_plugins_src -nt $zsh_plugins ] && regen_plugins

source $zsh_plugins

