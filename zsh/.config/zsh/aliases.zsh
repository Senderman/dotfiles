alias pacstore='pacman -Slq | fzf --multi --preview "pacman -Si {1}" | xargs -ro doas pacman -S'
alias pacin='doas pacman -S'
alias pacrem='doas pacman -Rns'
alias pacrmdeps='doas pacman -Rns $(pacman -Qdtq)'
alias pacupg='doas pacman -Syu'

alias aurstore='yay -Salq | fzf --multi --preview "yay -Sai {1}" | xargs -ro yay -S'
alias yain='yay -S'
alias yaupg='yay -Sau'

alias df='df -h -x tmpfs -x devtmpfs -x efivarfs'
alias free='free -h'
alias wget="wget --hsts-file="${XDG_CACHE_HOME}/wget-hsts""
alias s3cmd="s3cmd -c "${XDG_CONFIG_HOME}/s3/s3cfg""
alias fuseiso='fuseiso -n'

alias ls='lsd'
alias l='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias lg='lsd -lg'
alias lt='lsd --tree'

alias e=$EDITOR
alias g='gitui'
alias git-find-deleted-paths='git log --diff-filter=D --summary | grep delete | grep'
alias git-find-deleted-log='git log --oneline --follow --'
alias git-copybranch='git branch --show-current | wl-copy'
alias trr='transmission-remote'
alias bat='bat --theme=base16'

which kubecolor 1>/dev/null 2>/dev/null && alias kubectl='kubecolor' && compdef kubecolor=kubectl

function f() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function termcolors() {
    fg='\e[38;5;';bg='\e[48;5;'
    for ix in {1..256}; do
        printf "fg \"%s\e[38;5;%sm%s\e[0mm\"\tbg \"%s\e[48;5;%sm%s\e[0mm\"\n" ${fg} ${ix} ${ix} ${bg} ${ix} ${ix}
    done
    printf "\e[0m"
}
