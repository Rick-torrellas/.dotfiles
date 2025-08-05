#!/bin/bash

DEBUG=true

if [ "$DEBUG" = true ]; then
    echo "Mensaje de debug"
    notify-send "Mensaje de debug - wallpaper-slideshow.sh"
fi
echo "Starting wallpaper slideshow..."

if [ -z "$1" ]; then
    echo "No directory specified, using default: $HOME/.local/share/wallpapers/"
    WALLPAPER_DIR="$HOME/.local/share/wallpapers/"
else
    echo "Using specified directory: $1"
    WALLPAPER_DIR="$1"
fi

WALLPAPER_DIR="$(readlink -f "$WALLPAPER_DIR")"

# Array de formatos permitidos (en minúsculas)
formats=("jpg" "jpeg" "png" "gif" "bmp" "webp" "tiff" "tif" "svg" "avif" "jfif")

while true; do
    # Obtén una lista de todos los archivos
    mapfile -t all_files < <(find "$WALLPAPER_DIR" -type f)
    random_wallpaper=""

    # Intenta encontrar un archivo válido
    for i in {1..20}; do
        candidate="${all_files[RANDOM % ${#all_files[@]}]}"
        ext="${candidate##*.}"
        ext="${ext,,}" # a minúsculas
        for format in "${formats[@]}"; do
            if [[ "$ext" == "$format" ]]; then
                random_wallpaper="$candidate"
                break 2
            fi
        done
    done

    if [ "$DEBUG" = true ]; then
        notify-send "Selected wallpaper: $random_wallpaper"
        echo "Selected wallpaper: $random_wallpaper"
    fi

    if [[ -n "$random_wallpaper" ]]; then
        swww img "$random_wallpaper" --transition-type fade
    fi
    sleep 900
done