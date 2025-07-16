#!/bin/bash

if pgrep -x "spotify" > /dev/null; then
    playerctl -p spotify previous
fi