#!/usr/bin/bash

# Script to show system info (battery, volume, date, kb layout, etc) in DWM bar

layout(){
    t=$(xset -q | grep LED)
    code=${t##*mask:  }
    if [[ $code -eq "00000000" ]]; then
	    result="🇺🇸"
    else
	    result="🇷🇺"
    fi
    echo $result
}

fdate(){
    date +"%x %H:%M"
}

bat(){
    cat /sys/class/power_supply/BAT0/capacity
}

volume(){
    awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master)
}

light(){
    xbacklight -get
}

fnet(){
	nmout=$(nmcli -t -f NAME,TYPE con show --active)
	conn=$( echo "$nmout" | grep ethernet)
	if [[ "$conn" != "" ]]; then
		act_conn="Eth"
	else
		conn=$( echo "$nmout" | grep wireless)
		if [[ "$conn" != "" ]]; then
			act_conn="${conn%:*}"
		else
			act_conn="No conn"
		fi
	fi
	echo $act_conn
}

generate_content(){
	echo "📶$(fnet)|☀️$(light)%|🔈$(volume)|🔋$(bat)%|$(layout)|$(fdate)"
}

while true; do
    xsetroot -name "$(generate_content)"
    sleep 1m
done

