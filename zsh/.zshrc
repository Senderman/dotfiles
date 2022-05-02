regen-plugins(){
    ~/.antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
}

[[ ! -e ~/.zsh_plugins.sh ]] && regen-plugins

. ~/.zsh_plugins.sh

autoload -Uz compinit
compinit
EDITOR=~/progs/nvim/bin/nvim
alias df='df -h'
alias free='free -h'

alias g='git'
alias nvim=~/progs/nvim/bin/nvim
alias ranger=~/progs/ranger/ranger.py
alias adb=~/progs/adb/adb
alias e=nvim
alias f=ranger

VIMCMD=~/progs/nvim/bin/nvim
DOWNLOAD_DIR=~/Downloads

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
    $VIMCMD logcat*.alog
}

cbr() {
    cd $DOWNLOAD_DIR
    rm -rf bugrep*
    rm -rf sm-pics/*
}
