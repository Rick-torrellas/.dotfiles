#!/bin/bash

if pgrep -x "wf-recorder" > /dev/null
then
    # Si ya está corriendo, lo mata para detener la grabación.
    pkill -INT wf-recorder
    notify-send "Grabación detenida."
else
    # Si no está corriendo, inicia una nueva grabación del monitor activo.
    DATETIME=$(date +"%Y-%m-%d_%H-%M-%S")
    wf-recorder -f "$HOME/Videos/screencast-$DATETIME.mp4"
    notify-send "Grabación iniciada."
fi