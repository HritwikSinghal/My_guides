#!/bin/sh
set -e



sudo apt-mark hold libegl-mesa0 libgbm1 libgl1-mesa-dri libglapi-mesa libglx-mesa0

printf "\n---------------------------------------------------------------------------\n"
# add repositories
printf "\n\n\n-------------------------Adding Repositories-------------------------\n\n\n"
printf "\n-------------------------AddRepo---Ubuntu defaults-------------------------\n"
sudo add-apt-repository universe -y
sudo add-apt-repository multiverse -y
sudo add-apt-repository restricted -y
sudo add-apt-repository ppa:obsproject/obs-studio -y

printf "\n-------------------------AddRepo---Timeshift-------------------------\n"
sudo apt-add-repository ppa:teejee2008/ppa -y

printf "\n-------------------------AddRepo---Kvantum-------------------------\n"
sudo add-apt-repository ppa:papirus/papirus -y

printf "\n-------------------------AddRepo---Mozilla-------------------------\n"
sudo add-apt-repository ppa:ubuntu-mozilla-security/ppa -y
sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa -y

printf "\n-------------------------AddRepo---lollypop-------------------------\n"
sudo add-apt-repository ppa:gnumdk/lollypop -y

printf "\n-------------------------AddRepo---PulseEffects-------------------------\n"
sudo add-apt-repository ppa:mikhailnov/pulseeffects -y

printf "\n-------------------------AddRepo---qBittorrent-------------------------\n"
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y

printf "\n-------------------------AddRepo---atom-------------------------\n"
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'

printf "\n-------------------------AddRepo---LibreOffice-------------------------\n"
sudo add-apt-repository ppa:libreoffice/ppa -y

printf "\n-------------------------AddRepo---Kdenlive-------------------------\n"
sudo add-apt-repository ppa:kdenlive/kdenlive-stable -y

printf "\n-------------------------AddRepo---bashtop-------------------------\n"
sudo add-apt-repository ppa:bashtop-monitor/bashtop -y


printf "\n-------------------------AddRepo---vscodium-------------------------\n"
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/etc/apt/trusted.gpg.d/vscodium-archive-keyring.gpg

echo 'deb [signed-by=/etc/apt/trusted.gpg.d/vscodium-archive-keyring.gpg] https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs/ vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list


printf "\n-------------------------AddRepo---Xanmod-------------------------\n"
echo 'deb http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-kernel.list
wget -qO - https://dl.xanmod.org/gpg.key | sudo apt-key --keyring /etc/apt/trusted.gpg.d/xanmod-kernel.gpg add -

# below ones will cause problem when not ubuntu 20.04
printf "\n-------------------------AddRepo---Flatpack-------------------------\n"
sudo add-apt-repository ppa:alexlarsson/flatpak -y

printf "\n-------------------------AddRepo---conky-------------------------\n"
sudo add-apt-repository ppa:linuxmint-tr/araclar -y
sudo apt update
sudo apt install conky conky-all conky-manager -y
sudo add-apt-repository --remove ppa:linuxmint-tr/araclar -y

printf "\n-------------------------AddRepo---Wireshark-------------------------\n"
sudo add-apt-repository ppa:wireshark-dev/stable -y

# Uget (this is not working)
# sudo add-apt-repository ppa:plushuang-tw/uget-stable -y







printf "\n---------------------------------------------------------------------------\n"
printf "\n\n\n-------------------------Insatlling Apps-------------------------\n\n\n"
printf "\n--------------------------apt update && apt upgrade-------------------------\n"
sudo apt update && sudo apt upgrade -y

printf "\n-------------------------Install--Ubuntu-extras-------------------------\n"

sudo apt install ubuntu-restricted-extras ttf-mscorefonts-installer -y
sudo apt install exfat-fuse exfat-utils ntfs-3g -y
sudo apt install filezilla git rar unrar p7zip-full p7zip-rar -y
sudo apt install gnome-music gnote gnome-weather gnome-clocks -y
sudo apt install synaptic kate dconf-editor net-tools ppa-purge curl -y
sudo apt install nautilus-admin bashtop htop -y
sudo apt install python3-pip python3-dev python3-distutils python3-venv -y
pip3 install virtualenv youtube_dlc

