#!/bin/bash


#############################
### Start timeshift first ###
#############################

##################################################################################
### To fix "Failed to commit transaction (invalid or corrupted package)" error ###
# find /var/cache/pacman/pkg/ -iname "*.part" -delete
##################################################################################

printf "\n---------------------------------------------------------------------------\n"
printf "\n---------------------------------------------------------------------------\n"
printf "\n---------------------------------------------------------------------------\n"

sudo pacman-mirrors -a -S unstable
sudo pacman-mirrors -c Global
sudo pacman-mirrors --fasttrack 5
sudo pacman -Syyu
sudo pacman -S --noconfirm --needed yay yadm micro


######################
### update Kernels ###
######################

printf "\n---------------------------------------------------------------------------\n"
printf "\n--------------------------Restore---Keyboard Layout-------------------------\n"
printf "\n---------------------------------------------------------------------------\n"
sudo mv /usr/share/X11/xkb/symbols/pc /usr/share/X11/xkb/symbols/pc_bak
sudo mv /usr/share/X11/xkb/symbols/us /usr/share/X11/xkb/symbols/us_bak
sudo cp ./configs/pc /usr/share/X11/xkb/symbols/pc
sudo cp ./configs/us /usr/share/X11/xkb/symbols/us

###################################
### cd to my_guides/src/scripts ###
###################################
printf "\n---------------------------------------------------------------------------\n"
printf "\n--------------------------Restore---mozilla-------------------------\n"
printf "\n---------------------------------------------------------------------------\n"
tar -xvf ~/Backups/mozilla.tar -C ~/

printf "\n---------------------------------------------------------------------------\n"
printf "\n--------------------------Restore---git-ssh-dconf-------------------------\n"
printf "\n---------------------------------------------------------------------------\n"
git config --global user.email "Hritwiksinghal@outlook.in"
git config --global user.name "Hritwik"
tar -xvf ~/Backups/ssh.tar -C ~/


printf "\n---------------------------------------------------------------------------\n"
printf "\n---------------------------------------------------------------------------\n"

gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"

gsettings set org.gnome.settings-daemon.plugins.media-keys volume-step 4
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.FileRoller.General compression-level "very-fast"


gsettings set org.gnome.desktop.privacy remove-old-temp-files 'true'
gsettings set org.gnome.mutter center-new-windows 'true'
gsettings set org.gnome.nautilus.preferences show-create-link 'true'
gsettings set org.gnome.desktop.interface text-scaling-factor 0.85


###############
### Restart ###
###############

cd ~
yadm clone git@gitlab.com:Hritwik/dotfiles.git

##########################################################################
### check before running below command, READ THE WARNING IN YADM FIRST ###

###**NOTE**
###  Local files with content that differs from the ones just
###  cloned were found in /home/hritwik. They have been left
###  unmodified.
###
###  Please review and resolve any differences appropriately.
###  If you know what you're doing, and want to overwrite the
###  tracked files, consider 'yadm checkout "/home/hritwik"'.

# yadm checkout "home/hritwik"
##########################################################################


# printf "\n-------------------------Removing-Useless-Extensions-------------------------\n"
# sudo pacman -Rdd gnome-shell-extension-arcmenu gnome-shell-extension-dash-to-dock gnome-shell-extension-unite gnome-shell-extension-gsconnect gnome-shell-extension-material-shell



printf "\n---------------------------------------------------------------------------\n"
printf "\n\n\n-------------------------Insatlling Apps-------------------------\n\n\n"


printf "\n-------------------------Install--extras-------------------------\n"

sudo pacman -S --noconfirm --needed exfat-utils ntfs-3g 
sudo pacman -S --noconfirm --needed filezilla git unrar p7zip rclone
sudo pacman -S --noconfirm --needed gnome-music gnote gnome-weather gnome-clocks
sudo pacman -S --noconfirm --needed dconf-editor curl eog nano tmux sshfs meld font-manager
sudo pacman -S --noconfirm --needed nautilus-admin htop dnsutils system-config-printer

sudo pacman -S --noconfirm --needed libreoffice-fresh conky libmythes mythes-en languagetool aspell-en
sudo pacman -S --noconfirm --needed yay qt5-wayland qt6-wayland base-devel wl-clipboard qgnomeplatform
sudo pacman -S --noconfirm --needed android-tools android-udev

