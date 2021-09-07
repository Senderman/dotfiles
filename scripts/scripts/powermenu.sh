#!/bin/sh
selection=$(printf "%s\n" poweroff reboot hibernate suspend | dmenu -l 4)
[ -n "$selection" ] && loginctl "$selection"