# sudo snap install bashtop
# sudo apt install preload -y
# sudo apt install pavucontrol -y

sudo apt install libavcodec-extra libavcodec-extra58 sassc -y
# Below one is needed only for blur shell extensions
# sudo apt install gir1.2-clutter-1.0 gir1.2-clutter-gst-3.0 gir1.2-gtkclutter-1.0 -y



printf "\n-------------------------Install--Wine-------------------------\n"
sudo apt install wine winetricks -y

printf "\n-------------------------Install--java-------------------------\n"
sudo apt install openjdk-11-jdk openjdk-11-jre-headless -y

printf "\n-------------------------Install--Timeshift-------------------------\n"
sudo apt install timeshift -y

printf "\n-------------------------Install--nmcli-------------------------\n"
sudo apt install network-manager -y
sudo systemctl start NetworkManager.service
sudo systemctl start NetworkManager.service

printf "\n-------------------------Install--GNOME-tweak-tool and chrome-gnome-shell-------------------------\n"
sudo apt install gnome-tweaks -y
sudo apt install chrome-gnome-shell -y

printf "\n-------------------------Install--Kvantum-------------------------\n"
sudo apt install qt5-style-kvantum qt5-style-kvantum-themes -y

printf "\n-------------------------Install--Mozilla-------------------------\n"
sudo apt install firefox firefox-trunk thunderbird -y

printf "\n-------------------------Install--Flatpack-------------------------\n"
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

printf "\n-------------------------Install--gdebi-------------------------\n"
sudo apt install gdebi-core -y

printf "\n-------------------------Install--Nemo-------------------------\n"
sudo apt install nemo -y
gnome-shell-extension-tool -d desktop-icons@csoriano
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.nemo.desktop show-desktop-icons true
# Latest: https://github.com/linuxmint/nemo/releases/latest


printf "\n-------------------------Install--Lollypop-------------------------\n"
sudo apt install lollypop -y

printf "\n-------------------------Install--GreenTunnel-------------------------\n"
sudo apt install nodejs npm -y
sudo npm i -g green-tunnel

printf "\n-------------------------Install--FreeTube-------------------------\n"
# flatpak install flathub io.freetubeapp.FreeTube -y

printf "\n-------------------------Install--Wireshark-------------------------\n"
sudo apt install wireshark -y

printf "\n-------------------------Install--VLC-------------------------\n"
sudo apt install vlc -y

printf "\n-------------------------Install--Copyq-------------------------\n"
sudo apt install copyq -y


printf "\n-------------------------Install--vnstat-------------------------\n"
sudo apt install vnstat -y
cp ./configs/.vnstatrc /home/hritwik/
sudo systemctl enable vnstat.service
sudo systemctl start vnstat.service

printf "\n-------------------------Install--PulseEffects-------------------------\n"
sudo apt install pulseaudio pulseeffects --install-recommends -y
mkdir -p /home/hritwik/.config/PulseEffects/output/
sudo cp ./configs/PulseEffects_MyPreset.json /home/hritwik/.config/PulseEffects/output

printf "\n-------------------------Install--uget-------------------------\n"
sudo apt install uget -y
sudo apt install uget aria2 -y

printf "\n-------------------------Install--qBittorrent-------------------------\n"
sudo apt install qbittorrent -y
# sudo snap install qbittorrent-arnatious

printf "\n-------------------------Install--Flameshot-------------------------\n"
sudo apt install flameshot -y

printf "\n-------------------------Install--fusuma-------------------------\n"
sudo apt install libinput-tools -y
sudo apt install ruby -y
sudo gem install fusuma
sudo apt install xdotool -y
gsettings set org.gnome.desktop.peripherals.touchpad send-events enabled
# ---
printf "\n-------------------------Install--fusuma-gems-------------------------\n"
sudo apt install libevdev-dev ruby-dev build-essential -y
sudo gem install fusuma-plugin-sendkey
sudo gem install fusuma-plugin-keypress
sudo apt install wmctrl -y
sudo gem install fusuma-plugin-wmctrl
sudo gem install fusuma-plugin-tap

