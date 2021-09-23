#!/bin/bash


# Start timeshift first

# pacman, Enable color output
sudo sed -i 's/#Color/Color\nILoveCandy/g' /etc/pacman.conf
sudo sed -i 's/#ParallelDownloads/ParallelDownloads/g' /etc/pacman.conf

sudo pacman-mirrors -c United_States
sudo pacman-mirrors --fasttrack 5
sudo pacman -Syyu yay yadm micro --noconfirm

# update Kernels

# cd to my_guides/src/scripts

printf "\n--------------------------Restore---mozilla-------------------------\n"
rm -rf ~/.mozilla
unzip ./configs/mozilla.zip -d ~


printf "\n--------------------------Restore---git_ssh-------------------------\n"
git config --global user.email "Hritwiksinghal@outlook.in"
git config --global user.name "Hritwik"
rm -rf ~/.ssh
unzip ./configs/ssh.zip -d ~


printf "\n--------------------------Restore---Keyboard Layout-------------------------\n"
sudo mv /usr/share/X11/xkb/symbols/pc /usr/share/X11/xkb/symbols/pc_bak
sudo mv /usr/share/X11/xkb/symbols/us /usr/share/X11/xkb/symbols/us_bak
sudo cp ./configs/pc /usr/share/X11/xkb/symbols/pc
sudo cp ./configs/us /usr/share/X11/xkb/symbols/us

gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"

gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"


gsettings set org.gnome.settings-daemon.plugins.media-keys volume-step 4
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.FileRoller.General compression-level "very-fast"

# Restart

yadm clone git@gitlab.com:Hritwik/dotfiles.git

# check before running below command, Read the warning in YADM first.
# yadm checkout "home/hritwik"


printf "\n---------------------------------------------------------------------------\n"
printf "\n\n\n-------------------------Insatlling Apps-------------------------\n\n\n"


printf "\n-------------------------Install--extras-------------------------\n"

sudo pacman -S --noconfirm --needed exfat-utils ntfs-3g 
sudo pacman -S --noconfirm --needed filezilla git rar unrar p7zip
sudo pacman -S --noconfirm --needed gnome-music gnote gnome-weather gnome-clocks
sudo pacman -S --noconfirm --needed dconf-editor net-tools curl eog nano tmux
sudo pacman -S --noconfirm --needed nautilus-admin htop dnsutils system-config-printer

sudo pacman -S --noconfirm --needed libreoffice-fresh conky libmythes mythes-en languagetool aspell-en
sudo pacman -S --noconfirm --needed yay qt5-wayland qt6-wayland base-devel wl-clipboard qgnomeplatform
sudo pacman -Rs --noconfirm firefox-gnome-theme-maia onlyoffice-desktopeditors firefox thunderbird

# ADB
sudo pacman -S --noconfirm --needed android-tools android-udev


# sudo apt install ttf-mscorefonts-installer -y
# sudo apt install libavcodec-extra libavcodec-extra58 sassc -y

# # Below one is needed only for blur shell extensions
# sudo apt install gir1.2-clutter-1.0 gir1.2-clutter-gst-3.0 gir1.2-gtkclutter-1.0 -y

# # extra codecs
# sudo pacman -S a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv opus wavpack x264 xvidcore  --noconfirm --needed

printf "\n-------------------------Install--KDE tools-------------------------\n"
sudo pacman -S --noconfirm --needed thunar kate kid3 kio

printf "\n-------------------------Install--Wine & Proton-------------------------\n"


printf "\n-------------------------Install--java-------------------------\n"
sudo pacman -S --noconfirm --needed jre-openjdk jdk-openjdk

printf "\n-------------------------Install--Timeshift-------------------------\n"
sudo pacman -S --noconfirm --needed timeshift cronie
sudo systemctl enable cronie
sudo systemctl start cronie

printf "\n-------------------------Install--nmcli-------------------------\n"
# sudo pacman -S --noconfirm --needed networkmanager
# sudo systemctl enable NetworkManager.service
# sudo systemctl start NetworkManager.service

printf "\n-------------------------Install--GNOME-tweak-tool and chrome-gnome-shell-------------------------\n"
sudo pacman -S --noconfirm --needed gnome-tweaks chrome-gnome-shell

printf "\n-------------------------Install--Kvantum-------------------------\n"
sudo pacman -S --noconfirm --needed kvantum-manjaro kvantum-qt5