sudo pacman -Rs --noconfirm firefox-gnome-theme-maia
sudo pacman -Rs --noconfirm onlyoffice-desktopeditors
sudo pacman -Rs --noconfirm touche touchegg gnome-shell-extension-x11gestures
sudo pacman -Rdd --noconfirm snapd

printf "\n-------------------------Install--Mozilla-------------------------\n"
sudo pacman -S --noconfirm --needed firefox thunderbird
git clone --depth 1 https://github.com/Linux-Is-Best/Firefox-automatic-install-for-Linux ~/my_downloads/firefox
chmod + x ~/my_downloads/firefox/Setup.sh && bash ~/my_downloads/firefox/Setup.sh


printf "\n-------------------------Install--KDE tools-------------------------\n"
sudo pacman -S --noconfirm --needed thunar kate kid3 kio kid3-cli


printf "\n-------------------------Install--java-------------------------\n"
sudo pacman -S --noconfirm --needed jre-openjdk jdk-openjdk

printf "\n-------------------------Install--Timeshift-------------------------\n"
sudo pacman -S --noconfirm --needed timeshift cronie
sudo systemctl enable --now cronie


printf "\n-------------------------Install--GNOME-tweak-tool and chrome-gnome-shell-------------------------\n"
sudo pacman -S --noconfirm --needed gnome-tweaks chrome-gnome-shell

printf "\n-------------------------Install--Flatpak-------------------------\n"
sudo pacman -S --noconfirm --needed flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

printf "\n-------------------------Install--Nemo-------------------------\n"
sudo pacman -S --noconfirm --needed nemo
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.nemo.desktop show-desktop-icons true

# add nemo to startup apps & disable desktop icon extension

sudo pacman -S --noconfirm --needed nemo-fileroller nemo-audio-tab nemo-bulk-rename nemo-preview

# nemo-compare nemo-media-columns nemo-pdf-tools are not in repos, get them from AUR
yay -S --noconfirm --needed nemo-compare nemo-media-columns nemo-pdf-tools

# for permission denied error in python
# sudo chmod 666 /usr/lib/python3.10/site-packages/google_api_core-2.3.2-py3.10.egg-info/

cp /usr/share/applications/nemo.desktop ~/.local/share/applications/nemo.desktop
sed -i "s/Actions=open-home;open-computer;open-trash;/Actions=new-window;open-home;open-computer;open-trash;\n\n[Desktop Action new-window]\nName=New Window\nExec=nemo\n\n/g" ~/.local/share/applications/nemo.desktop

printf "\n-------------------------Install--Lollypop-VLC-------------------------\n"
sudo pacman -S --noconfirm --needed lollypop vlc

printf "\n-------------------------Install--GreenTunnel-------------------------\n"
sudo pacman -S --noconfirm --needed nodejs npm
sudo npm i -g green-tunnel

printf "\n-------------------------Install--Wireshark-------------------------\n"
sudo pacman -S --noconfirm --needed wireshark-qt


printf "\n-------------------------Install--vnstat-------------------------\n"
sudo pacman -S --noconfirm --needed vnstat
sudo systemctl enable --now vnstat.service

#mkdir -p ~/.config/vnstat/
#sudo chmod -R 755 .config/vnstat/
#vnstatd --initdb
#sudo systemctl enable --now vnstatd.service
#sudo killall vnstatd
#vnstatd -d



printf "\n-------------------------Install--pipewire-------------------------\n"

# PipeWire currently uses the simple example session manager pipewire-media-session.
# To switch to the more powerful WirePlumber, install the wireplumber package,
# then disable the pipewire-media-session user unit, and enable the wireplumber.service user unit

# pulseaudio-equalizer sof-firmware

sudo pacman -Rdd --noconfirm manjaro-pulse pulseaudio pulseaudio-alsa pulseaudio-jack pulseaudio-lirc pulseaudio-rtp pulseaudio-zeroconf pulseaudio-bluetooth pulseaudio-ctl

sudo pacman -Rdd jack2 pipewire-media-session

