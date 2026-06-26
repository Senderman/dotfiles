zmodload -i zsh/complist

zstyle ':completion:*' completer _extensions _complete _approximate
# Enable cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
# Enable interactive  menu and fuzzy search
zstyle ':completion:*' menu select search
# Completion description
zstyle ':completion:*:*:*:*:descriptions' format '%F{magenta}-- %d --%f'
# Show if the completion tries to correct user's input
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
# Info messages
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
# Show error message when no matches found
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
# Colors on directories
zstyle ':completion:*' list-colors ''
# Colors for and format for kill command
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USERNAME -o pid,user,comm -w -w"
# Group  results
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order alias builtins commands functions 
# // -> /
zstyle ':completion:*' squeeze-slashes true
# pushd dirs as cd -option
zstyle ':completion:*' complete-options true
# Case insensitive, partial-word/substring insensitive completion (ignore case, hyphens, underscores)
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'

unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol     # disable output flow control (^S/^Q)
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word  # do not move the cursor to the word end on completion
setopt always_to_end     # move cursor to the word end after completion is performed

# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit

eval "$(zoxide init zsh)"
eval "$(tv init zsh)"
eval "$(kubie generate-completion zsh)"
eval "$(gowall completion zsh)"
eval "$(dua completions zsh)"

