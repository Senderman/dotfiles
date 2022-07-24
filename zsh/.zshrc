PATH=$PATH:~/bin
EDITOR=nvim

regen-plugins(){
    antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
}

[[ ! -e ~/.zsh_plugins.sh ]] && regen-plugins

zstyle ':omz:update' mode disabled

. ~/.zsh_plugins.sh

autoload -Uz compinit
compinit
alias df='df -h'
alias free='free -h'

alias g='git'
alias e=$EDITOR
alias f=ranger
alias ssf='setsid -f'

DOWNLOAD_DIR=~/Download

afixlogfile(){
    [ -e "$1" ] && iconv -c -t UTF-8 "$1" > "$2"
} 

ebr() {
    cd $DOWNLOAD_DIR
    mkdir bugrep
    unzip bugreport-* -d bugrep/
    cd bugrep
    cd bugreport-*
    for i in service_logcat.log*; do
        n="${i##*.log}" # обрезаем все до .log включительно
        n="${n%.}" # убираем точку в конце если есть
        afixlogfile "$i" "logcat$n.alog"
    done
}

cbr() {
    cd $DOWNLOAD_DIR
    rm -rf bugrep*
    rm -rf sm-pics/*
}

