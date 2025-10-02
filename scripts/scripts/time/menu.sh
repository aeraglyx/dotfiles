action=$(echo -n "status,today,yesterday,last month" | rofi -sep "," -dmenu -p stuff)

case $action in
    "")
        exit 0 ;;

    "status")
        status=$(cat ~/.local/share/time/status)
        if [[ $status == "" ]]; then
            notify-send "nothing, bro" --urgency=low
        else
            notify-send "$status" --urgency=low
        fi ;;

    "today")
        report=$(python ~/scripts/time/report.py work -d)
        notify-send "$report" --urgency=low ;;

    "yesterday")
        report=$(python ~/scripts/time/report.py work -d -n=1)
        notify-send "$report" --urgency=low ;;

    "last month")
        report=$(python ~/scripts/time/report.py work -m)
        notify-send "$report" --urgency=low ;;

    *)
        notify-send "bruh" --urgency=low ;;
esac
