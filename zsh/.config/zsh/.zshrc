tput cnorm

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

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

# Emacs mode
bindkey -e

# Plugins and modules settings
zstyle ':vcs_info:*' enable git
zstyle ':autocomplete:*' add-semicolon no
zstyle ':autocomplete:*' delay 0.4  # seconds (float)
# disable share pushd stack from zsh-autocomplete plugin
chpwd_recent_filehandler() {
    reply=()
}

. $zsh_plugins

# All modifications to fpath should be done BEFORE this line
source ~/.cache/antidote/github.com/marlonrichert/zsh-autocomplete/zsh-autocomplete.plugin.zsh # this also calls  compinit
bindkey '^I' menu-select
source ~/.cache/antidote/github.com/ohmyzsh/ohmyzsh/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh

# All calls to compdef should be done AFTER this line

if [ -e "${zsh_config_dir}/aliases.zsh" ]; then
  . "${zsh_config_dir}/aliases.zsh"
fi
if [ -e "${zsh_config_dir}/aliases-nogit.zsh" ]; then
  . "${zsh_config_dir}/aliases-nogit.zsh"
fi

# Completions
eval "$(zoxide init zsh)"
eval "$(tv init zsh)"
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

# Report CWD to terminal emulator via OSC-7 escape sequence
function _osc7-pwd() {
    emulate -L zsh # also sets localoptions for us
    setopt extendedglob
    local LC_ALL=C
    printf '\e]7;file://%s%s\e\' $HOST ${PWD//(#m)([^@-Za-z&-;_~])/%${(l:2::0:)$(([##16]#MATCH))}}
}

function _chpwd-osc7-pwd() {
    (( ZSH_SUBSHELL )) || _osc7-pwd
}
add-zsh-hook -Uz chpwd _chpwd-osc7-pwd

# Prevent any code from actually running after pasting (do not execute on newline)
set zle_bracketed_paste
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

# Load theme
autoload -Uz promptinit
promptinit
prompt adhde

