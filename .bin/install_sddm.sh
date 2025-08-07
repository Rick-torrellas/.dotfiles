#!/bin/bash

function _config_package {
    local package = $1
    systemctl --user enable $package.service
    systemctl --user start package.service
    return 0
}

function install_sddm {
    local paquete = $1
    if -Q $paquete ; then
        # verificar si el paque esta configurado
    else 
        sudo pacman -S $paquete
        #verificar si el paquete esta configurado

}