#!/bin/bash

WALLPAPER_FOLDER="$HOME/Wallpapers"

if [ ! -d "$WALLPAPER_FOLDER" ]; then
    exit 1
fi

while true; do
  FULL_WALLPAPER_DIR=$(find $WALLPAPER_FOLDER -type f | shuf -n 1)
  swww img $FULL_WALLPAPER_DIR
  sleep 1200 # 1200 / 60 = 20 minutes
done
