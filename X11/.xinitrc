#!/usr/bin/bash

xrdb ~/.Xresources

# Fix for java applications
export _JAVA_AWT_WM_NONREPARENTING=1 
export AWT_TOOLKIT=MToolkit 
wmname LG3D

touchpad="DELL09E1:00 04F3:30CB Touchpad"
xinput set-prop "$touchpad" "libinput Tapping Enabled" 1
xinput set-prop "$touchpad" "libinput Natural Scrolling Enabled" 1

# Set layout switch to Win+Space
setxkbmap -layout us,ru -option "grp:win_space_toggle"

# Set wallpaper
feh --bg-scale --randomize ~/Pictures/Wallpapers/*

# Start pipewire if not started
if [ -z "$(pgrep pipewire)" ]; then
    pipewire &
    pipewire-pulse &
    pipewire-media-session &
fi

# Enable dbus
eval $(dbus-launch --sh-syntax --exit-with-session)

# Programs and daemons
redshift -l '55.752222:37.615556' & # red screen filter
picom & # compositor
dunst & # notification daemon
sxhkd & # hotkey daemon
CM_MAX_CLIPS=15 CM_SELECTIONS=clipboard clipmenud & # clipboard manager

# Background scripts
pkill battery.sh
battery.sh &

# Ranger as default file manager
$HOME/Projects/python/ranger-dbus/run.sh &

# Configure screen locker
xss-lock slock &
xset s on
xset s 600 # lock screen after 10 minutes of inactivity

# Run WM (reload on exit)
while true; do
    dwm
done
