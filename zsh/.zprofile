export PATH=$PATH:$HOME/scripts
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR=nvim
ramdir="/tmp/$(id -u)"
mkdir -p "$ramdir"
export DBUS_SESSION_BUS_ADDRESS="unix:abstract=$ramdir/dbus"

# start Xorg on tty1, supervised by s6
if  [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then

    export _JAVA_AWT_WM_NONREPARENTING=1
    export AWT_TOOLKIT=MToolkit
    export XAUTHORITY="$HOME/.Xauthority"
    export DISPLAY=":$XDG_VTNR"

    s6dir="$HOME/.s6"
    s6compdir="$s6dir/db/compiled"
    s6sourcedir="$s6dir/source"

    s6ramdir="$ramdir/s6"
    s6scandir="$s6ramdir/scandir"
    s6livedir="$s6ramdir/live"

    mkdir -p "$s6scandir"
    s6-svscan "$s6scandir" &
    s6-rc-init -c "$s6compdir" -l "$s6livedir" "$s6scandir"
    s6-rc -l "$s6livedir" -u change default
fi

