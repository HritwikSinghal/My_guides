#!/bin/sh
set -e

echo "------------------------------------------------------"
# add repositories
echo "Adding Repositories...."
# Ubuntu
sudo add-apt-repository universe -y
sudo add-apt-repository multiverse -y
sudo add-apt-repository restricted -y

# Timeshift
sudo apt-add-repository ppa:teejee2008/ppa -y
# Kvantum
sudo add-apt-repository ppa:papirus/papirus -y
# Mozilla
sudo add-apt-repository ppa:ubuntu-mozilla-security/ppa -y
sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa -y
# Flatpack
sudo add-apt-repository ppa:alexlarsson/flatpak -y
# lollypop
sudo add-apt-repository ppa:gnumdk/lollypop -y
# conky
sudo add-apt-repository ppa:linuxmint-tr/araclar -y
sudo apt update
sudo apt install conky conky-all conky-manager -y
sudo add-apt-repository --remove ppa:linuxmint-tr/araclar -y
# Wireshark
sudo add-apt-repository ppa:wireshark-dev/stable -y
# PulseEffects
sudo add-apt-repository ppa:mikhailnov/pulseeffects -y
# Uget
sudo add-apt-repository ppa:plushuang-tw/uget-stable -y
# qBittorrent
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y





echo "------------------------------------------------------"
echo "Insatlling Apps...."
sudo apt update && sudo apt upgrade -y

# Ubuntu-extras
sudo apt install ubuntu-restricted-extras -y
sudo apt install rar unrar p7zip-full p7zip-rar -y
sudo apt install ttf-mscorefonts-installer -y
sudo apt install exfat-fuse exfat-utils -y
sudo apt install ntfs-3g -y
sudo apt install dconf-editor -y
sudo apt install dconf* -y
sudo apt install filezilla -y
sudo apt install gnome-weather gnome-clocks -y
sudo apt install gnome-shell-extensions -y
sudo apt install p7zip-full p7zip-rar -y
sudo apt install openjdk-11-jdk -y
sudo apt install git -y
sudo apt install gnome-music gnote -y
sudo apt install sassc -y
sudo apt install checkinstall -y

# Wine
sudo apt install wine winetricks -y
# java
sudo apt-get install openjdk-11-jdk -y
# Timeshift
sudo apt install timeshift -y
# nmcli
sudo apt install network-manager -y
sudo systemctl start NetworkManager.service
sudo systemctl start NetworkManager.service
# GNOME-tweak-tool and chrome-gnome-shell
sudo apt install gnome-tweaks -y
sudo apt install chrome-gnome-shell -y
# Kvantum
sudo apt install qt5-style-kvantum qt5-style-kvantum-themes -y
# Mozilla
sudo apt install firefox firefox-trunk thunderbird -y
# Flatpack
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo -y
# gdebi
sudo apt install gdebi-core -y
#Nemo
sudo apt install nemo -y
# BingWall
sudo snap install bing-wall -y
sudo snap install wonderwall -y
# Lollypop
sudo apt install lollypop -y
# GreenTunnel
sudo apt install nodejs -y
sudo apt install npm -y
npm i -g green-tunnel
# telegram
sudo snap install telegram-desktop -y
# whatsdesk
sudo snap install whatsdesk -y
# Wireshark
sudo apt install wireshark -y
# VLC
sudo apt install vlc -y
# vnstat
sudo apt install vnstat -y
cp ./configs/.vnstatrc $HOME/
sudo systemctl enable vnstat.service
sudo systemctl start vnstat.service
# PulseEffects
sudo apt install pulseaudio pulseeffects --install-recommends -y
sudo cp ./configs/PulseEffects_MyPreset.json /home/hritwik/.config/PulseEffects/output
# uget
sudo apt install uget -y
sudo apt install uget aria2 -y
#qBittorrent
sudo apt install qbittorrent -y
# Flameshot
sudo apt install flameshot -y
# fusuma
sudo gpasswd -a $USER input
newgrp input
sudo apt install libinput-tools
sudo apt install ruby
sudo gem install fusuma
sudo apt install xdotool
gsettings set org.gnome.desktop.peripherals.touchpad send-events enabled
# ---
sudo apt install libevdev-dev ruby-dev build-essential
sudo gem install fusuma-plugin-sendkey
sudo gem install fusuma-plugin-keypress
sudo apt install wmctrl
sudo gem install fusuma-plugin-wmctrl
sudo gem install fusuma-plugin-tap
# ---
mkdir -p ~/.config/fusuma
cp ./configs/config.yml ~/.config/fusuma/
# fonts-manager
sudo apt install font-manager
# Pycharm
sudo snap install pycharm-community --classic
# Clion
sudo snap install clion --classic





