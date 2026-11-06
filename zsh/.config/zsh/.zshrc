tput cnorm

local zsh_config_dir="${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}"

# Emacs mode
bindkey -e

# Plugins and modules settings
zstyle ':vcs_info:*' enable git

# Load antidote and plugins
source "${zsh_config_dir}/antidote.zsh"

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# All modifications to fpath should be done BEFORE this line
autoload -Uz compinit
compinit
# All calls to compdef should be done AFTER this line
source "${zsh_config_dir}/aliases.zsh"
[ -e "${zsh_config_dir}/aliases-nogit.zsh" ] && source "${zsh_config_dir}/aliases-nogit.zsh"

# Additional modules
autoload -Uz zcalc

# Command completions
command -v zoxide > /dev/null && eval "$(zoxide init zsh)"
command -v tv > /dev/null && eval "$(tv init zsh)"
command -v kubie > /dev/null && eval "$(kubie generate-completion zsh)"
command -v gowall > /dev/null && eval "$(gowall completion zsh)"
command -v dua > /dev/null && eval "$(dua completions zsh)"
command -v dive > /dev/null && eval "$(dive completion zsh)"

# Load theme
autoload -Uz promptinit
promptinit
prompt adhde cyan noclock

