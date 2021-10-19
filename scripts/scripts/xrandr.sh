#!/bin/sh
sel=$(printf "\
xrandr --output eDP-1 --auto --output HDMI-1-0 --auto --left-of eDP-1\n\
xrandr --output eDP-1 --auto --output HDMI-1-0 --auto --right-of eDP-1\n\
xrandr --output eDP-1 --auto --output HDMI-1-0 --off\
" | dmenu -l 3)

[ -n "$sel" ] && $sel
