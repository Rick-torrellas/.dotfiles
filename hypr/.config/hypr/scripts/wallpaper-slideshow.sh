#!/bin/bash
echo "Starting wallpaper slideshow..."
# Define la variable WALLPAPER_DIR con el primer argumento pasado al script
# Si no se proporciona un argumento, usa la ruta por defecto
if [ -z "$1" ]; then
    echo "No directory specified, using default: $HOME/.local/share/wallpapers/"
    WALLPAPER_DIR="$HOME/.local/share/wallpapers/"
else
echo "Using specified directory: $1"
    WALLPAPER_DIR="$1"
fi

# Array de formatos de archivo
formats=("jpg" "jpeg" "png" "gif")

# Construye la parte de la búsqueda para el comando find
find_options=""
for format in "${formats[@]}"; do
    find_options+=" -o -name \"*.$format\""
done

formats=("jpg" "jpeg" "png" "gif")

while true; do
    find_args=()
    for format in "${formats[@]}"; do
        find_args+=( -o -iname "*.${format}" )
    done
    # Elimina el primer -o
    find_args=("${find_args[@]:1}")

    random_wallpaper=$(find "$WALLPAPER_DIR" -type f \( "${find_args[@]}" \) | shuf -n 1)
    echo "Selected wallpaper: $random_wallpaper"
    if [[ -n "$random_wallpaper" ]]; then
        swww img "$random_wallpaper" --transition-type fade
    fi
    sleep 900
done