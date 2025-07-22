#!/bin/bash

# Change it to your battery
BATTERY="BAT0"

CAPACITY=$(cat /sys/class/power_supply/$BATTERY/capacity)
STATUS=$(cat /sys/class/power_supply/$BATTERY/status)

STATE=""
CLASS=""

if [[ "$STATUS" == "Full" || "$STATUS" == "Charging" ]]; then
    STATE="\ue315"
    CLASS="Charging"
else
    if [ "$CAPACITY" -ge 95 ]; then
        STATE="\udb80\udc79"
        CLASS="GE100"
    elif [ "$CAPACITY" -ge 80 ]; then
        STATE="\udb80\udc82"
        CLASS="GE90"
    elif [ "$CAPACITY" -ge 65 ]; then
        STATE="\udb80\udc80"
        CLASS="GE70"
    elif [ "$CAPACITY" -ge 45 ]; then
        STATE="\udb80\udc7e"
        CLASS="GE50"
    elif [ "$CAPACITY" -ge 25 ]; then
        STATE="\udb80\udc7c"
        CLASS="GE30"
    elif [ "$CAPACITY" -ge 15 ]; then
        STATE="\udb80\udc7b"
        CLASS="GE20"
    else
        STATE="\udb80\udc7a"
        if [ "$CAPACITY" -ge 5 ]; then 
            CLASS="GE10"
        else 
            CLASS="GE0"
        fi
    fi
fi

echo "{\"text\": \"$STATE\", \"class\": \"$CLASS\"}"