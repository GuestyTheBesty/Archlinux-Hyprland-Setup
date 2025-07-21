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

yay -S spotify --mflags="-C"

mkdir -p ~/.config/hypr ~/Scripts ~/.config/greetd ~/.config/waybar ~/.config/swaync ~/.config/wofi
cp -r ./hyprland ~/.config/hypr
cp -r ./Scripts ~/Scripts
cp -r ./greetd-tuigreet ~/.config/greetd
cp -r ./waybar ~/.config/waybar
cp -r ./swaync ~/.config/swaync
cp -r ./wofi ~/.config/wofi

sudo systemctl --user enable pipewire pipewire-pulse wireplumber
sudo systemctl enable greetd
