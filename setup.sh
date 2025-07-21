#/bin/bash

packages={
    git
    base-devel
    hyprland
    greetd-tuigreet
    waybar
    kitty
    brightnessctl
    swww
    code
    firefox
    spotify
}

sudo pacman -S --noconfirm "${packages[@]}"

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
rm -rf yay