#!/bin/sh
selection=$(printf "%s\n" poweroff reboot hibernate suspend | rofi -dmenu -p "Shutdown menu")
[ -n "$selection" ] && loginctl "$selection"
