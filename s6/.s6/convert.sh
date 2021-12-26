#!/bin/sh

# Script to convert old s6 format to the new one

cd "$(dirname "$0")"
s6dir="$(pwd)"
svdir="${s6dir}/sv"
cd "$svdir" || exit

for srv in *; do
    cd "${svdir}/$srv" || continue
    if [ -e contents ]; then
        oldfile=contents
    elif [ -e dependencies ]; then
        oldfile=dependencies
    else
        continue 
    fi

    mkdir "${oldfile}.d"
    cat < "$oldfile" | while IFS= read -r c ; do 
        touch "${oldfile}.d/$c"
    done
    rm "$oldfile"
done
