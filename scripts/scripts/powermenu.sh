#!/bin/sh
selection=$(printf "%s\n" poweroff reboot hibernate suspend | dmenu -p "Shutdown menu")
[ -n "$selection" ] && loginctl "$selection"
