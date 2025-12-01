wall_dir=~/pictures/wallpapers
name_out=wallpaper.jpg
resolution=2560x1440

file_list=$(find "$wall_dir" -mindepth 1 ! -name $name_out -printf "%f\n")
img_name=$(echo "$file_list" | rofi -sep "\n" -dmenu -p stuff)
path_in=$wall_dir/$img_name

magick "$path_in" \
    -resize $resolution^ \
    -gravity center \
    -extent $resolution \
    "$wall_dir/$name_out"
