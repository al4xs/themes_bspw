#!/bin/bash

# Abre o cool-retro-term e executa o script Python dentro dele
cool-retro-term --fullscreen &
sleep 2 # Aguarda o terminal abrir antes de executar o comando


# Envia o comando para o terminal cool-retro-term
xdotool type --delay 1 'python /home/kali/hacktools/matrix-intro/matrix-neo.py'
xdotool key Return
sleep 20
xdotool type --delay 1 'exit'
xdotool key Return
