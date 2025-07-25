#!/bin/bash

packages=(
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
    curl
    zip
    unzip
)

sudo pacman -Sy --noconfirm "${packages[@]}"

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
rm -rf yay
cd ..

yay -S --noconfirm spotify visual-studio-code-bin

LOCATION=$(pwd)
mkdir -p ~/.config/hypr ~/Scripts ~/.config/waybar ~/.config/swaync ~/.config/wofi ~/.config/gtk-3.0
cp -r $LOCATION/hypr/* ~/.config/hypr
cp -r $LOCATION/Scripts/* ~/Scripts
sudo cp -r $LOCATION/greetd-tuigreet/* /etc/greetd
cp -r $LOCATION/waybar/* ~/.config/waybar
cp -r $LOCATION/swaync/* ~/.config/swaync
cp -r $LOCATION/wofi/* ~/.config/wofi
cp -r $LOCATION/gtk-3.0/* ~/.config/gtk-3.0

systemctl --user enable pipewire pipewire-pulse wireplumber
sudo systemctl enable greetd

curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip

mkdir -p ~/.local/share/fonts
unzip JetBrainsMono.zip -d ~/.local/share/fonts
rm JetBrainsMono.zip
fc-cache -fv

echo "Reboot [y/n]: "
read ANS

if [[ "$ANS" == "y" ]]; then
    sudo reboot
fi