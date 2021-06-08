. /usr/share/zsh/share/antigen.zsh

alias df='df -h'
alias free='free -h'

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle archlinux
antigen bundle extract
antigen bundle sudo
antigen bundle colored-man-pages
antigen bundle colorize
antigen bundle systemd

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search

# Load the theme.
antigen theme fox

# Tell Antigen that you're done.
antigen apply
