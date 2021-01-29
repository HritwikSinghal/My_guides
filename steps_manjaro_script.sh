#!/bin/zsh





printf "\n---------------------------------------------------------------------------\n"
printf "\n\n\n-------------------------Insatlling Apps-------------------------\n\n\n"


printf "\n-------------------------Install--Ubuntu-extras-------------------------\n"

# sudo apt install ubuntu-restricted-extras ttf-mscorefonts-installer -y
# sudo apt install exfat-fuse exfat-utils ntfs-3g -y
# sudo apt install filezilla git rar unrar p7zip-full p7zip-rar -y
# sudo apt install gnome-music gnote gnome-weather gnome-clocks -y
# sudo apt install synaptic kate dconf-editor net-tools ppa-purge curl -y
# sudo apt install nautilus-admin bashtop htop -y
pip3 install virtualenv youtube_dlc

# # sudo snap install bashtop
# # sudo apt install preload -y
# # sudo apt install pavucontrol -y

# sudo apt install libavcodec-extra libavcodec-extra58 sassc -y
# # Below one is needed only for blur shell extensions
# # sudo apt install gir1.2-clutter-1.0 gir1.2-clutter-gst-3.0 gir1.2-gtkclutter-1.0 -y
sudo pacman -S libmythes mythes-en languagetool aspell-en


printf "\n-------------------------Install--Wine-------------------------\n"


printf "\n-------------------------Install--conky-------------------------\n"
sudo pacman -S conky

printf "\n-------------------------Install--java-------------------------\n"

printf "\n-------------------------Install--Kvantum-------------------------\n"

printf "\n-------------------------Install--Mozilla-------------------------\n"
sudo pacman -S thunderbird


printf "\n-------------------------Install--Flatpack-------------------------\n"

printf "\n-------------------------Install--gdebi-------------------------\n"

printf "\n-------------------------Install--Nemo-------------------------\n"
sudo pacman -S nemo
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.nemo.desktop show-desktop-icons true
# add nemo to startup apps & disable desktop icon extension



printf "\n-------------------------Install--GreenTunnel-------------------------\n"
sudo pacman -S nodejs npm
sudo npm i -g green-tunnel

printf "\n-------------------------Install--Wireshark-------------------------\n"
sudo pacman -S wireshark-qt

printf "\n-------------------------Install--VLC-------------------------\n"
sudo pacman -S vlc

printf "\n-------------------------Install--Copyq-------------------------\n"
sudo pacman -S copyq

printf "\n-------------------------Install--vnstat-------------------------\n"
sudo pacman -S vnstat
cp ./configs/.vnstatrc /home/hritwik/
sudo systemctl enable vnstat.service
sudo systemctl start vnstat.service

printf "\n-------------------------Install--PulseEffects-------------------------\n"

printf "\n-------------------------Install--uget-------------------------\n"

printf "\n-------------------------Install--qBittorrent-------------------------\n"
sudo pacman -S qbittorrent

printf "\n-------------------------Install--Flameshot-------------------------\n"

printf "\n-------------------------Install--fusuma-------------------------\n"
sudo pacman -S ruby libinput
sudo gem install fusuma
gsettings set org.gnome.desktop.peripherals.touchpad send-events enabled
# ---
printf "\n-------------------------Install--fusuma-gems-------------------------\n"
sudo pacman -S libevdev base-devel
sudo gem install fusuma-plugin-sendkey
sudo gem install fusuma-plugin-keypress

sudo pacman -S wmctrl
sudo gem install fusuma-plugin-wmctrl
sudo gem install fusuma-plugin-tap

printf "\n-------------------------Install--fonts-manager-------------------------\n"

printf "\n-------------------------Install--Atom-------------------------\n"

printf "\n-------------------------Install--obs-studio-------------------------\n"
sudo pacman -S obs-studio

printf "\n-------------------------Install--vscodium-------------------------\n"


printf "\n-------------------------Install--Sublime-------------------------\n"
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
sudo pacman -Syu sublime-text

printf "\n-------------------------Install--Signal-------------------------\n"
sudo pacman -S signal-desktop

printf "\n-------------------------Install--youtube-dl-------------------------\n"
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl


printf "\n-------------------------Install--Xanmod-------------------------\n"

printf "\n-------------------------Install--gnome-boxes & virt-manager-------------------------\n"

printf "\n-------------------------Install--jetbrains-------------------------\n"
# sudo snap install pycharm-community --classic
# # flatpak install flathub com.jetbrains.PyCharm-Community -y
# sudo snap install clion --classic
# # flatpak install flathub com.jetbrains.CLion -y
# Use toolbox

printf "\n-------------------------Install--telegram-------------------------\n"
sudo pacman -S telegram-desktop


printf "\n-------------------------Install--WhatsApp-------------------------\n"
sudo snap install whatsdesk


printf "\n-------------------------Install--BingWall-------------------------\n"
sudo snap install bing-wall
sudo snap install wonderwall






printf "\n---------------------------------------------------------------------------\n"
printf "\n\n\n-------------------------Applying Tweaks-------------------------\n\n\n"
printf "\n--------------------------Tweaks---Some common Settings-------------------------\n"
gsettings set org.gnome.desktop.privacy remove-old-temp-files 'true'
gsettings set org.gnome.mutter center-new-windows 'true'
gsettings set org.gnome.nautilus.preferences show-create-link 'true'

echo "alias ll='ls -al'" | sudo tee -a /home/hritwik/.zshrc
source ~/.zshrc

gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"

gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"


# echo "" | sudo tee -a /etc/environment
# echo "DRI_PRIME=1" | sudo tee -a /etc/environment
echo "" | sudo tee -a /etc/environment
echo "MOZ_ENABLE_WAYLAND=1" | sudo tee -a /etc/environment

