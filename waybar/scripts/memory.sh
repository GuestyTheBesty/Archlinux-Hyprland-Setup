#!/bin/bash

USED=$(free -m | awk '/Mem:/ {print $3}')
TOTAL=$(free -m | awk '/Mem:/ {print $2}')

AVAIL=$((TOTAL-USED))
PERCENTAGE=$((USED*100/TOTAL))

CLASS=""
if [ "$PERCENTAGE" -ge 90 ]; then
    CLASS="Critical"
elif [ "$PERCENTAGE" -ge 75 ]; then
    CLASS="Warning"
elif [ "$PERCENTAGE" -ge 50 ]; then
    CLASS="Sufficient"
else 
    CLASS="Abundant"
fi



echo "{\"text\": \"$PERCENTAGE%\", \"tooltip\": \"Availabe: ${AVAIL}MiB\", \"class\": \"$CLASS\"}"