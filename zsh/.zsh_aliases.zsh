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

alias e=$EDITOR
alias g='lazygit'
alias git-find-deleted-paths='git log --diff-filter=D --summary | grep delete | grep'
alias git-find-deleted-log='git log --oneline --follow --'
alias git-br-cleanup='git branch | rg -v "master|main" | cut -c 3- | gum choose --no-limit | xargs git branch -D'
alias trr='transmission-remote'

which kubecolor 1>/dev/null 2>/dev/null && alias kubectl='kubecolor' && compdef kubecolor=kubectl
alias hl='highlight --style nord'

function f() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

