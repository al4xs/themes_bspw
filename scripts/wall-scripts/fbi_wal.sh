#!/bin/bash

# DATABASE VARIABLES
USERNAME=$(whoami)
USERDIR="/home/${USERNAME}"

# WALLPAPERS FBI

wallpapers_dir="/home/${USERNAME}/.themes/FBI/wallpapers"
wallpapers=($(find "$wallpapers_dir" -type f -name "*.png" -o -name "*.jpg" -o -name "*.jpeg"))

# RANDOM WALLPAPER
random_wallpaper="${wallpapers[RANDOM % ${#wallpapers[@]}]}"

# SET WALLPAPER
feh --bg-scale "$random_wallpaper"
