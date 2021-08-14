#!/usr/bin/bash
text=$(xclip -o -selection-primary)
translated=$(trans -b :ru "$text")
#notify-send "Перевод" "$translated"
zenity --info --text="$translated" --title="Перевод" --width=350
