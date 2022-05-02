export PATH=$PATH:$HOME/scripts
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR=nvim

# start Xorg on tty1, supervised by s6
tty="$(tty)"
tty="${tty#/dev/tty}"
if  [ -z "$DISPLAY" ] && [ "$tty" = "1" ]; then

    export _JAVA_AWT_WM_NONREPARENTING=1
    export AWT_TOOLKIT=MToolkit
    export XAUTHORITY="$HOME/.Xauthority"
    export DISPLAY=":$tty"
    export DBUS_SESSION_BUS_ADDRESS="unix:abstract=/dbus"

    s6_compdir="$HOME/.s6/rc/compiled" # compiled database directory
    s6_dir="$XDG_RUNTIME_DIR/s6" # s6 data folder (scandir, livedir, logs, etc)
    s6_scandir="$s6_dir/service" # s6 scandir
    s6_livedir="$s6_dir/s6-rc" # s6-rc livedir
    s6_logger_fifo="$s6_scandir/s6-svscan-log/fifo" # fifo where all uncaught messages will go

    mkdir -p "$s6_scandir"
    mkdir -p "$s6_dir/log"
    cp -rL "$HOME/.s6/s6-svscan-log" "$s6_scandir"
    mkfifo "$s6_logger_fifo" 

    setsid -f redirfd -wnb 1 "$s6_logger_fifo" fdmove -c 2 1 s6-svscan "$s6_scandir"
    s6-rc-init -c "$s6_compdir" -l "$s6_livedir" "$s6_scandir"
    s6-rc -l "$s6_livedir" -u change default
fi

