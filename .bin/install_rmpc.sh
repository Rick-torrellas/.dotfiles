#!/bin/bash

function install_rmpc {
	PAQUETE="python"

	if pacman -Q "$PAQUETE" &> /dev/null; then
    echo "El paquete $PAQUETE está instalado."
	return 1  # el paquete ya esta instalado
	else 
	sudo pacman -S rmpc
	systemctl --user enable mpd.service
    systemctl --user start mpd.service
	return 0
	fi
}

install_rmpc
