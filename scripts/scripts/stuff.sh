choices="weather
time
countdown
serve website
translate czech > en
translate english > cz
wallpaper"

action=$(echo -n "$choices" | rofi -sep "\n" -dmenu -p stuff)

case $action in
    "")
        exit 0 ;;

    "time")
        sh ~/scripts/time/menu.sh ;;

    "countdown")
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

    "wallpaper")
        sh ~/scripts/wallpaper.sh ;;

    "weather")
        weather_fmt=$(curl "wttr.in/?format=temp:+%t\nfeel:+%f\nrain:+%p\nwind:+%w")
        notify-send "$weather_fmt" ;;

    *)
        notify-send "bruh" --urgency=low ;;
esac
