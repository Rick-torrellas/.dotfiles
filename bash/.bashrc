#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi

# --- Historial mejorado ---
# Evita comandos duplicados en el historial.
export HISTCONTROL=ignoredups:erasedups
# Añade la fecha y hora a cada comando en el historial.
export HISTTIMEFORMAT="%h/%d - %H:%M:%S "
# Aumenta el tamaño del historial.
export HISTSIZE=10000
export HISTFILESIZE=20000

eval "$(starship init bash)"