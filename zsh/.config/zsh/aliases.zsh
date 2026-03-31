# Command behaviour overrides
alias df='df -h -x tmpfs -x devtmpfs -x efivarfs'
alias free='free -h'
alias wget="wget --hsts-file="${XDG_CACHE_HOME}/wget-hsts""
alias adb='HOME="$XDG_DATA_HOME"/android adb'
alias s3cmd="s3cmd -c "${XDG_CONFIG_HOME}/s3/s3cfg""
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

# Git aliases
alias g='git'
alias g-copybranch='git branch --show-current | wl-copy -n'
alias g-remove-merged-branches='git branch --merged | fzf --multi --preview "git show {1}" | xargs -r git branch -d'
alias g-remove-unmerged-branches='git branch --no-merged master | fzf --multi --preview "git show {1}" | xargs -r git branch -D'

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

