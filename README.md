# Archlinux Hyprland Setup


## Expected
1. Arch Linux running
3. Sudo installed
2. On a user (not root)


## Network: *networkmanager*
*(Install it within the arch installation else you won't have internet to install other things)*  
1. pacman -S networkmanager
2. systemctl enable NetworkManager
3. nmcli device wifi connect "name" --ask


## Package Manager Helper: *yay*
1. sudo pacman -S git base-devel
2. git clone https://aur.archlinux.org/yay.git
3. cd yay
4. makepkg -si
5. rm -rf yay *(Optional)*


## Login Menu: *greetd + tuigreet*
1. sudo pacman -S greetd greetd-tuigreet 
2. sudo systemctl enable greetd

Configuration: /etc/greetd/config.toml


## Wayland Compositor: *hyprland*
1. sudo pacman -S hyprland

Configuration: ~/.config/hypr/hyprland.conf

## Brightness: *brightnessctl*
1. sudo pacman -S brightnessctl

## Audio: *pipewire*

## Wallpaper: *swww*
1. sudo pacman -S swwww


## Status Bar: *Waybar*
1. sudo pacman -S waybar

Configuration: ~/.config/waybar/config, ~/.config/waybar/style.css
