#!/bin/bash

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
