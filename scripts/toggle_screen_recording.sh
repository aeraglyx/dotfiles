if pgrep "gpu-screen-reco" > /dev/null; then
    pkill -SIGINT "gpu-screen-reco"
else
    gpu-screen-recorder -w portal -restore-portal-session yes -f 30 -o ~/Videos/rec_$(date +"%Y%m%dT%H%M%S").mp4
fi
