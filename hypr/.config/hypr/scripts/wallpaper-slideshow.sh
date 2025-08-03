#!/bin/bash

# Define la variable WALLPAPER_DIR con el primer argumento pasado al script
# Si no se proporciona un argumento, usa la ruta por defecto
if [ -z "$1" ]; then
    WALLPAPER_DIR="$HOME/.local/share/wallpapers/"
else
    WALLPAPER_DIR="$1"
fi

# Array de formatos de archivo
formats=("jpg" "jpeg" "png" "gif")

# Construye la parte de la búsqueda para el comando find
find_options=""
for format in "${formats[@]}"; do
    find_options+=" -o -name \"*.$format\""
done

# Elimina el primer '-o' que sobra
find_options=${find_options:4}

while true; do
    # Busca una imagen aleatoria en el directorio con los formatos especificados
    random_wallpaper=$(find "$WALLPAPER_DIR" -type f \( $find_options \) | shuf -n 1)

    # Si se encontró una imagen, llama a swww para aplicarla
    if [[ -n "$random_wallpaper" ]]; then
        swww img "$random_wallpaper" --transition-type fade # TODO: colocar el efecto de la transicion en una variable para poder cambiarlo con un argumento
    fi

    # Espera 15 minutos (900 segundos)
    sleep 900
done