# for force qt5 to use wayland
# sudo apt install qt5ct -y
echo "" | sudo tee -a /etc/environment
# echo "QT_QPA_PLATFORMTHEME=qt5ct" | sudo tee -a /etc/environment
echo "QT_QPA_PLATFORM=wayland" | sudo tee -a /etc/environment


echo "export QT_STYLE_OVERRIDE=kvantum" >> ~/.profile


printf "\n--------------------------Tweaks---GTK Dark Mode-------------------------\n"

rm -rf /home/hritwik/.config/gtk-3.0/settings.ini
touch /home/hritwik/.config/gtk-3.0/settings.ini
echo "" >> /home/hritwik/.config/gtk-3.0/settings.ini
echo "[Settings]" >> /home/hritwik/.config/gtk-3.0/settings.ini
echo "gtk-application-prefer-dark-theme=1"  >> /home/hritwik/.config/gtk-3.0/settings.ini

rm -rf /home/hritwik/.config/gtk-4.0/settings.ini
touch /home/hritwik/.config/gtk-4.0/settings.ini
echo "" >> /home/hritwik/.config/gtk-4.0/settings.ini
echo "[Settings]" >> /home/hritwik/.config/gtk-4.0/settings.ini
echo "gtk-application-prefer-dark-theme=1"  >> /home/hritwik/.config/gtk-4.0/settings.ini

printf "\n--------------------------Tweaks---wayland dash bug Fix-------------------------\n"
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false

printf "\n--------------------------Tweaks---Increment volume by 3-------------------------\n"
# gsettings set org.gnome.settings-daemon.plugins.media-keys volume-step 3

printf "\n--------------------------Tweaks---minimize on click-------------------------\n"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

printf "\n--------------------------Tweaks---show battery percentage-------------------------\n"
gsettings set org.gnome.desktop.interface show-battery-percentage true

printf "\n--------------------------Tweaks---Keyboard Layout-------------------------\n"
sudo mv /usr/share/X11/xkb/symbols/pc /usr/share/X11/xkb/symbols/pc_bak
sudo mv /usr/share/X11/xkb/symbols/us /usr/share/X11/xkb/symbols/us_bak
sudo cp ./configs/pc /usr/share/X11/xkb/symbols/pc
sudo cp ./configs/us /usr/share/X11/xkb/symbols/us

printf "\n--------------------------Tweaks---change compression level-------------------------\n"
gsettings set org.gnome.FileRoller.General compression-level "very-fast"


printf "\n--------------------------Tweaks---conky-------------------------\n"
rm -rf /home/hritwik/.conky/
cp -r ./configs/.conky/ /home/hritwik/

printf "\n--------------------------Tweaks---dconf-settings-------------------------\n"
# Backup first

dconf dump /org/gnome/ > /home/hritwik/org.gnome_Bak
dconf dump /org/nemo/ > /home/hritwik/org.nemo_Bak
dconf dump /com/github/wwmm/pulseeffects/ > /home/hritwik/com.github.wwmm.pulseeffects_Bak

dconf load /org/gnome/ < ./configs/gsettings/org.gnome
dconf load /org/nemo/ < ./configs/gsettings/org.nemo
dconf load /com/github/wwmm/pulseeffects/ < ./configs/gsettings/com.github.wwmm.pulseeffects

printf "\n--------------------------Tweaks---startup Apps-------------------------\n"
rm -rf /home/hritwik/.config/autostart
cp -r ./configs/autostart/ /home/hritwik/.config/

printf "\n--------------------------Tweaks---firefox-------------------------\n"
rm -rf /home/hritwik/.mozilla
unzip ./configs/firefox_bak.zip -d /home/hritwik/

printf "\n--------------------------Tweaks---thunderbird-------------------------\n"
rm -rf /home/hritwik/.thunderbird
unzip ./configs/thunderbird_bak.zip -d /home/hritwik/

printf "\n--------------------------Tweaks---Atom-------------------------\n"
rm -rf /home/hritwik/.atom
unzip ./configs/atom_bak.zip -d /home/hritwik/
rm -rf /home/hritwik/.atom/recovery/

printf "\n--------------------------Tweaks---Sublime-------------------------\n"
rm -rf /home/hritwik/.config/sublime-text-3/
mkdir -p /home/hritwik/.config/sublime-text-3/Packages/User
unzip ./configs/sublime_bak.zip -d /home/hritwik/.config/sublime-text-3/Packages/

printf "\n--------------------------Tweaks---VLC-------------------------\n"
rm -rf /home/hritwik/.config/vlc
unzip ./configs/vlc_bak.zip -d /home/hritwik/.config/

printf "\n--------------------------Tweaks---jetbrains-------------------------\n"
rm -rf /home/hritwik/PycharmProjects
rm -rf /home/hritwik/CLionProjects
unzip ./configs/clion_bak.zip -d /home/hritwik/
unzip ./configs/pycharm_bak.zip -d /home/hritwik/

printf "\n--------------------------Tweaks---git_ssh-------------------------\n"
rm -rf /home/hritwik/.ssh
unzip ./configs/git_ssh.zip -d /home/hritwik/
git config --global user.email "Hritwiksinghal@outlook.in"
git config --global user.name "Hritwik"

printf "\n--------------------------Tweaks---increase swamp size-------------------------\n"
sudo swapoff /swapfile
sudo dd if=/dev/zero of=/swapfile bs=1M count=6144 oflag=append conv=notrunc
sudo mkswap /swapfile
sudo swapon /swapfile

printf "\n-------------------------Tweaks--fusuma-config-------------------------\n"
# ---
rm -rf /home/hritwik/.config/fusuma
mkdir -p /home/hritwik/.config/fusuma/
cp ./configs/config.yml /home/hritwik/.config/fusuma/