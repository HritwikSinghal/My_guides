#!/bin/sh
set -e

echo "------------------------------------------------------"
# add repositories
echo "Adding Repositories."
# Ubuntu
sudo add-apt-repository universe
sudo add-apt-repository multiverse
sudo add-apt-repository restricted

# Timeshift
sudo apt-add-repository -y ppa:teejee2008/ppa
# Kvantum
sudo add-apt-repository ppa:papirus/papirus
# Mozilla
sudo add-apt-repository ppa:ubuntu-mozilla-security/ppa
sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa
# Flatpack
sudo add-apt-repository ppa:alexlarsson/flatpak
# lollypop
sudo add-apt-repository ppa:gnumdk/lollypop
# conky
sudo add-apt-repository ppa:linuxmint-tr/araclar
sudo apt update
sudo apt install conky conky-all conky-manager conky-manager-extra
sudo add-apt-repository --remove ppa:linuxmint-tr/araclar
# Wireshark
sudo add-apt-repository ppa:wireshark-dev/stable



echo "------------------------------------------------------"
sudo apt update && sudo apt upgrade -y
echo "Insatlling Apps."
# Ubuntu-extras
sudo apt install ubuntu-restricted-extras
sudo apt install rar unrar p7zip-full p7zip-rar
sudo apt install ttf-mscorefonts-installer
# clear font cache
sudo apt install gnome-shell-extensions
# Wine
sudo apt install wine winetricks
# java
sudo apt-get install openjdk-11-jdk
# Timeshift
sudo apt install timeshift
# NMCLI
sudo apt install network-manager
sudo systemctl start NetworkManager.service
sudo systemctl start NetworkManager.service
# GNOME-tweak-tool and chrome-gnome-shell
sudo apt install gnome-tweaks
sudo apt install chrome-gnome-shell
# Kvantum
sudo apt install qt5-style-kvantum qt5-style-kvantum-themes
# Mozilla
sudo apt install firefox firefox-trunk thunderbird
# Flatpack
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# gdebi
sudo apt install gdebi
#Nemo
sudo apt install nemo
# BingWall
sudo snap install bing-wall
sudo snap install wonderwall
# Lollypop
sudo apt install lollypop
# GreenTunnel
sudo apt install nodejs
sudo apt install npm
npm i -g green-tunnel
# telegram
sudo snap install telegram-desktop
# whatsdesk
sudo snap install whatsdesk
# Wireshark
sudo apt install wireshark
# VLC
sudo apt install vlc




echo "------------------------------------------------------"
echo "Other Tweaks."
echo "Adding to '/etc/environment'"
(echo "" ; echo "DRI_PRIME=1") >> /etc/environment
(echo "" ; echo "MOZ_ENABLE_WAYLAND=1") >> /etc/environment
# GTK3 Dark Mode
echo "" > ~/.config/gtk-3.0/settings.ini
echo "[Settings]" > ~/.config/gtk-3.0/settings.ini
echo "gtk-application-prefer-dark-theme=1"  > ~/.config/gtk-3.0/settings.ini
# wayland dash bug Fix
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
# Increment volume by 2
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-step 2
# minimize on click
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
# show battery percentage
gsettings set org.gnome.desktop.interface show-battery-percentage true
# Nemo
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.nemo.desktop show-desktop-icons true


echo "------------------------------------------------------"
echo "Finished Successfully!"
