#!/bin/sh

# Author: vezono <vezono.lab@gmail.com>

# This script helps to move any configuration files into your dotfiles repository in one command

PATH_TO_DOTFILES=~/dotfiles

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: stowlink <file> <category>"
    exit 1
fi

file_to_link=$(readlink -f "$1")
CATEGORY=$2

RELF=$(dirname "$file_to_link")
RELF="${RELF#"$HOME"}"

dotfiling_destination="$PATH_TO_DOTFILES/$CATEGORY$RELF/"

mkdir -p "$dotfiling_destination"
mv "$file_to_link" "$dotfiling_destination"

(cd "$PATH_TO_DOTFILES" && stow "$CATEGORY")

echo "Linked $file_to_link to $dotfiling_destination"

