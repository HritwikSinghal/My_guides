#!/bin/zsh


sudo pacman-mirrors -f
sudo pacman -Syyu


printf "\n---------------------------------------------------------------------------\n"
printf "\n\n\n-------------------------Insatlling Apps-------------------------\n\n\n"


printf "\n-------------------------Install--extras-------------------------\n"

sudo pacman -S --noconfirm --needed exfat-utils ntfs-3g 
sudo pacman -S --noconfirm --needed filezilla git rar unrar p7zip
sudo pacman -S --noconfirm --needed gnome-music gnote gnome-weather gnome-clocks
sudo pacman -S --noconfirm --needed kate dconf-editor net-tools curl eog
sudo pacman -S --noconfirm --needed nautilus-admin htop dnsutils

sudo pacman -S --noconfirm --needed libreoffice-fresh conky libmythes mythes-en languagetool aspell-en
sudo pacman -Rs --noconfirm --needed onlyoffice-desktopeditors
sudo pacman -S --noconfirm --needed yay qt5-wayland qt6-wayland base-devel android-tools android-udev
yay -S --noconfirm --needed paru

# ADB
sudo pacman -S --no-confirm android-tools android-udev

pip3 install virtualenv youtube_dlc

# sudo apt install ttf-mscorefonts-installer -y
# sudo apt install libavcodec-extra libavcodec-extra58 sassc -y

# # Below one is needed only for blur shell extensions
# sudo apt install gir1.2-clutter-1.0 gir1.2-clutter-gst-3.0 gir1.2-gtkclutter-1.0 -y

# # extra codecs
# sudo pacman -S a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv opus wavpack x264 xvidcore  --noconfirm --needed



printf "\n-------------------------Install--Wine-------------------------\n"


printf "\n-------------------------Install--java-------------------------\n"
sudo pacman -S --noconfirm --needed jre-openjdk jdk-openjdk

printf "\n-------------------------Install--Timeshift-------------------------\n"
sudo pacman -S --noconfirm --needed timeshift
sudo systemctl enable cronie
sudo systemctl start cronie

printf "\n-------------------------Install--nmcli-------------------------\n"
sudo pacman -S --noconfirm --needed networkmanager
sudo systemctl start NetworkManager.service
sudo systemctl start NetworkManager.service

printf "\n-------------------------Install--GNOME-tweak-tool and chrome-gnome-shell-------------------------\n"
sudo pacman -S --noconfirm --needed gnome-tweaks chrome-gnome-shell

printf "\n-------------------------Install--Kvantum-------------------------\n"
sudo pacman -S --noconfirm --needed kvantum-manjaro kvantum-qt5

printf "\n-------------------------Install--Mozilla-------------------------\n"
sudo pacman -S --noconfirm --needed firefox thunderbird
# make script for firefox-trunk

printf "\n-------------------------Install--Flatpack-------------------------\n"




printf "\n-------------------------Install--gdebi-------------------------\n"
# Not needed

printf "\n-------------------------Install--Nemo-------------------------\n"
sudo pacman -S --noconfirm --needed nemo
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.nemo.desktop show-desktop-icons true
# add nemo to startup apps & disable desktop icon extension

sudo pacman -S nemo-fileroller nemo-image-converter nemo-audio-tab nemo-bulk-rename nemo-compare nemo-media-columns nemo-pdf-tools nemo-preview  nemo-share --noconfirm --needed

cp /usr/share/applications/nemo.desktop ~/.local/share/applications/nemo.desktop
sed -i "s/Actions=open-home;open-computer;open-trash;/Actions=new-window;open-home;open-computer;open-trash;\n\n[Desktop Action new-window]\nName=New Window\nExec=nemo\n\n/g" ~/.local/share/applications/nemo.desktop

printf "\n-------------------------Install--Lollypop-------------------------\n"
sudo pacman -S --noconfirm --needed lollypop

printf "\n-------------------------Install--GreenTunnel-------------------------\n"
sudo pacman -S --noconfirm --needed nodejs npm
sudo npm i -g green-tunnel

printf "\n-------------------------Install--FreeTube-------------------------\n"
# paru freetube