echo "------------------------------------------------------"
echo "Applying Tweaks...."

# Some common Settings
gsettings set org.gnome.desktop.privacy remove-old-temp-files 'true'
gsettings set org.gnome.mutter center-new-windows 'true'
gsettings set org.gnome.nautilus.preferences show-create-link 'true'

(echo "" ; echo "DRI_PRIME=1") >> /etc/environment
(echo "" ; echo "MOZ_ENABLE_WAYLAND=1") >> /etc/environment
# GTK3 Dark Mode
echo "" >> ~/.config/gtk-3.0/settings.ini
echo "[Settings]" >> ~/.config/gtk-3.0/settings.ini
echo "gtk-application-prefer-dark-theme=1"  >> ~/.config/gtk-3.0/settings.ini

echo "" >> ~/.config/gtk-4.0/settings.ini
echo "[Settings]" >> ~/.config/gtk-4.0/settings.ini
echo "gtk-application-prefer-dark-theme=1"  >> ~/.config/gtk-4.0/settings.ini

# wayland dash bug Fix
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
# Increment volume by 3
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-step 3
# minimize on click
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
# show battery percentage
gsettings set org.gnome.desktop.interface show-battery-percentage true
# Nemo
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.nemo.desktop show-desktop-icons true
# Keyboard Layout
sudo mv /usr/share/X11/xkb/symbols/pc /usr/share/X11/xkb/symbols/pc_bak
sudo mv /usr/share/X11/xkb/symbols/us /usr/share/X11/xkb/symbols/us_bak
sudo cp ./configs/pc /usr/share/X11/xkb/symbols/pc
sudo cp ./configs/us /usr/share/X11/xkb/symbols/us
# change compression level
gsettings set org.gnome.FileRoller.General compression-level "very-fast"
# conky
rm -rf ~/.conky
cp -r ./configs/.conky ~/





echo "------------------------------------------------------"
echo "Theming & Installing Extensions...."

# Grub-theme
git clone --depth 1 https://github.com/vinceliuice/grub2-themes.git ~/my_downloads/grub_themes
sudo ~/my_downloads/grub_themes/install.sh --tela

# App theme: orchis-dark
git clone --depth 1 https://github.com/vinceliuice/Orchis-theme.git ~/my_downloads/orchis-dark
sudo ~/my_downloads/orchis-dark/install.sh
sudo snap install orchis-themes
gsettings set org.gnome.desktop.interface gtk-theme 'Orchis-dark'

# icon-theme & Curser-theme: Pop
sudo apt install pop-icon-theme
gsettings set org.gnome.desktop.interface icon-theme 'Pop'
gsettings set org.gnome.desktop.interface cursor-theme 'Pop'

# shell-theme & Extensions
unzip ./configs/extensions_bak.zip -d ~/.local/share/gnome-shell/

git clone --depth 1 https://github.com/nana-4/materia-theme.git ~/my_downloads/materia-theme
sudo ~/my_downloads/materia-theme/install.sh
gsettings set org.gnome.shell.extensions.user-theme name 'Materia-dark'

# fonts
git clone --depth 1 https://github.com/pop-os/fonts.git ~/my_downloads/pop_fonts
cd ~/my_downloads/pop_fonts/
sudo make install

gsettings set org.gnome.desktop.interface font-name 'Fira Sans Semi-Light 11'
gsettings set org.gnome.desktop.interface document-font-name 'Roboto Slab 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'Fira Mono 13'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Fira Sans Semi-Bold 11'
gsettings set org.gnome.desktop.interface text-scaling-factor 0.84999999999999998

# dconf-settings
dconf load /org/gnome/ < ./configs/gsettings/org.gnome
dconf load /org/nemo/ < ./configs/gsettings/org.nemo
dconf load /com/github/wwmm/pulseeffects/ < ./configs/gsettings/com.github.wwmm.pulseeffects


echo "------------------------------------------------------"
echo "Finished Successfully!"
