choices="weather
time / report
calculate
countdown
color picker
calendar
translate / cz to en
translate / en to cz
ocr
wallpaper"

action=$(echo -n "$choices" | rofi -sep "\n" -dmenu -p stuff -sort)

case $action in
    "")
        exit 0
        ;;
    "time / report")
        sh ~/dotfiles/scripts/scripts/time/report.sh
        ;;
    "calculate")
        sh ~/scripts/calc.sh
        ;;
    "countdown")
        time_minutes="$(rofi -dmenu -p "minutes" -l 0)"
        sleep $((time_minutes * 60))
        notify-send "it's time, bro" --urgency=critical
        ;;
    "color picker")
        sleep 0.05 && hyprpicker
        ;;
    "calendar")
        ghostty --class=popup.app.high -e bash -c "python ~/projects/calendar/list.py; exec bash"
        ;;
    "translate / cz to en")
        in="$(rofi -dmenu -p "cz" -l 0)"
        out=$(trans -brief -s cs -t en "$in")
        notify-send "$out" --urgency=low
        ;;
    "translate / en to cz")
        in="$(rofi -dmenu -p "en" -l 0)"
        out=$(trans -brief -s en -t cs "$in")
        notify-send "$out" --urgency=low
        ;;
    "wallpaper")
        sh ~/scripts/wallpaper.sh
        ;;
    "ocr")
        region="$(slurp -c "#8b8b8b" -b "#14141488")"
        grim -g "$region" - | tesseract - - | awk '{$1=$1};1' | wl-copy
        ;;
    "weather")
        weather_fmt=$(curl "wttr.in/?format=temp:+%t\nfeel:+%f\nrain:+%p\nwind:+%w")
        notify-send "$weather_fmt"
        ;;
    *)
        notify-send "bruh" --urgency=low
        ;;
esac