systemctl disable pipewire-media-session --user
sudo pacman -S --noconfirm --needed xdg-desktop-portal xdg-desktop-portal-gtk \
                                    pipewire pipewire-alsa pipewire-pulse pipewire-jack manjaro-pipewire \
									gst-plugin-pipewire gstreamer-vaapi wireplumber

systemctl enable --now wireplumber --user
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
printf "\n-------------------------Install--fusuma-gems-------------------------\n"
sudo pacman -S --noconfirm --needed libevdev base-devel
sudo gem install fusuma-plugin-sendkey
sudo gem install fusuma-plugin-keypress

sudo pacman -S --noconfirm --needed wmctrl
sudo gem install fusuma-plugin-wmctrl
sudo gem install fusuma-plugin-tap


printf "\n-------------------------Install--obs-studio-------------------------\n"
sudo pacman -S --noconfirm --needed obs-studio

printf "\n-------------------------Install--Signal-------------------------\n"
sudo pacman -S --noconfirm --needed signal-desktop

printf "\n-------------------------Install--youtube-dl-------------------------\n"
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

printf "\n-------------------------Install--gnome-boxes & virt-manager-------------------------\n"
sudo pacman -Rdd --noconfirm iptables
sudo pacman -S --noconfirm --needed gnome-boxes virt-manager iptables-nft bridge-utils openbsd-netcat

sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
sudo systemctl restart libvirtd
virt-manager --connect qemu:///session

printf "\n-------------------------Install--telegram-------------------------\n"
sudo pacman -S --noconfirm --needed telegram-desktop


printf "\n-------------------------Install--BingWall-------------------------\n"
yay -S --noconfirm --needed bing-wall
flatpak install flathub com.ktechpit.wonderwall

printf "\n-------------------------Install--Rust-tools-------------------------\n"
sudo pacman -S --noconfirm --needed exa bat ripgrep fd procs micro fzf tldr neovim fish zsh python-pip appimagelauncher
micro -plugin install aspell wc


printf "\n-------------------------Install--spacevim-------------------------\n"
curl -sLf https://spacevim.org/install.sh | bash

printf "\n-------------------------Install--AUR packages-------------------------\n"
# also install reflector if not on manjaro
# dont ghostwriter, use marktext

yay -S --noconfirm --needed paru-bin brave-bin brlaser brother-hll2360d brother-lpr-drivers-common
yay -S  --noconfirm --needed marktext-bin


yay -S --noconfirm --needed warpinator webapp-manager firefox-profile-switcher-connector-bin 
yay -S --noconfirm --needed lib32-ncurses5-compat-libs ncurses5-compat-libs 

yay -S --noconfirm --needed qemu-user-static-bin binfmt-qemu-static-all-arch

printf "\n-------------------------Install--Python packages-------------------------\n"
pip3 install pipenv yt-dlp youtube_dlc
sudo wget -O /etc/bash.command-not-found https://raw.githubusercontent.com/HritwikSinghal/bash-insulter/master/src/bash.command-not-found

printf "\n-------------------------Install--Docker-------------------------\n"
sudo pacman -S --noconfirm --needed docker docker-compose

printf "\n-------------------------Install--jetbrains-------------------------\n"
yay -S --noconfirm --needed aur/jetbrains-toolbox


printf "\n-------------------------Install--nmcli-------------------------\n"
sudo pacman -S --noconfirm --needed networkmanager
sudo systemctl enable --now NetworkManager.service

printf "\n-------------------------Install--vscodium-------------------------\n"
yay -S --noconfirm --needed vscodium-bin vscodium-bin-marketplace vscodium-bin-features




# printf "\n-------------------------Install--Copyq-------------------------\n"
# sudo pacman -S --noconfirm --needed copyq

printf "\n-------------------------Install--Kvantum-------------------------\n"
# sudo pacman -S --noconfirm --needed kvantum-manjaro kvantum-qt5


printf "\n-------------------------Install--WhatsApp-------------------------\n"
# sudo pacman -S --noconfirm --needed whatsapp-for-linux
# sudo snap install whatsdesk

printf "\n-------------------------Install--Wine & Proton-------------------------\n"
# old packages
# net-tools

