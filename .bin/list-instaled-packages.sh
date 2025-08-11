#!/bin/bash

hogar=$HOME/.dotfiles

pacman -Qe | awk '{print $1}' | sort > $hogar/pacman-installed-explicit.txt

pacman -Q | awk '{print $1}' | sort > $hogar/pacman-installed.txt

pacman -Qd | awk '{print $1}' | sort > $hogar/pacman-installed-depencies.txt

yay -Q | awk '{print $1}' | sort > $hogar/yay-installed.txt

yay -Qe | awk '{print $1}' | sort > $hogar/yay-installed-explicit.txt

yay -Qd | awk '{print $1}' | sort > $hogar/yay-installed-depencies.txt

# Paquetes instalados del AUR
yay -Q --aur | awk '{print $1}' | sort > $hogar/yay-installed-aur.txt

# Paquetes instalados de los repositorios de Arch
yay -Q --repo | awk '{print $1}' | sort > $hogar/yay-installed-repo.txt
