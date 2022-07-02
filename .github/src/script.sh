#!/bin/bash

# Shell Colors
reset="\033[0m"
black="\033[1;30m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
blue="\033[1;34m"
magenta="\033[1;35m"
cyan="\033[1;36m"
white="\033[1;37m"

cl=${reset}
cl0=${black}
cl1=${red}
cl2=${green}
cl3=${yellow}
cl4=${blue}
cl5=${magenta}
cl6=${cyan}
cl7=${white}

set -e

# Installation Script
sep="${cl6}::${reset}"
line="${cl5} ->${reset}"

echo -en "${sep} Insert the console keyboard layout: "
read keyboard

echo -e "${sep} Installing essential packages..."
pacstrap /mnt base base-devel efibootmgr git grub gvfs linux linux-firmware nano networkmanager os-prober

echo -e "${sep} Generating fstab file..."
genfstab -U /mnt >> /mnt/etc/fstab

echo -e "${sep} Changing system root..."
arch-chroot /mnt

echo -e "${sep} Done, now configuring the system..."
echo -e "${line} Set the time zone. (1/13)"
ln -sf /usr/share/zoneinfo/America/Mexico_City /etc/localtime
hwclock --systohc

echo -e "${line} Set up localization. (2/13)"
sed -i "s/#en_US.UTF-8/en_US.UTF-8/"
echo LANG=en_US.UTF-8 > /etc/locale.conf
locale-gen

echo -e "${line} Set the console keyboard layout. (3/13)"
echo KEYMAP=$keyboard > etc/vconsole.conf

echo -e "${line} Set the hostname. (4/13)"
echo archlinux >> /etc/hostname

echo -e "${line} Insert the root password. (5/13)"
passwd

echo -e "${line} Creating user... (6/13)"
useradd -m -G wheel -s /bin/bash jx11r

echo -e "${line} Insert the user password. (7/13)"
passwd jx11r

echo -e "${line} Add user to sudoers file. (8/13)"
sed -i "s/# %wheel ALL=(ALL:ALL) NOPASSWD: ALL/%wheel ALL=(ALL:ALL) NOPASSWD: ALL/" /etc/sudoers

echo -e "${line} Enable Network Manager. (9/13)"
systemctl enable NetworkManager.service --now

echo -e "${line} Installing the AUR helper... (10/13)"
pushd /opt
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
popd

echo -e "${line} Installing Xorg... (11/13)"
pacman -S xorg-server --noconfirm

echo -e "${line} Installing GRUB... (12/13)"
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=ArchLinux

echo -e "${line} Generate the GRUB configuration file. (13/13)"
grub-mkconfig -o /boot/grub/grub.cfg

echo -e "${sep} Setup completed, you can reboot this PC."