printf "\n-------------------------Install--Wireshark-------------------------\n"
sudo pacman -S --noconfirm --needed wireshark-qt

printf "\n-------------------------Install--VLC-------------------------\n"
sudo pacman -S --noconfirm --needed vlc

printf "\n-------------------------Install--Copyq-------------------------\n"
sudo pacman -S --noconfirm --needed copyq

printf "\n-------------------------Install--vnstat-------------------------\n"
sudo pacman -S --noconfirm --needed vnstat
sudo systemctl enable vnstat.service
sudo systemctl start vnstat.service

printf "\n-------------------------Install--PulseEffects-------------------------\n"
sudo pacman -S --noconfirm --needed manjaro-pipewire gst-plugin-pipewire pulseeffects

printf "\n-------------------------Install--uget-------------------------\n"


printf "\n-------------------------Install--qBittorrent-------------------------\n"
sudo pacman -S --noconfirm --needed qbittorrent

printf "\n-------------------------Install--Flameshot-------------------------\n"
sudo pacman -S --noconfirm --needed flameshot

printf "\n-------------------------Install--fusuma-------------------------\n"
sudo pacman -S --noconfirm --needed ruby libinput
sudo sed -i "s/gem: --user-install/gem: --no-user-install/g" /etc/gemrc

sudo gem install fusuma
sudo gem install revdev
sudo gem install bundler
gsettings set org.gnome.desktop.peripherals.touchpad send-events enabled
# --- #
printf "\n-------------------------Install--fusuma-gems-------------------------\n"
sudo pacman -S --noconfirm --needed libevdev base-devel
sudo gem install fusuma-plugin-sendkey
sudo gem install fusuma-plugin-keypress

sudo pacman -S --noconfirm --needed wmctrl
sudo gem install fusuma-plugin-wmctrl
sudo gem install fusuma-plugin-tap

printf "\n-------------------------Install--fonts-manager-------------------------\n"

printf "\n-------------------------Install--Atom-------------------------\n"
sudo pacman -S --noconfirm --needed atom

printf "\n-------------------------Install--obs-studio-------------------------\n"
sudo pacman -S --noconfirm --needed obs-studio

printf "\n-------------------------Install--vscodium-------------------------\n"
# paru vscodium-bin vscodium-bin-marketplace

printf "\n-------------------------Install--Sublime-------------------------\n"
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
sudo pacman -Syu --noconfirm --needed sublime-text

printf "\n-------------------------Install--Signal-------------------------\n"
sudo pacman -S --noconfirm --needed signal-desktop

printf "\n-------------------------Install--youtube-dl-------------------------\n"
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
virt-manager --connect qemu:///session


printf "\n-------------------------Install--Xanmod-------------------------\n"
# Eh


printf "\n-------------------------Install--gnome-boxes & virt-manager-------------------------\n"
sudo pacman -S --noconfirm --needed gnome-boxes virt-manager ebtables
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
sudo systemctl restart libvirtd


printf "\n-------------------------Install--jetbrains-------------------------\n"
# sudo snap install pycharm-community --classic
# # flatpak install flathub com.jetbrains.PyCharm-Community -y
# sudo snap install clion --classic
# # flatpak install flathub com.jetbrains.CLion -y
# Use toolbox

printf "\n-------------------------Install--telegram-------------------------\n"
sudo pacman -S --noconfirm --needed telegram-desktop


printf "\n-------------------------Install--WhatsApp-------------------------\n"
sudo pacman -S --noconfirm --needed whatsapp-for-linux
# sudo snap install whatsdesk


printf "\n-------------------------Install--BingWall-------------------------\n"
sudo snap install bing-wall
sudo snap install wonderwall






printf "\n---------------------------------------------------------------------------\n"
printf "\n\n\n-------------------------Applying Tweaks-------------------------\n\n\n"
printf "\n--------------------------Tweaks---Some common Settings-------------------------\n"

# Enable color output in pacman
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf

# fix for dual boot time issue
timedatectl set-local-rtc 1


