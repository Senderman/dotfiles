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
source ~/.cache/antidote/github.com/ohmyzsh/ohmyzsh/lib/completion.zsh
source ~/.config/television/cd-autocomplete.zsh
source "${zsh_config_dir}/termsupport.zsh"

if [ -e "${zsh_config_dir}/aliases.zsh" ]; then
  . "${zsh_config_dir}/aliases.zsh"
fi
if [ -e "${zsh_config_dir}/aliases-nogit.zsh" ]; then
  . "${zsh_config_dir}/aliases-nogit.zsh"
fi

# Completions
eval "$(zoxide init zsh)"
eval "$(kubie generate-completion zsh)"
eval "$(gowall completion zsh)"
eval "$(dua completions zsh)"
eval "$(glab completion -s zsh)"

setopt auto_cd                # cd to directory without typing cd
setopt auto_pushd             # make cd push the old directory onto the directory stack
setopt pushd_ignore_dups      # don't push multiple copies of the same directory onto the directory stack.=
setopt pushdminus             # exchanges the meanings of ‘+' and ‘-' when used with a number to specify a directory in the stack
setopt interactivecomments    # recognize comments
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# Load theme
autoload -Uz promptinit
promptinit
prompt adhde

