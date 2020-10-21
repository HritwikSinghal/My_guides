#!/bin/sh
set -e

echo "------------------------------------------------------"
# add repositories
echo "Adding Repositories."
# Timeshift
sudo apt-add-repository -y ppa:teejee2008/ppa
# Kvantum
sudo add-apt-repository ppa:papirus/papirus
# Mozilla
sudo add-apt-repository ppa:ubuntu-mozilla-security/ppa
sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa
# Flatpack
sudo add-apt-repository ppa:alexlarsson/flatpak






echo "------------------------------------------------------"
sudo apt update && sudo apt upgrade -y
echo "Insatlling Apps."
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
# Nemo
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.nemo.desktop show-desktop-icons true



echo "------------------------------------------------------"
echo "Finished Successfully!"
