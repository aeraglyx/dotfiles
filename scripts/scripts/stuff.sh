choices="weather
time
countdown
serve website
translate czech > en
translate english > cz
reboot"

action=$(echo -n "$choices" | rofi -sep "\n" -dmenu -p stuff)

case $action in
    "")
        exit 0 ;;

    "reboot")
        # reboot ;;
        ;;
    "time")
        sh ~/scripts/time/menu.sh ;;

    "countdown")
        # countdown() {
        #     start="$(( $(date +%s) + $1 * 60))"
        #     while [ "$start" -ge "$(date +%s)" ]; do
        #         ## Is this more than 24h away?
        #         days="((( $start - $(date +%s) ) * 1 ) / 86400)"
        #         time="$start - $(date +%s)"
        #         printf '%s day(s) and %s\r' "$days" "$(date -u -d "@$time" +%H:%M:%S)"
        #         sleep 1.0
        #     done
        # }
        time_minutes="$(rofi -dmenu -p "minutes" -l 0)"
        sleep $((time_minutes * 60))
        notify-send "it's time, bro" --urgency=critical ;;

    "translate czech > en")
        in="$(rofi -dmenu -p "cz" -l 0)"
        out=$(trans -brief -s cs -t en "$in")
        notify-send "$out" --urgency=low ;;

    "translate english > cz")
        in="$(rofi -dmenu -p "en" -l 0)"
        out=$(trans -brief -s en -t cs "$in")
        notify-send "$out" --urgency=low ;;

    "serve website")
        zola --root ~/projects/website serve &
        chromium --app=http://127.0.0.1:1111/ ;;

    "weather")
        weather_fmt=$(curl "wttr.in/?format=temp:+%t\nfeel:+%f\nrain:+%p\nwind:+%w")
        notify-send "$weather_fmt" ;;

    *)
        notify-send "bruh" --urgency=low ;;
esac
