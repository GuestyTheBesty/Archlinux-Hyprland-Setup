#/bin/bash

packages=(
    git
    base-devel
    hyprland
    brightnessctl
    swww
    pipewire
    pipewire-alsa
    pipewire-pulse
    wireplumber
    greetd-tuigreet
    wofi
    waybar
    swaync
    kitty
    dolphin
    firefox
    code
)

sudo pacman -S --noconfirm "${packages[@]}"

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
rm -rf yay
cd ..

yay -S spotify

LOCATION=$(pwd)
mkdir -p ~/.config/hypr ~/Scripts ~/.config/waybar ~/.config/swaync ~/.config/wofi
cp -r $LOCATION/hypr/* ~/.config/hypr
cp -r $LOCATION/Scripts/* ~/Scripts
cp -r $LOCATION/greetd-tuigreet/* /etc/greetd
cp -r $LOCATION/waybar/* ~/.config/waybar
cp -r $LOCATION/swaync/* ~/.config/swaync
cp -r $LOCATION/wofi/* ~/.config/wofi

sudo systemctl --user enable pipewire pipewire-pulse wireplumber
sudo systemctl enable greetd

reboot