printf "\n-------------------------Install--Mozilla-------------------------\n"
# sudo pacman -S --noconfirm --needed firefox thunderbird
# make script for firefox-trunk
# https://github.com/Linux-Is-Best/Firefox-automatic-install-for-Linux

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

printf "\n-------------------------Install--EasyEffects-------------------------\n"
# sudo pacman -S --noconfirm --needed manjaro-pipewire gst-plugin-pipewire easyeffects
sudo pacman -S --noconfirm --needed easyeffects

printf "\n-------------------------Install--uget-or-XDM-------------------------\n"
yay -S --noconfirm --needed xdman

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
sudo pacman -S --noconfirm --needed font-manager

printf "\n-------------------------Install--Atom-------------------------\n"
sudo pacman -S --noconfirm --needed atom

printf "\n-------------------------Install--obs-studio-------------------------\n"
sudo pacman -S --noconfirm --needed obs-studio

printf "\n-------------------------Install--vscodium-------------------------\n"
# yay -S --noconfirm --needed vscodium-bin vscodium-bin-marketplace vscodium-bin-features

# for code oss
# yay -S --noconfirm --needed code-marketplace code-features-insiders code-icons

printf "\n-------------------------Install--Sublime-------------------------\n"
# curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
# echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
# sudo pacman -Syu --noconfirm --needed sublime-text

printf "\n-------------------------Install--Signal-------------------------\n"
sudo pacman -S --noconfirm --needed signal-desktop

printf "\n-------------------------Install--youtube-dl-------------------------\n"
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl


printf "\n-------------------------Install--Xanmod-------------------------\n"
# Eh


printf "\n-------------------------Install--gnome-boxes & virt-manager-------------------------\n"
sudo pacman -S --noconfirm --needed gnome-boxes virt-manager ebtables
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
sudo systemctl restart libvirtd
virt-manager --connect qemu:///session


printf "\n-------------------------Install--jetbrains-------------------------\n"
# Use toolbox

printf "\n-------------------------Install--telegram-------------------------\n"
sudo pacman -S --noconfirm --needed telegram-desktop


printf "\n-------------------------Install--WhatsApp-------------------------\n"
sudo pacman -S --noconfirm --needed whatsapp-for-linux
# sudo snap install whatsdesk


printf "\n-------------------------Install--BingWall-------------------------\n"
sudo snap install bing-wall
sudo snap install wonderwall


printf "\n-------------------------Install--appimagelauncher-------------------------\n"
sudo pacman -S --noconfirm --needed appimagelauncher

printf "\n-------------------------Install--Rust-tools-------------------------\n"
# Rust core utils
sudo pacman -S --noconfirm --needed exa bat ripgrep fd procs micro fzf tldr neovim fish zsh
micro -plugin install aspell wc


printf "\n-------------------------Install--spacevim-------------------------\n"
curl -sLf https://spacevim.org/install.sh | bash


printf "\n-------------------------Install--AUR packages-------------------------\n"
yay -S --noconfirm --needed paru-bin reflector ghostwriter yadm bash-zsh-insulter
yay -S --noconfirm --needed brave-bin brlaser brother-hll2360d brother-lpr-drivers-common ebtables
yay -S --noconfirm --needed firefox-profile-switcher-connector-bin lib32-ncurses5-compat-libs ncurses5-compat-libs ruby-revdev
yay -S --noconfirm --needed qemu-user-static-bin binfmt-qemu-static-all-arch
yay -S --noconfirm --needed warpinator webapp-manager

printf "\n-------------------------Install--Python packages-------------------------\n"
pip3 install pipenv yt-dlp youtube_dlc





printf "\n---------------------------------------------------------------------------\n"
printf "\n\n\n-------------------------Applying Tweaks-------------------------\n\n\n"



printf "\n--------------------------Restore---dconf-settings-------------------------\n"

# Backup first
dconf dump /org/gnome/ > /home/hritwik/org.gnome_Bak
dconf dump /org/nemo/ > /home/hritwik/org.nemo_Bak
dconf dump /com/github/wwmm/easyeffects/ > /home/hritwik/com.github.wwmm.easyeffects_Bak

dconf load /org/gnome/ < ./configs/gsettings/org.gnome
dconf load /org/nemo/ < ./configs/gsettings/org.nemo
dconf load /com/github/wwmm/easyeffects/ < ./configs/gsettings/com.github.wwmm.easyeffects



printf "\n--------------------------Tweaks---Some common Settings-------------------------\n"