printf "\n-------------------------Install--Atom-------------------------\n"
# sudo pacman -S --noconfirm --needed atom


printf "\n-------------------------Install--Code-oss-------------------------\n"
# THIS IS NOT VSCODIUM
# yay -S --noconfirm --needed code-marketplace code-features-insiders code-icons

printf "\n-------------------------Install--Sublime-------------------------\n"
# curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
# echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
# sudo pacman -Syu --noconfirm --needed sublime-text

# yay -S --noconfirm --needed --overwrite ruby-revdev

printf "\n-------------------------Install--Chaotic-AUR-------------------------\n"
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo "" | sudo tee -a /etc/pacman.conf
echo "[chaotic-aur]" | sudo tee -a /etc/pacman.conf
echo "Include = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf

# https://aur.chaotic.cx/
# https://wiki.archlinux.org/title/Powerpill
# You may want to use powerpill to download from all mirrors simultaneously. We recommend doing updates this way: sudo pacman -Sy && sudo powerpill -Su && paru -Su.
# Make sure to insert all mirrors in your pacman.conf or use chaotic-mirrorlist with all of them active if using powerpill.

#################################################################################
################################# Needs testing #################################


# sudo apt install ttf-mscorefonts-installer -y
# sudo apt install libavcodec-extra libavcodec-extra58 sassc -y

# # Below one is needed only for blur shell extensions
# sudo apt install gir1.2-clutter-1.0 gir1.2-clutter-gst-3.0 gir1.2-gtkclutter-1.0 -y

# # extra codecs
# sudo pacman -S a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv opus wavpack x264 xvidcore  --noconfirm --needed



##################### - reduce 5% reserved space on ext4 home and / to 2% #####################
#     - https://unix.stackexchange.com/questions/527628/disk-usage-confusion-10g-missing-on-linux-home-partition-on-ssd
#     - sudo tune2fs -m 2 /dev/nvme0n1p4
#     - sudo tune2fs -m 2 /dev/nvme0n1p3



########################
### etc/environment ####
########################

# QT Tweaks

# QT_QPA_PLATFORM=xcb           # Force to use Xwayland backend
# QT_QPA_PLATFORMTHEME="qt5ct"

# echo "QT_STYLE_OVERRIDE=Adwaita-dark" | sudo tee -a /etc/environment      # replace instead of add
sudo sed -i 's/QT_STYLE_OVERRIDE=kvantum/QT_STYLE_OVERRIDE=Adwaita-dark/g' /etc/environment
echo "" | sudo tee -a /etc/environment



QT_AUTO_SCREEN_SCALE_FACTOR=1
QT_QPA_PLATFORMTHEME="gnome"
QT_STYLE_OVERRIDE="Adwaita-Dark"		# or Kvantum-dark
QT_QPA_PLATFORM=wayland         # Force to use wayland backend, also install qt5-wayland & qt6-wayland
EDITOR=/usr/bin/micro

# Graphics card, use dGPU
DRI_PRIME=1
AMD_VULKAN_ICD=RADV

# Firefox, run in wayland mode
echo "MOZ_ENABLE_WAYLAND=1" | sudo tee -a /etc/environment
MOZ_ENABLE_WAYLAND=1



#############################
### pacman, paru, makepkg ###
#############################


# pacman, Enable color output, not needed if /etc/pacman.conf is restored
# make backup of IgnorePkg in pacman.conf
sudo sed -i 's/#Color/Color\nILoveCandy/g' /etc/pacman.conf
sudo sed -i 's/#ParallelDownloads/ParallelDownloads/g' /etc/pacman.conf

# paru. Enable bottomup, SkipReview
# sudo sed -i 's/#BottomUp/BottomUp/g' /etc/paru.conf
# echo 'SkipReview' | sudo tee -a /etc/paru.conf


# for makepkg, make sure MAKEFLAGS is 
# MAKEFLAGS="-j$(($(nproc)+1))"

# Grub, Enable Os-prober
# echo GRUB_DISABLE_OS_PROBER=false | sudo tee -a /etc/default/grub && sudo update-grub


printf "\n--------------------------Theme_Ext---shell-theme & Extensions-------------------------\n"
# unzip ./configs/extensions_bak.zip -d /home/hritwik/.local/share/gnome-shell/



