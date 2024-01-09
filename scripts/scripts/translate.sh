#!/bin/sh
text=$(xsel -o)
translated=$(trans -b :ru "$text")
printf "$translated" | xsel -ib
notify-send "Translation was copied to the clipboard"
exec zenity --info --text="$translated" --title='Translation' --width=350