#################################################################################
################################# Needs testing #################################


# QT Tweaks

# QT_QPA_PLATFORM=xcb           # Force to use Xwayland backend
# QT_QPA_PLATFORM=wayland 		# Force to use wayland backend, also install qt5-wayland & qt6-wayland
# echo "QT_STYLE_OVERRIDE=kvantum-dark" | sudo tee -a /etc/environment      # replace instead of add

# QT_AUTO_SCREEN_SCALE_FACTOR=1
# QT_QPA_PLATFORMTHEME="gnome"
# QT_STYLE_OVERRIDE="kvantum-dark"
# QT_QPA_PLATFORM=wayland


sudo sed -i 's/QT_STYLE_OVERRIDE=kvantum/QT_STYLE_OVERRIDE=kvantum-dark/g' /etc/environment

echo "" | sudo tee -a /etc/environment
echo "QT_QPA_PLATFORM=wayland" | sudo tee -a /etc/environment


# Graphics card, use dGPU
echo "" | sudo tee -a /etc/environment
echo "DRI_PRIME=1" | sudo tee -a /etc/environment


echo "AMD_VULKAN_ICD=RADV" | sudo tee -a /etc/environment

# Firefox, run in wayland mode
echo "MOZ_ENABLE_WAYLAND=1" | sudo tee -a /etc/environment



# goes to .profile
# export AMD_VULKAN_ICD=RADV
# export EDITOR=/usr/bin/micro
# export BROWSER=firefox
# export TERM=alacritty
# export MAIL=geary
# export QT_QPA_PLATFORMTHEME="qt5ct"
# export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

################################# Needs testing #################################
#################################################################################



# paru. Enable bottomup, SkipReview
sudo sed -i 's/#BottomUp/BottomUp/g' /etc/paru.conf
echo 'SkipReview' | sudo tee -a /etc/paru.conf


# fix for dual boot time issue
timedatectl set-local-rtc 1

# Grub, Enable Os-prober
# echo GRUB_DISABLE_OS_PROBER=false | sudo tee -a /etc/default/grub && sudo update-grub

# SSD
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer

# Gsettings
gsettings set org.gnome.desktop.privacy remove-old-temp-files 'true'
gsettings set org.gnome.mutter center-new-windows 'true'
gsettings set org.gnome.nautilus.preferences show-create-link 'true'


printf "\n--------------------------Tweaks---extra-app-presets-in-menu-------------------------\n"
echo "[Desktop Entry] Hidden=true" > /tmp/1
find /usr -name "*lsp_plug*desktop" 2>/dev/null | cut -f 5 -d '/' | xargs -I {} cp /tmp/1 ~/.local/share/applications/{}






printf "\n---------------------------------------------------------------------------\n"
printf "\n\n\n-------------------------Theming & Installing Extensions-------------------------\n\n\n"

printf "\n--------------------------Theme_Ext---Grub-theme-------------------------\n"
rm -rf /home/hritwik/my_downloads/grub_themes
git clone --depth 1 https://github.com/vinceliuice/grub2-themes.git /home/hritwik/my_downloads/grub_themes
sudo /home/hritwik/my_downloads/grub_themes/install.sh -t slaze -i white


printf "\n--------------------------Theme_Ext---Theme: Yaru-Colors-------------------------\n"

sudo snap install yaru-colors
for i in $(snap connections | grep gtk-common-themes:gtk-3-themes | awk '{print $2}'); do sudo snap connect $i yaru-colors:gtk-3-themes; done
for i in $(snap connections | grep gtk-common-themes:gtk-2-themes | awk '{print $2}'); do sudo snap connect $i yaru-colors:gtk-2-themes; done
for i in $(snap connections | grep gtk-common-themes:icon-themes | awk '{print $2}'); do sudo snap connect $i yaru-colors:icon-themes; done


printf "\n--------------------------Theme_Ext---shell-theme & Extensions-------------------------\n"
unzip ./configs/extensions_bak.zip -d /home/hritwik/.local/share/gnome-shell/

gsettings set org.gnome.desktop.interface text-scaling-factor 0.85


# - reduce 5% reserved space on ext4 home and / to 2%
#     - https://unix.stackexchange.com/questions/527628/disk-usage-confusion-10g-missing-on-linux-home-partition-on-ssd
#     - sudo tune2fs -m 2 /dev/nvme0n1p4
#     - sudo tune2fs -m 2 /dev/nvme0n1p3



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
