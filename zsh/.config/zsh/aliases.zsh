# Command behaviour overrides
alias df='df -h -x tmpfs -x devtmpfs -x efivarfs'
alias free='free -h'
alias wget="wget --hsts-file="${XDG_CACHE_HOME}/wget-hsts""
alias adb='HOME="$XDG_DATA_HOME"/android adb'
alias s3cmd="s3cmd -c "${XDG_CONFIG_HOME}/s3/s3cfg""
alias pc="proxychains -f "${XDG_CONFIG_HOME}/proxychains.conf""
alias fuseiso='fuseiso -n'
alias trr='transmission-remote'
which kubecolor 1>/dev/null 2>/dev/null && alias kubectl='kubecolor' && compdef kubecolor=kubectl

# Use modern utils
alias ls='lsd'
alias l='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias lg='lsd -lg'
alias lt='lsd --tree'
alias cat='bat --theme=base16'
alias diff='delta'
alias cd='z'

# Git aliases and hotkeys
alias g='git'
alias gmc='glab mr create --fill'
alias gma='glab mr approve'

bindkey -s '^Xgc' "git ci ''\C-b"

_git_go_reporoot() {
    zle kill-whole-line
    cd "$(git rev-parse --show-toplevel)"
    zle accept-line
}
zle -N _git_go_reporoot
bindkey '^Xgr' _git_go_reporoot

# Pacman aliases
alias pacin='doas pacman -S'
alias pacrem='doas pacman -Rns'
alias pacupg='doas pacman -Syu'

# Yay aliases
alias yain='yay -S'
alias yaupg='yay -Sau'

# Screen recording
alias gsr='gpu-screen-recorder -w portal'
alias gsr-slurp='gpu-screen-recorder -w $(slurp -f "%wx%h+%x+%y")'

# Zellij
alias za='zellij a -c'

# Neovim is too long
alias e=$EDITOR

# Yazi with cwd update
function f() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# Show all terminal colors
function termcolors() {
    fg='\e[38;5;';bg='\e[48;5;'
    for ix in {1..256}; do
        printf "fg \"%s\e[38;5;%sm%s\e[0mm\"\tbg \"%s\e[48;5;%sm%s\e[0mm\"\n" ${fg} ${ix} ${ix} ${bg} ${ix} ${ix}
    done
    printf "\e[0m"
}

# Completions
eval "$(zoxide init zsh)"
eval "$(tv init zsh)"
eval "$(kubie generate-completion zsh)"
eval "$(gowall completion zsh)"
eval "$(dua completions zsh)"
eval "$(glab completion -s zsh)"

# By default run-help is an alias to man
# This makes it work on shell builtins and other shell features
autoload -Uz run-help
(( ${+aliases[run-help]} )) && unalias run-help
alias help=run-help

