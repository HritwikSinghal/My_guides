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



#!/bin/bash

# GUIDE FOR CHROOTING IN MANJARO RPI INSTALL FROM PC

# https://wiki.debian.org/RaspberryPi/qemu-user-static
# install 'qemu-user-static' (from AUR if on arch/manjaro) in HOST system (not on RPI)
# then follow
    # https://unix.stackexchange.com/a/222981
    # https://askubuntu.com/a/855307
    # https://unix.stackexchange.com/a/280534

# Extra resources
    # https://www.raspberrypi.org/forums/viewtopic.php?t=233691
    # https://forum.manjaro.org/t/howto-chroot-from-or-into-any-linux-distribution/34071

# yay -S --noconfirm --needed qemu-user-static
# sudo mount /dev/sdc2 -o rw /mnt                   # mount root partiton
# cd /mnt
# sudo mount --bind /dev dev/
# sudo mount --bind /sys sys/
# sudo mount --bind /proc proc/
# sudo mount --bind /dev/pts dev/pts

# sudo cp $(which qemu-arm-static) /mnt/usr/bin
# sudo systemctl restart systemd-binfmt.service
# sudo cp /etc/resolv.conf /mnt/etc/resolv.conf     # for enabling networking
# sudo chroot /mnt qemu-arm-static /bin/bash


# Network
sudo pacman -Syyu --noconfirm --needed networkmanager
sudo systemctl enable rc-local
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
sudo nmcli dev wifi connect Singhals password "123123123"

sudo pacman -Syu --noconfirm --needed yay htop neofetch fish python3 cronie
yay -S --noconfirm --needed micro wl-clipboard git rar unrar p7zip
yay -S --noconfirm --needed net-tools curl neovim spacevim ranger exa bat ripgrep fd procs

pip3 install pipenv
sudo systemctl enable cronie
sudo systemctl start cronie
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer


# pacman, color - Dont append at end of file
# echo 'ILoveCandy' | sudo tee -a /etc/pacman.conf
# echo 'Color' | sudo tee -a /etc/pacman.conf









sudo cp wpa_supplicant-wlan0.conf /run/media/hritwik/ROOT_MNJRO1/etc/wpa_supplicant/wpa_supplicant-wlan0.conf

sudo ln -s /usr/lib/systemd/system/wpa_supplicant\@.service /run/media/hritwik/ROOT_MNJRO1/etc/systemd/system/multi-user.target.wants/wpa_supplicant



- Wifi
    - https://unix.stackexchange.com/questions/483678/debian-connect-to-wifi-automatically-when-in-range

    ```
    /bin/ping -q -c3 1.1.1.1  > /dev/null
    if [ $? -ne 0 ]
    then
    killall wpa_supplicant
    /bin/ip link set wlan0 up
    /sbin/wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf  > /dev/null 2>&1
    /sbin/dhclient -r
    /sbin/dhclient  > /dev/null 2>&1
    fi

    ```

    sudo wpa_supplicant -c /etc/wpa_supplicant/wpa_supplicant.conf -i wlan0&
