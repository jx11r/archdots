<div align="center">
  <h2>Arch Linux Installation</h2>
</div>

*Just a personal guide, you shouldn't use this.*

1. Download the latest Arch Linux [ISO](https://archlinux.org/download/).
2. [Connect](https://wiki.archlinux.org/title/Iwd#iwctl) to the internet.
3. Format and mount disks/partitions:
```shell
# Boot
mkfs.fat -F 32 -n boot /dev/sda1

# Swap
mkswap -L swap /dev/sda2
swapon !$

# Root
mkfs.xfs -L root /dev/sda3

# Home
mkfs.xfs -L home /dev/sda4

mount /dev/sda3 /mnt
mount --mkdir /dev/sda1 !$/boot/efi
mount --mkdir /dev/sda3 /mnt/home
```
4. Finally run this script:
```shell
bash <(curl -s https://raw.githubusercontent.com/jx11r/src/!/install.sh)
```
