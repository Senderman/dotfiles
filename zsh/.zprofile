export PATH=$PATH:$HOME/scripts
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR=nvim
ramdir="/run/user/$(id -u)"
mkdir -p "$ramdir"

# start Xorg on tty1, supervised by s6
tty="$(tty)"
#tty="${tty#/dev/tty/}"
tty=1
if  [ -z "$DISPLAY" ] && [ "$tty" = "1" ]; then

    export _JAVA_AWT_WM_NONREPARENTING=1
    export AWT_TOOLKIT=MToolkit
    export XAUTHORITY="$HOME/.Xauthority"
    export DISPLAY=":$tty"
    export DBUS_SESSION_BUS_ADDRESS="unix:abstract=$ramdir/dbus"

    s6dir="$HOME/.s6"
    s6compdir="$s6dir/rc/compiled"

    s6ramdir="$ramdir/s6"
    s6scandir="$s6ramdir/scandir"
    s6livedir="$s6ramdir/live"

    mkdir -p "$s6scandir"
    mkdir -p "$s6ramdir/log/everything"
    s6-svscan "$s6scandir" 2>&1 | s6-log n3 s2000000 T "$s6ramdir/log/everything" &
    s6-rc-init -c "$s6compdir" -l "$s6livedir" "$s6scandir"
    s6-rc -l "$s6livedir" -u change default
fi

