menu_src=$(python ~/scripts/bookmarks/menu.py)

bookmark=$(echo "$menu_src" | awk 'BEGIN{FS=OFS=" "}{NF--; print}' | rofi -dmenu -i -p "bookmarks" -markup-rows)
url=$(echo "$menu_src" | awk -v sel="$bookmark" '$0 ~ "^"sel" " {print $NF}')

wl-copy $url
notify-send "Copied to Clipboard" $url