################################# Needs testing #################################
#################################################################################



printf "\n---------------------------------------------------------------------------\n"
printf "\n\n\n-------------------------Applying Tweaks-------------------------\n\n\n"
printf "\n---------------------------------------------------------------------------\n"

printf "\n---------------------------------------------------------------------------\n"
printf "\n--------------------------Restore---dconf-settings-------------------------\n"
printf "\n---------------------------------------------------------------------------\n"

dconf dump /org/gnome/ > /home/hritwik/org.gnome_Bak
dconf dump /org/nemo/ > /home/hritwik/org.nemo_Bak
dconf dump /com/github/wwmm/easyeffects/ > /home/hritwik/com.github.wwmm.easyeffects_Bak

dconf load /org/gnome/ < ./configs/gsettings/org.gnome
dconf load /org/nemo/ < ./configs/gsettings/org.nemo
dconf load /com/github/wwmm/easyeffects/ < ./configs/gsettings/com.github.wwmm.easyeffects


printf "\n---------------------------------------------------------------------------\n"
printf "\n--------------------------Tweaks---Some common Settings-------------------------\n"
printf "\n---------------------------------------------------------------------------\n"
timedatectl set-local-rtc 1
sudo systemctl enable --now fstrim.timer
sudo systemctl enable --now systemd-oomd.service

sudo pacman -S --noconfirm --needed power-profiles-daemon
sudo systemctl enable --now power-profiles-daemon

printf "\n---------------------------------------------------------------------------\n"
printf "\n--------------------------Tweaks---extra-app-presets-in-menu-------------------------\n"
printf "\n---------------------------------------------------------------------------\n"
echo "[Desktop Entry] Hidden=true" > /tmp/1
find /usr -name "*lsp_plug*desktop" 2>/dev/null | cut -f 5 -d '/' | xargs -I {} cp /tmp/1 ~/.local/share/applications/{}



printf "\n---------------------------------------------------------------------------\n"
printf "\n--------------------------Theme_Ext---Grub-theme-------------------------\n"
printf "\n---------------------------------------------------------------------------\n"
rm -rf /home/hritwik/my_downloads/grub_themes
git clone --depth 1 https://github.com/vinceliuice/grub2-themes.git /home/hritwik/my_downloads/grub_themes
sudo /home/hritwik/my_downloads/grub_themes/install.sh


printf "\n---------------------------------------------------------------------------\n"
printf "\n--------------------------Theme_Ext---Theme: Yaru-Colors-------------------------\n"
printf "\n---------------------------------------------------------------------------\n"
sudo snap install yaru-colors
for i in $(snap connections | grep gtk-common-themes:gtk-3-themes | awk '{print $2}'); do sudo snap connect $i yaru-colors:gtk-3-themes; done
for i in $(snap connections | grep gtk-common-themes:gtk-2-themes | awk '{print $2}'); do sudo snap connect $i yaru-colors:gtk-2-themes; done
for i in $(snap connections | grep gtk-common-themes:icon-themes | awk '{print $2}'); do sudo snap connect $i yaru-colors:icon-themes; done


printf "\n---------------------------------------------------------------------------\n"
printf "\n\n\n-------------------------Finished Successfully-------------------------\n\n\n"
printf "\n---------------------------------------------------------------------------\n"


printf "\n---------------------------------------------------------------------------\n"
printf "\n\n\n-------------------------Final changes-------------------------\n\n\n"
printf "\n--------------------------Final-add-user-to-input-group-------------------------\n"
printf "\n---------------------------------------------------------------------------\n"
sudo usermod -aG input $(whoami)
newgrp input
sudo usermod -aG docker $(whoami)
newgrp docker
sudo usermod -aG libvirt $(whoami)
newgrp libvirt
sudo usermod -aG kvm $(whoami)
newgrp kvm
sudo usermod -aG adbusers $(whoami)
newgrp adbusers
sudo usermod -aG wireshark $(whoami)
newgrp wireshark

printf "\n---------------------------------------------------------------------------\n"
printf "\n---------------------------------------------------------------------------\n"
printf "\n---------------------------------------------------------------------------\n"
