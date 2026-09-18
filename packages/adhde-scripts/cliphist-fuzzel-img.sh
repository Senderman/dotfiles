#!/usr/bin/env bash
# Source: https://github.com/sentriz/cliphist/blob/6eda526d02119ebc09ec0f64b0a96ed4540f5a83/contrib/cliphist-fuzzel-img

thumbnail_dir="${XDG_RUNTIME_DIR}/cliphist_thumbnails"

cliphist_list=$(cliphist list)
if [ -z "$cliphist_list" ]; then
  fuzzel -d --prompt-only "cliphist: please store something first "
  rm -rf "$thumbnail_dir"
  exit
fi

[ -d "$thumbnail_dir" ] || mkdir -p "$thumbnail_dir"

# Write binary image to cache file if it doesn't exist
read -r -d '' thumbnail <<EOF
/^[0-9]+\s<meta http-equiv=/ { next }
match(\$0, /^([0-9]+)\s(\[\[\s)?binary.*(jpg|jpeg|png|bmp)/, grp) {
  cliphist_item_id=grp[1]
  ext=grp[3]
  thumbnail_file=cliphist_item_id"."ext
  system("[ -f ${thumbnail_dir}/"thumbnail_file" ] || echo " cliphist_item_id "\\\\\t | cliphist decode >${thumbnail_dir}/"thumbnail_file)
  print \$0"\0icon\x1f${thumbnail_dir}/"thumbnail_file
  next
}
1
EOF

item=$(echo "$cliphist_list" | gawk "$thumbnail" | fuzzel -d --mesg "Clipboard history" --width 60 --no-sort --with-nth 2)

[ -z "$item" ] || echo "$item" | cliphist decode | wl-copy

# Delete cached thumbnails that are no longer in cliphist db
find "$thumbnail_dir" -type f | while IFS= read -r thumbnail_file; do
  cliphist_item_id=$(basename "${thumbnail_file%.*}")
  if ! grep -q "^${cliphist_item_id}\s\[\[ binary data" <<<"$cliphist_list"; then
    rm "$thumbnail_file"
  fi
done
