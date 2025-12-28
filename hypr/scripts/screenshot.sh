#!/bin/bash
DIR="$HOME/Pictures/Screenshots"
NAME="Screenshot-$(date +%F_%H-%M-%S).png"

if [ "$1" = "area" ]; then
    area=$(slurp)
    grim -g "$area" - | tee >(wl-copy) > "$DIR/$NAME"
    notify-send "Screenshot" "Region captured"
else
    grim - | tee >(wl-copy) > "$DIR/$NAME"
    notify-send "Screenshot" "Fullscreen captured"
fi
