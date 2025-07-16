#!/bin/bash

INTERFACE="wlan0"
STRENGTH=$(iwctl station $INTERFACE show | grep -m 1 "RSSI" | awk '{print $2}')

STATE=""
STATUS=""

# If not connected
if [ ! -n "$STRENGTH" ]; then 
    STATE="\udb82\udd2e"
    STATUS="Not connected"
elif [ "$STRENGTH" -ge -50 ]; then
    STATE="\udb82\udd28"
    STATUS="Excellent"
elif [ "$STRENGTH" -ge -60 ]; then
    STATE="\udb82\udd25"
    STATUS="Strong"
elif [ "$STRENGTH" -ge -70 ]; then
    STATE="\udb82\udd22"
    STATUS="Decent"
elif [ "$STRENGTH" -ge -80 ]; then
    STATE="\udb82\udd1f"
    STATUS="Weak"
else
    STATE="\udb82\udd2f"
    STATUS="Atrocious"
fi

echo "{\"text\": \"$STATE\", \"tooltip\": \"$STATUS\"}"