echo GRUB_DISABLE_OS_PROBER=false|sudo tee -a /etc/default/grub && sudo update-grub
gsettings set org.gnome.desktop.privacy remove-old-temp-files 'true'
gsettings set org.gnome.mutter center-new-windows 'true'
gsettings set org.gnome.nautilus.preferences show-create-link 'true'

echo "alias ll='ls -alh --color'" | sudo tee -a /home/hritwik/.zshrc
source ~/.zshrc		# this does not work in script, do this manually

sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer

gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"

gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"


echo "" | sudo tee -a /etc/environment
echo "DRI_PRIME=1" | sudo tee -a /etc/environment
echo "MOZ_ENABLE_WAYLAND=1" | sudo tee -a /etc/environment
# echo "export QT_STYLE_OVERRIDE=kvantum" | sudo tee -a /etc/environment # already present in manjaro

# for force qt5 to use wayland
echo "" | sudo tee -a /etc/environment
echo "QT_QPA_PLATFORM=wayland" | sudo tee -a /etc/environment
# Below is for sway WM
# sudo pacman -S --noconfirm --needed qt5ct
# echo "QT_QPA_PLATFORMTHEME=qt5ct" | sudo tee -a /etc/environment


printf "\n--------------------------Tweaks---Telegram-------------------------\n"
unzip ./configs/telegram.zip -d /home/hritwik/

printf "\n--------------------------Tweaks---Signal-------------------------\n"
unzip ./configs/signal.zip -d /home/hritwik/

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
# gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false

printf "\n--------------------------Tweaks---Increment volume by 4-------------------------\n"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-step 4

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

printf "\n--------------------------Tweaks---Pulseeffects-------------------------\n"
echo "[Desktop Entry] Hidden=true" > /tmp/1
find /usr -name "*lsp_plug*desktop" 2>/dev/null | cut -f 5 -d '/' | xargs -I {} cp /tmp/1 ~/.local/share/applications/{}

sudo cp ./configs/PulseEffects_MyPreset.json /home/hritwik/.config/PulseEffects/output

