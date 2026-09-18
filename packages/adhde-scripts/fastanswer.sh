#!/usr/bin/env bash

prefix=${FASTANSWER_STORE_DIR-~/.local/share/fastanswer}
answer_files=( "$prefix"/**/* )
answer_files=( "${answer_files[@]#"$prefix"/}" )

answer=$(printf '%s\n' "${answer_files[@]}" | fuzzel -d --mesg "Fast answer")

[[ -n "$answer" ]] || exit

cat "${prefix}/${answer}" | wl-copy -n

