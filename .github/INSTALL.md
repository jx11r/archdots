<div align="center">
  <h2>Arch Linux Installation</h2>
</div>

Please be advised that this is a personal guide and should not be used by others.

1. Download the latest Arch Linux [ISO](https://archlinux.org/download/).
2. [Connect](https://wiki.archlinux.org/title/Iwd#iwctl) to the internet.
3. Format and mount disks/partitions:
```shell
mkfs.fat -F 32 -n boot /dev/sda1
mkfs.xfs -L root /dev/sda3
mkfs.xfs -L home /dev/sda4

mkswap -L swap /dev/sda2
swapon !$

mount /dev/sda3 /mnt
mount --mkdir /dev/sda1 !$/boot/efi
mount --mkdir /dev/sda3 /mnt/home
```
4. Finally run this script:
```shell
bash <(curl -s 'https://raw.githubusercontent.com/jx11r/src/i/install.sh')
```
