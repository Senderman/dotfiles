#!/bin/bash

# Script to show system info (battery, volume, date, kb layout, etc) in DWM bar

layout(){
    t=$(xset -q | grep LED)
    mask="${t##*mask:  }"
    [ "${mask:4:1}" -eq 0 ] && echo EN || echo RU
}

fdate(){
    date +"%d.%m %I:%M %p"
}

bat(){
    cat /sys/class/power_supply/BAT0/capacity
}

volume(){
    v=$(pamixer --get-volume-human)
    [ "$v" = 'muted' ] && echo OFF || echo "$v"
}

light(){
    xbacklight -get
}

fnet_iwd(){
    wlan_dev="wlan0"

    iw_out="$(iwctl station $wlan_dev show | grep 'Connected network' | xargs)"
    [ -n "$iw_out" ] && echo "${iw_out#Connected network }" || echo "No Wi-Fi"
}

fnet_nm(){
    nmout=$(nmcli -t -f NAME,TYPE con show --active)
	conn=$(echo "$nmout" | grep ethernet)
	if [ -n "$conn" ]; then
		act_conn="Eth"
	else
		conn=$(echo "$nmout" | grep wireless)
		if [ -n "$conn" ]; then
			act_conn="${conn%:*}"
		else
			act_conn="No conn"
		fi
	fi
	echo "$act_conn"
}

nowplaying(){
	v=$(playerctl metadata)
	art=$(echo "$v" | grep 'xesam:artist')
	art=$(echo "${art#*xesam:artist}" | xargs)
	title=$(echo "$v" | grep 'xesam:title')
	title=$(echo "${title#*xesam:title}" | xargs)
	echo "$art - $title"
}

generate_content(){
	echo "| 📶 $(fnet_iwd) | 🔆 $(light)% | 🔊 $(volume) | 🔋 $(bat)% | $(layout) | $(fdate)"
}

while true; do
    xsetroot -name "$(generate_content)"
    sleep 1m
done

