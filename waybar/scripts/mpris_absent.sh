#!/bin/bash

if playerctl -l | grep -q .; then
    echo '{"text": ""}'
else
    echo '{"text": "Not playing anything!"}'
fi


playerctl --follow metadata | while read -r line; do
    if playerctl -l | grep -q .; then
        echo '{"text": ""}'
    else
        echo '{"text": "Not playing anything!"}'
    fi
done
