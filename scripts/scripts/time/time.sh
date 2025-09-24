type="work"

time_dir=$XDG_DATA_HOME/time
status_file=$time_dir/status
data_file=$time_dir/data/$type

if [ ! -d $time_dir ]; then
    mkdir -p $time_dir/data
    touch $status_file
fi

if [ ! -f $data_file ]; then
    touch $data_file
fi

if [[ ! -s $status_file ]]; then
    echo -n "$(date --iso-8601=s)" >> $data_file
    echo "$type" > $status_file
else
    echo "/$(date --iso-8601=s)" >> $data_file
    echo -n > $status_file
fi
