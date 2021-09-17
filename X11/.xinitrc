#!/usr/bin/bash

xrdb ~/.Xresources

# Fix for java applications
export _JAVA_AWT_WM_NONREPARENTING=1 
export AWT_TOOLKIT=MToolkit 
wmname LG3D
touchpad="DELL09E1:00 04F3:30CB Touchpad"
# Enable touchpad tap
xinput set-prop "$touchpad" "libinput Tapping Enabled" 1
# Enable natural touchpad scrolling
xinput set-prop "$touchpad" "libinput Natural Scrolling Enabled" 1

# Set layout switch to Win+Space
setxkbmap -layout us,ru -option "grp:win_space_toggle"

# Set wallpaper
feh --bg-scale --randomize ~/Pictures/Wallpapers/*

# Additional programs and daemons
redshift -P -O 4000
picom &
dunst &
sxhkd &
CM_MAX_CLIPS=15 CM_SELECTIONS=clipboard clipmenud &

# Configure screen locker
xss-lock slock &
xset s on
xset s 600 # lock screen after 10 minutes of incactivity

# start pipewire if not started
if [ -z "$(pgrep pipewire)" ]; then
    pipewire &
    pipewire-pulse &
    pipewire-media-session &
fi

session="$1"
# Background scripts
pkill battery.sh
battery.sh &
$HOME/Projects/python/ranger-dbus/run.sh &

case "$session" in
    dwm)
        pkill bar.sh
        bar.sh &
        ;;
    openbox)
        polybar openbox &
        ;;
esac

# Run WM
while true; do
    $session
done