printf "\n--------------------------Tweaks---startup-Apps-------------------------\n"
rm -rf /home/hritwik/.config/autostart/
cp -r ./configs/autostart/ /home/hritwik/.config/
sudo chmod +x /home/hritwik/.config/autostart/*

printf "\n--------------------------Tweaks---firefox-------------------------\n"
rm -rf /home/hritwik/.mozilla
unzip ./configs/firefox_bak.zip -d /home/hritwik/

printf "\n--------------------------Tweaks---thunderbird-------------------------\n"
rm -rf /home/hritwik/.thunderbird
unzip ./configs/thunderbird_bak.zip -d /home/hritwik/

printf "\n--------------------------Tweaks---Atom-------------------------\n"
# rm -rf /home/hritwik/.atom
# unzip ./configs/atom_bak.zip -d /home/hritwik/
# rm -rf /home/hritwik/.atom/recovery/

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
# sudo swapoff /swapfile
# sudo dd if=/dev/zero of=/swapfile bs=1M count=6144 oflag=append conv=notrunc
# sudo mkswap /swapfile
# sudo swapon /swapfile

printf "\n-------------------------Tweaks--fusuma-config-------------------------\n"
rm -rf /home/hritwik/.config/fusuma
mkdir -p /home/hritwik/.config/fusuma/
cp ./configs/config.yml /home/hritwik/.config/fusuma/

printf "\n--------------------------Tweaks---Vnstat-------------------------\n"
cp ./configs/.vnstatrc /home/hritwik/

printf "\n--------------------------Tweaks---Qbittorrent-------------------------\n"
rm -rf /home/hritwik/.config/qBittorrent
rm -rf /home/hritwik/.local/share/data/qBittorrent
unzip ./configs/qbit_settings.zip -d /home/hritwik/
unzip ./configs/qbit_data.zip -d /home/hritwik/

printf "\n--------------------------Tweaks---XDM-------------------------\n"
unzip ./configs/xdm.zip -d /home/hritwik/



printf "\n---------------------------------------------------------------------------\n"
printf "\n\n\n-------------------------Theming & Installing Extensions-------------------------\n\n\n"

printf "\n--------------------------Theme_Ext---Grub-theme-------------------------\n"
rm -rf /home/hritwik/my_downloads/grub_themes
git clone --depth 1 https://github.com/vinceliuice/grub2-themes.git /home/hritwik/my_downloads/grub_themes
sudo /home/hritwik/my_downloads/grub_themes/install.sh -t slaze -i white


printf "\n--------------------------Theme_Ext---Theme: Yaru-Colors-------------------------\n"
rm -rf /home/hritwik/my_downloads/Yaru-Colors
git clone --depth 1 https://github.com/Jannomag/Yaru-Colors.git /home/hritwik/my_downloads/Yaru-Colors
/home/hritwik/my_downloads/Yaru-Colors/install.sh

sudo snap install yaru-colors
for i in $(snap connections | grep gtk-common-themes:gtk-3-themes | awk '{print $2}'); do sudo snap connect $i yaru-colors:gtk-3-themes; done
for i in $(snap connections | grep gtk-common-themes:gtk-2-themes | awk '{print $2}'); do sudo snap connect $i yaru-colors:gtk-2-themes; done
for i in $(snap connections | grep gtk-common-themes:icon-themes | awk '{print $2}'); do sudo snap connect $i yaru-colors:icon-themes; done




printf "\n--------------------------Theme_Ext---App theme: orchis-dark-------------------------\n"
# rm -rf /home/hritwik/my_downloads/orchis-dark
# git clone --depth 1 https://github.com/vinceliuice/Orchis-theme.git /home/hritwik/my_downloads/orchis-dark
# sudo /home/hritwik/my_downloads/orchis-dark/install.sh
# sudo snap install orchis-themes
# gsettings set org.gnome.desktop.interface gtk-theme 'Orchis-dark'


printf "\n--------------------------Theme_Ext---icon & Curser theme: Pop-------------------------\n"
# sudo apt install pop-icon-theme -y
# gsettings set org.gnome.desktop.interface icon-theme 'Pop'
# gsettings set org.gnome.desktop.interface cursor-theme 'Pop'


printf "\n--------------------------Theme_Ext---shell-theme & Extensions-------------------------\n"
unzip ./configs/extensions_bak.zip -d /home/hritwik/.local/share/gnome-shell/

rm -rf /home/hritwik/my_downloads/materia-theme
git clone --depth 1 https://github.com/nana-4/materia-theme.git /home/hritwik/my_downloads/materia-theme
sudo /home/hritwik/my_downloads/materia-theme/install.sh
gsettings set org.gnome.shell.extensions.user-theme name 'Materia-dark'

printf "\n--------------------------Theme_Ext---fonts-------------------------\n"
# rm -rf /home/hritwik/my_downloads/pop_fonts
# git clone --depth 1 https://github.com/pop-os/fonts.git /home/hritwik/my_downloads/pop_fonts
# cd /home/hritwik/my_downloads/pop_fonts/
# sudo make install

# gsettings set org.gnome.desktop.interface font-name 'Fira Sans Semi-Light 11'
# gsettings set org.gnome.desktop.interface document-font-name 'Roboto Slab 11'
# gsettings set org.gnome.desktop.interface monospace-font-name 'Fira Mono 13'
# gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Fira Sans Semi-Bold 11'
gsettings set org.gnome.desktop.interface text-scaling-factor 0.85




printf "\n---------------------------------------------------------------------------\n"
printf "\n\n\n-------------------------Finished Successfully-------------------------\n\n\n"


printf "\n---------------------------------------------------------------------------\n"
printf "\n\n\n-------------------------Final changes-------------------------\n\n\n"
printf "\n--------------------------Final-add-user-to-input-group-------------------------\n"
sudo usermod -a -G input $(whoami)
newgrp input
sudo usermod -a -G libvirt $(whoami)
newgrp libvirt
sudo usermod -a -G kvm $(whoami)
newgrp kvm
sudo usermod -a -G adbusers $(whoami)
newgrp adbusers
sudo usermod -a -G wireshark $(whoami)
newgrp wireshark
