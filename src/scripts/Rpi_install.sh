#!/bin/bash

# --------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------- #
# ------------------------------------ Rpi OS Install ----------------------------------------- #
# --------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------- #

# MS repo remove
sudo sed 's/^/#/g' /etc/apt/sources.list.d/vscode.list | sudo tee /etc/apt/sources.list.d/vscode.list
sudo rm -f /etc/apt/trusted.gpg.d/microsoft.gpg



# Brother printer driver install
sudo apt install qemu binfmt-support qemu-user-static cups a2ps -y
sudo dpkg --add-architecture i386
wget http://ftp.us.debian.org/debian/pool/main/g/glibc/libc6_2.28-10_i386.deb
dpkg -x libc6_2.28-10_i386.deb data
sudo cp -r data/lib/* /lib
sudo cp -r data/usr/* /usr
sudo cp -r data/etc/* /etc
EXTRA_OPTS="-L /lib/i386-linux-gnu"
echo "EXTRA_OPTS="-L /lib/i386-linux-gnu"" >> ~/.bashrc
wget https://download.brother.com/welcome/dlf101917/hll2360dcupswrapper-3.2.0-1.i386.deb
wget https://download.brother.com/welcome/dlf101916/hll2360dlpr-3.2.0-1.i386.deb
sudo sed 's/^/#/g' /etc/ld.so.preload | sudo tee -a /etc/ld.so.preload
sudo dpkg -i hll2360dcupswrapper-3.2.0-1.i386.deb
sudo dpkg -i hll2360dlpr-3.2.0-1.i386.deb


# Cups printing
sudo usermod -a -G lpadmin pi


# pihole
curl -sSL https://install.pi-hole.net | bash


# Room control service
curl -sSL https://raw.githubusercontent.com/HritwikSinghal/room_control_server/master/install.sh | bash

# set custom resolution, this should work but dont know it it would
echo "# force a specific HDMI mode (this will force VGA)" | sudo tee -a /boot/config.txt
echo "hdmi_group=2" | sudo tee -a /boot/config.txt
echo "hdmi_mode=82" | sudo tee -a /boot/config.txt





# --------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------- #

# ------------------------------------ MANJARO Install ---------------------------------------- #
# --------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------- #


# GUIDE FOR CHROOTING IN MANJARO RPI INSTALL FROM PC

# https://wiki.debian.org/RaspberryPi/qemu-user-static
# install 'qemu-user-static' (from AUR if on arch/manjaro) in HOST system (not on RPI)
# then follow
    # https://unix.stackexchange.com/a/222981
    # https://askubuntu.com/a/855307
    # https://unix.stackexchange.com/a/280534
    # https://wiki.archlinux.org/title/Iwd

# Extra resources
    # https://www.raspberrypi.org/forums/viewtopic.php?t=233691
    # https://forum.manjaro.org/t/howto-chroot-from-or-into-any-linux-distribution/34071

# maybe try arch-chroot for easy-chrooting (last tym it didn't work tho)

yay -S --noconfirm --needed qemu-user-static-bin
sudo mount /dev/sdc2 -o rw /mnt
cd /mnt
sudo mount --bind /dev /mnt/dev/
sudo mount --bind /sys /mnt/sys/
sudo mount --bind /proc /mnt/proc/
sudo mount --bind /dev/pts /mnt/dev/pts

sudo cp $(which qemu-arm-static) /mnt/usr/bin
sudo systemctl restart systemd-binfmt.service

# for enabling networking
sudo cp /etc/resolv.conf /mnt/etc/resolv.conf
sudo chroot /mnt qemu-arm-static /bin/bash
# or try - sudo chroot /mnt

# Use iwd for networking
# Network
# sudo pacman -Syyu --noconfirm --needed networkmanager
# sudo systemctl enable rc-local
# sudo systemctl enable NetworkManager
# sudo systemctl start NetworkManager
# sudo nmcli dev wifi connect Singhals password "123123123"
# sudo cp wpa_supplicant-wlan0.conf /mnt/etc/wpa_supplicant/wpa_supplicant-wlan0.conf
# sudo ln -s /usr/lib/systemd/system/wpa_supplicant\@.service /mnt/etc/systemd/system/multi-user.target.wants/wpa_supplicant

chsh -s /usr/bin/fish
pacman -Syu --noconfirm --needed yay
yay -S --noconfirm --needed git htop neofetch fish python3 cronie curl neovim
yay -S --noconfirm --needed micro wl-clipboard net-tools spacevim ranger exa bat ripgrep fd procs
pip3 install pipenv

systemctl enable cronie
systemctl enable fstrim.timer
systemctl enable sshd
pacman-mirrors -c Global

# rpi uses iwd and NOT wpa_supplicant
mkdir -p /var/lib/iwd
touch /var/lib/iwd/Singhals.psk
# add below to above file (remove # from start)
#[Security]
#Passphrase=123123123


# finally
sudo umount /mnt/dev/ -l
sudo umount /mnt/sys/ -l
sudo umount /mnt/proc/ -l
sudo umount /mnt/dev/pts -l
sudo umount /mnt/ -l



# - Wifi (for debian based systems that use wpa_supplicant)
#     - https://unix.stackexchange.com/questions/483678/debian-connect-to-wifi-automatically-when-in-range
#
#     ```
#     /bin/ping -q -c3 1.1.1.1  > /dev/null
#     if [ $? -ne 0 ]
#     then
#     killall wpa_supplicant
#     /bin/ip link set wlan0 up
#     /sbin/wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf  > /dev/null 2>&1
#     /sbin/dhclient -r
#     /sbin/dhclient  > /dev/null 2>&1
#     fi
#
#     ```
#
#     sudo wpa_supplicant -c /etc/wpa_supplicant/wpa_supplicant.conf -i wlan0&
