#!/bin/bash

SCRIPT="$HOME/.config/hypr/scripts/wallpaper-slideshow.sh"
DIR="$1"
PIDFILE="/tmp/wallpaper-slideshow.pid"

if [ ! -x "$SCRIPT" ]; then
    notify-send "Error: El script $SCRIPT no existe o no es ejecutable"
    exit 1
fi

if [ -z "$DIR" ]; then
    notify-send "Error: Debes indicar un directorio"
    exit 1
fi

notify-send "togle-wallpaper-slideshow.sh"
notify-send "Argumento: $DIR"

if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
    kill "$(cat "$PIDFILE")"
    rm "$PIDFILE"
    notify-send "Wallpaper slideshow detenido"
else
    bash "$SCRIPT" "$DIR" > /tmp/wallpaper-slideshow.log 2>&1 &
    echo $! > "$PIDFILE"
    notify-send "Wallpaper slideshow iniciado $!"
fi