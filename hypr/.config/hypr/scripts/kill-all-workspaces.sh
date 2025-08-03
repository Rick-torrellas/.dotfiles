#!/bin/bash

# Obtiene el ID del espacio de trabajo activo
active_workspace_id=$(hyprctl activeworkspace -j | jq '.id')

# Obtiene una lista de direcciones de las ventanas en ese espacio de trabajo
clients_on_workspace=$(hyprctl clients -j | jq --raw-output ".[] | select(.workspace.id == $active_workspace_id) | .address")

# Recorre la lista de direcciones y cierra cada ventana
for client in $clients_on_workspace; do
    hyprctl dispatch closewindow "address:$client"
done