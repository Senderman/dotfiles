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
alias za='zellij a -c'
alias e=$EDITOR

# By default run-help is an alias to man
# This makes it work on shell builtins and other shell features
autoload -Uz run-help
(( ${+aliases[run-help]} )) && unalias run-help
alias help=run-help

# [Ctrl-x] Multiline editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M emacs '^X^E' edit-command-line
bindkey -M viins '^X^E' edit-command-line
bindkey -M vicmd '^X^E' edit-command-line

# [Ctrl-RightArrow] - move forward one word
bindkey -M emacs '^[[1;5C' forward-word
bindkey -M viins '^[[1;5C' forward-word
bindkey -M vicmd '^[[1;5C' forward-word

# [Ctrl-LeftArrow] - move backward one word
bindkey -M emacs '^[[1;5D' backward-word
bindkey -M viins '^[[1;5D' backward-word
bindkey -M vicmd '^[[1;5D' backward-word

# [Delete] - delete forward
bindkey -M emacs "^[[3~" delete-char
bindkey -M viins "^[[3~" delete-char
bindkey -M vicmd "^[[3~" delete-char
bindkey -M emacs "^[3;5~" delete-char
bindkey -M viins "^[3;5~" delete-char
bindkey -M vicmd "^[3;5~" delete-char

# Copy current command to clipboard
_copybuffer() {
    printf "%s" "$BUFFER" | wl-copy -n
}
zle -N _copybuffer
bindkey -M emacs '^O' _copybuffer
bindkey -M viins '^O' _copybuffer
bindkey -M vicmd '^O' _copybuffer

# Git aliases and hotkeys
alias g='git'
alias gmc='glab mr create --fill'
alias gma='glab mr approve'

bindkey -M emacs -s '^Xc' "git commit -S -m ''^[[D"
bindkey -M viins -s '^Xc' "git commit -S -m ''^[[D"
bindkey -M vicmd -s '^Xc' "git commit -S -m ''^[[D"

_git_status() {
    zle kill-whole-line
    print
    git status -s
    zle accept-line
}
zle -N _git_status
bindkey -M emacs '^Xs' _git_status
bindkey -M viins '^Xs' _git_status
bindkey -M vicmd  '^Xs' _git_status

_git_addall() {
    zle kill-whole-line
    print
    git add .
    git status -s
    zle accept-line
}
zle -N _git_addall
bindkey -M emacs '^Xa' _git_addall
bindkey -M viins '^Xa' _git_addall
bindkey -M vicmd '^Xa' _git_addall

_git_push(){
    zle kill-whole-line
    print
    git push origin
    zle accept-line
}
zle -N _git_push
bindkey -M emacs '^Xp' _git_push
bindkey -M viins '^Xp' _git_push
bindkey -M vicmd '^Xp' _git_push

_git_diff(){
    zle kill-whole-line
    print
    git diff
    zle accept-line
}
zle -N _git_diff
bindkey -M emacs '^Xd' _git_diff
bindkey -M viins '^Xd' _git_diff
bindkey -M vicmd '^Xd' _git_diff

_git_diff_staged() {
    zle kill-whole-line
    print
    git diff --staged
    zle accept-line
}
zle -N _git_diff_staged
bindkey -M emacs '^Xg' _git_diff_staged
bindkey -M viins '^Xg' _git_diff_staged
bindkey -M vicmd '^Xg' _git_diff_staged

_git_go_reporoot() {
    zle kill-whole-line
    cd "$(git rev-parse --show-toplevel)"
    zle accept-line
}
zle -N _git_go_reporoot
bindkey -M emacs '^Xr' _git_go_reporoot
bindkey -M viins  '^Xr' _git_go_reporoot
bindkey -M vicmd '^Xr' _git_go_reporoot

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

# Terraform aliases
alias tf='terraform'
alias tfa='terraform apply'
alias tfc='terraform console'
alias tfd='terraform destroy'
alias tff='terraform fmt -recursive'
alias tfi='terraform init'
alias tfiu='terraform init -upgrade'
alias tfp='terraform plan'
alias tfv='terraform validate'
alias tfs='terraform state'

# Colored man pages
alias man="LESS_TERMCAP_ue='[00m' \
    LESS_TERMCAP_se='[00m' \
    LESS_TERMCAP_mb='[01;31m' \
    LESS_TERMCAP_md='[01;31m' \
    LESS_TERMCAP_me='[00m' \
    LESS_TERMCAP_so='[01;33m[44m' \
    LESS_TERMCAP_us='[01;32m' \
    PAGER=/usr/bin/less \
    GROFF_NO_SGR=1 \
    man"

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

