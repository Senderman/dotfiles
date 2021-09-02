#!/usr/bin/zsh

# Script to show system info (battery, volume, date, kb layout, etc) in DWM bar

layout(){
    t=$(xset -q | grep LED)
    mask="0b${t##*mask:  }"
    not_en_mask="0b00001000"
    [[ $((mask & not_en_mask)) -eq 0 ]] && echo EN || echo RU
}

fdate(){
    date +"%d.%m %I:%M %p"
}

bat(){
    cat /sys/class/power_supply/BAT0/capacity
}

volume(){
    v=$(pamixer --get-volume-human)
    [[ "$v" == "muted" ]] && echo OFF || echo $v
}

light(){
    xbacklight -get
}

fnet(){
    wlan_dev="wlan0"

    cm_out=$(connmanctl technologies | grep ethernet -A 2 | grep Connected | xargs)
    eth_state="${cm_out#*Connected = }"
    if [[ "$eth_state" == "True" ]] ; then
        echo "Eth"
    else
        iw_out="$(iwctl station $wlan_dev show | grep 'Connected network' | xargs)"
        [[ ! -z "$iw_out" ]] && echo "${iw_out#Connected network }" || echo "No conn"
    fi
}

nowplaying(){
	v=$(playerctl metadata)
	art=$(echo "$v" | grep "xesam:artist")
	art=$(echo "${art#*xesam:artist}" | xargs)
	title=$(echo "$v" | grep "xesam:title")
	title=$(echo "${title#*xesam:title}" | xargs)
	echo "$art - $title"
}

generate_content(){
	echo "| 📶 $(fnet) | 🔆 $(light)% | 🔊 $(volume) | 🔋 $(bat)% | $(layout) | $(fdate)"
}

while true; do
    xsetroot -name "$(generate_content)"
    sleep 1m
done

