#!/bin/sh

if [ -n "$1" ]; then
  URL="$1"
else
  CLIP=$(xclip -selection primary -out)
  if [ -n "$CLIP" ]; then
    URL=$(zenity --entry --text "Enter URL" --entry-text="$CLIP")
  fi
  if [ -z "$URL" ]; then
    URL=$(zenity --entry --text "Enter URL")
  fi
fi
if [ -z "$URL" ]; then
  echo "URL should not be empty"
  exit 1
fi

IFS=$(printf ' \n\t')
TYPE=$(zenity --list \
        --width=400 --height=300 \
        --column=Type \
        "Audio only" "best" "480p" "720p" "1080p")

if [ "$TYPE" == "Audio only" ]; then
    mpv --player-operation-mode=pseudo-gui --no-video --ytdl-format="bestaudio/best[height<=720]/best" $URL
    exit 0
fi

if [ "$TYPE" = "best" ]; then
    mpv "$URL"
    exit 0
fi

H="${TYPE%p}"
mpv --ytdl-format="bestvideo[ext=mp4][height<=$H]+bestaudio
  /bestvideo[height<=$H]+bestaudio
  /best[ext=mp4][height<=$H]
  /best[height<=$H]
  /best" "$URL"
