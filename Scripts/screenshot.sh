#/bin/bash

# If you already pressed screenshot
if pgrep -f "slurp" > /dev/null; then
    exit
fi

location=$(slurp)

# Didn't proceed with screenshot
if [ -z "$location" ]; then
    exit
fi

temp=$(mktemp --suffix=.png)
sleep 0.1

time=$(date +%m-%d-%Y_%Hh%Mm%Ss)
grim -g "$location" "$temp"
wl-copy < "$temp"

while true; do
    file_name=$(timeout 20 zenity --entry \
        --title="" \
        --text="Filename for screenshot:" \
        --entry-text="$time" \
        --ok-label="Save" \
        --cancel-label="Don't Save"
    )

    if [[ -z "$file_name" ]]; then
        # Pressed Don't Save option
        exit
    elif [ -e "$HOME/Pictures/$file_name.png" ]; then
        # File exists at location
        continue
    else
        # Save at given location
        mv "$temp" "$HOME/Pictures/$file_name.png"
        notify-send "Saved in $HOME/Pictures" "$file_name.png"
        exit
    fi
done
