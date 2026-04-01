time_dir=$XDG_DATA_HOME/time
status_file=$time_dir/status

if [ ! -d "$time_dir" ]; then
    mkdir -p "$time_dir/data"
    touch "$status_file"
fi

if [[ ! -s $status_file ]]; then
    type=$(
        find "$time_dir/data" -mindepth 1 -printf "%T@_%P\n" |
        sort -nr |
        cut -d'_' -f2- |
        rofi -sep "\n" -dmenu -p "project"
    ) || exit 0

    data_file=$time_dir/data/$type

    if [ ! -f "$data_file" ]; then
        touch "$data_file"
    fi

    echo -n "$(date --iso-8601=s)" >> "$data_file"
    echo "$type" > "$status_file"
else
    data_file=$time_dir/data/$(cat "$status_file")
    echo "/$(date --iso-8601=s)" >> "$data_file"
    echo -n > "$status_file"
fi
