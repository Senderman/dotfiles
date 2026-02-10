# Command behaviour overrides
alias df='df -h -x tmpfs -x devtmpfs -x efivarfs'
alias free='free -h'
alias wget="wget --hsts-file="${XDG_CACHE_HOME}/wget-hsts""
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
alias g-find-deleted-paths='git log --diff-filter=D --summary | grep delete | grep'
alias g-file-log='git log --oneline --follow --'
alias g-copybranch='git branch --show-current | wl-copy -n'
alias g-remove-merged-branches='git branch --merged | fzf --multi --preview "git show {1}" | xargs -r git branch -d'
alias g-remove-unmerged-branches='git branch --no-merged master | fzf --multi --preview "git show {1}" | xargs -r git branch -D'

# Pacman aliases
alias pacstore='pacman -Slq | fzf --multi --preview "pacman -Si {1}" | xargs -ro doas pacman -S'
alias pacin='doas pacman -S'
alias pacrem='doas pacman -Rns'
alias pacrmdeps='doas pacman -Rns $(pacman -Qdtq)'
alias pacupg='doas pacman -Syu'

# Yay aliases
alias aurstore='yay -Salq | fzf --multi --preview "yay -Sai {1}" | xargs -ro yay -S'
alias yain='yay -S'
alias yaupg='yay -Sau'

# Screen recording
alias wfr-silent='wf-recorder -c libx264rgb -F "scale=-2:720" -f'
alias wfr-mic='wf-recorder -c libx264rgb -a -F "scale=-2:720" -f'
alias wfr-audio='usertree u pipewire-loopback && wf-recorder -c libx264rgb -aoutput.wfr -F "scale=-2:720" -f'

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

