#!/bin/bash

if pgrep -x "spotify" > /dev/null; then
    CLASS="active"
else
    CLASS="inactive"
fi

echo "{\"text\": \"\uf051\", \"class\": \"$CLASS\"}"