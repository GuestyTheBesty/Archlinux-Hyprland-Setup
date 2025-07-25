# Archlinux Hyprland Setup

## Expected
1. You know how to get a running arch system


## Boot Loader: *grub + efibootmgr*
*(Do this within arch installation else your system wouldn't be able to identify any bootable devices and simply not work)*
1. `pacman -S grub efibootmgr`
2. `grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB`
3. `grub-mkconfig -o /boot/grub/grub.cfg`

## Network
### Wifi: *iwd*
*(Within arch installation)*  
1. `pacman -S iwd`

*(Inside arch system)*

2. `echo -e "[General]\nEnableNetworkConfiguration=true\n\n[Network]\nNameResolvingService=systemd" > /etc/iwd/main.conf`
3. `systemctl enable --now systemd-resolved`
4. `ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf`
5. `systemctl enable --now iwd`
4. Connect to wifi using `iwctl`



## Arch System
### Creating users
1. `useradd -m -G wheel -s /bin/bash [username]`
2. `passwd [username]`
3. Have nano installed and then do `EDITOR=nano visudo`
4. Uncomment `# %wheel ALL=(ALL:ALL) ALL)` by removing the `#` in the front
5. `su [username]`
6. `cd ~`

### Automatic setup
1. `sudo pacman -S git base-devel`
2. `git clone https://github.com/GuestyTheBesty/Archlinux-Hyprland-Setup.git`
3. `cd Archlinux-Hyprland-Setup`
4. `./setup.sh`

Go into the configs if there's a bug, such as using a wired connection and seeing the no wifi symbol, or if you want to configure anything you don't like.  
I also recommend changing the wofi position in the hyprland config.
