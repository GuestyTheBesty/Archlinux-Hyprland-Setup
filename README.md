# Archlinux Hyprland Setup


## Expected
1. Arch Linux running
3. Sudo installed
2. On a user (not root)


## Network: *iwd*
*(Install it within the arch installation else you won't have internet to install other things)*  
1. `pacman -S iwd`
2. `systemctl enable iwd`


## Package Manager Helper: *yay*
1. `sudo pacman -S git base-devel`
2. `git clone https://aur.archlinux.org/yay.git`
3. `cd yay`
4. `makepkg -si`
5. `rm -rf yay` (Optional)


## Login Menu: *greetd + tuigreet*
1. `sudo pacman -S greetd greetd-tuigreet`
2. `sudo systemctl enable greetd`

Configuration: /etc/greetd/config.toml


## Wayland Compositor: *hyprland*
1. `sudo pacman -S hyprland`

Configuration: ~/.config/hypr/hyprland.conf


## Application Launcher: *wofi*
1. `sudo pacman -S wofi`


## Terminal: *kitty*
1. `sudo pacman -S kitty`


## Brightness: *brightnessctl*
1. `sudo pacman -S brightnessctl`


## Wallpaper: *swww*
1. `sudo pacman -S swwww`
2. Enter ~/Scripts/alternate_wallpaper.sh and properly set your Wallpaper folder location


## Audio: *pipewire*
1. `sudo pacman -S pipewire pipewire-alsa pipewire-pulse wireplumber`
2. `systemctl --user enable pipewire pipewire-pulse wireplumber`


## Status Bar: *waybar*
1. `sudo pacman -S waybar`

Configuration: ~/.config/waybar/config, ~/.config/waybar/style.css


## Notifications: *swaync*
1. `sudo pacman -S swaync`

Configuration: ~/.config/swaync/config.json, ~/.config/swaync/style.css
Credit: I got it from somewhere, I forgot :D