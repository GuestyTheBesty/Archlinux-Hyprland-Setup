#!/bin/bash

CUR=$(brightnessctl get)
brightnessctl set 0% # Prevent hyprland's inherent wallpaper

swww-daemon & # Start swww in background
$HOME/Scripts/alternate_wallpapers.sh &
sleep 1 # Wait till swww is up

brightnessctl set $CUR 