printf "\n-------------------------Install--fonts-manager-------------------------\n"
sudo apt install font-manager -y



printf "\n-------------------------Install--Atom-------------------------\n"
sudo apt install atom -y

printf "\n-------------------------Install--obs-studio-------------------------\n"
sudo apt install ffmpeg -y
sudo apt install obs-studio -y

printf "\n-------------------------Install--vscodium-------------------------\n"
# flatpak install flathub com.vscodium.codium  -y
sudo apt install codium -y


printf "\n-------------------------Install--Sublime-------------------------\n"
# flatpak install flathub com.sublimetext.three -y
sudo apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common -y
curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/" -y
sudo apt install sublime-text -y

printf "\n-------------------------Install--Signal-------------------------\n"
wget -O- https://updates.signal.org/desktop/apt/keys.asc |\
  sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" |\
    sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install signal-desktop -y


printf "\n-------------------------Install--youtube-dl-------------------------\n"
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl


printf "\n-------------------------Install--Xanmod-------------------------\n"
sudo apt install linux-xanmod -y
sudo apt install intel-microcode iucode-tool -y

printf "\n-------------------------Install--gnome-boxes & virt-manager-------------------------\n"
sudo apt install gnome-boxes -y
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst virt-manager -y
virt-manager --connect qemu:///session

printf "\n-------------------------Install--Python2-purge-------------------------\n"
sudo apt purge python2 -y
sudo rm -f /usr/bin/python
sudo ln -s /usr/bin/python3 /usr/bin/python

sudo apt install -y python3-pip
sudo rm -f /usr/bin/pip
sudo ln -s /usr/bin/pip3 /usr/bin/pip


printf "\n-------------------------Install--jetbrains-------------------------\n"
sudo snap install pycharm-community --classic
# flatpak install flathub com.jetbrains.PyCharm-Community -y
# Clion
sudo snap install clion --classic
# flatpak install flathub com.jetbrains.CLion -y

printf "\n-------------------------Install--telegram-------------------------\n"
sudo snap install telegram-desktop
# flatpak install flathub org.telegram.desktop -y

printf "\n-------------------------Install--WhatsApp-------------------------\n"
sudo snap install whatsdesk
# flatpak install io.bit3.WhatsAppQT -y

printf "\n-------------------------Install--BingWall-------------------------\n"
sudo snap install bing-wall
sudo snap install wonderwall








printf "\n---------------------------------------------------------------------------\n"
printf "\n\n\n-------------------------Applying Tweaks-------------------------\n\n\n"
printf "\n--------------------------Tweaks---Some common Settings-------------------------\n"
gsettings set org.gnome.desktop.privacy remove-old-temp-files 'true'
gsettings set org.gnome.mutter center-new-windows 'true'
gsettings set org.gnome.nautilus.preferences show-create-link 'true'



echo "" | sudo tee -a /etc/environment
echo "DRI_PRIME=1" | sudo tee -a /etc/environment
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









printf "\n---------------------------------------------------------------------------\n"
printf "\n\n\n-------------------------Theming & Installing Extensions-------------------------\n\n\n"

printf "\n--------------------------Theme_Ext---Grub-theme-------------------------\n"
rm -rf /home/hritwik/my_downloads/grub_themes
git clone --depth 1 https://github.com/vinceliuice/grub2-themes.git /home/hritwik/my_downloads/grub_themes
sudo /home/hritwik/my_downloads/grub_themes/install.sh --slaze


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
printf "\n--------------------------Final---Fusuma-add-user-to-input-group-------------------------\n"
sudo gpasswd -a hritwik input
newgrp input
sudo usermod -a -G libvirt hritwik
sudo usermod -a -G kvm hritwik
