#/bin/bash

packages={
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
}

sudo pacman -S --noconfirm "${packages[@]}"

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
rm -rf yay

yay -S spotify

cp -r ./hyprland ~/.config/hypr
cp -r ./Scripts ~/Scripts
cp -r ./greetd-tuigreet ~/.config/greetd
cp -r ./waybar ~/.config/waybar
cp -r ./swaync ~/.config/swaync
cp -r ./wofi ~/.config/wofi

systemctl --user enable pipewire pipewire-pulse wireplumber
systemctl enable greetd
