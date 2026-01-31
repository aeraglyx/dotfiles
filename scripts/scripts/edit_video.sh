duration=$(ffprobe -v quiet -show_entries format=duration -of csv=p=0 "$1")
end=$(awk "BEGIN { print $duration - $4 }")

ffmpeg -y -ss "$3" -to "$end" -i "$1" \
-af "afftdn=nf=-50:nr=13, \
    highpass=f=80, \
    lowpass=f=10000, \
    volume=12dB, \
    acompressor=threshold=-18dB:ratio=2:attack=10:release=200:makeup=2, \
    dynaudnorm=f=200:g=31:p=0.9, \
    pan=stereo|c0=0.5*c0+0.5*c1|c1=0.5*c0+0.5*c1" \
-c:v copy \
-shortest \
"$2"
