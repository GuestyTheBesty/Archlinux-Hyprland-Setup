#!/bin/bash

CUR_WORKSPACE=$(hyprctl activewindow | grep 'workspace:' | awk '{print $2}')
WOFI=$(hyprctl clients | grep -B 5 "workspace: $CUR_WORKSPACE"| grep "drun")

# If wofi exists and is in current workspace
if [ -n "$WOFI" ]; then 
  # Focus on it:
  # ADDRESS=$(echo $WOFI | awk '{print $2}')
  # hyprctl dispatch focuswindow address:0x$ADDRESS
  
  # Kill it
  PID=$(hyprctl clients | grep -A 8 "workspace: $CUR_WORKSPACE" | grep -A 2 "initialTitle: drun" | awk 'NR==2 {print $2}')
  kill $PID
else
  wofi -n --show drun -I 
fi