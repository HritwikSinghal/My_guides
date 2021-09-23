#!/bin/bash

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


printf "\n--------------------------Tweaks---conky-------------------------\n"
rm -rf /home/hritwik/.conky/
cp -r ./configs/.conky/ /home/hritwik/

printf "\n--------------------------Tweaks---PulseEffects-------------------------\n"
sudo cp ./configs/PulseEffects_MyPreset.json /home/hritwik/.config/PulseEffects/output

printf "\n--------------------------Tweaks---startup-Apps-------------------------\n"
rm -rf /home/hritwik/.config/autostart/
cp -r ./configs/autostart/ /home/hritwik/.config/
sudo chmod +x /home/hritwik/.config/autostart/*


printf "\n--------------------------Tweaks---Telegram-------------------------\n"
unzip ./configs/telegram.zip -d /home/hritwik/

printf "\n--------------------------Tweaks---Signal-------------------------\n"
unzip ./configs/signal.zip -d /home/hritwik/


printf "\n--------------------------Tweaks---Atom-------------------------\n"
# rm -rf /home/hritwik/.atom
# unzip ./configs/atom_bak.zip -d /home/hritwik/
# rm -rf /home/hritwik/.atom/recovery/

printf "\n--------------------------Tweaks---Sublime-------------------------\n"
# rm -rf /home/hritwik/.config/sublime-text-3/
# mkdir -p /home/hritwik/.config/sublime-text-3/Packages/User
# unzip ./configs/sublime_bak.zip -d /home/hritwik/.config/sublime-text-3/Packages/

printf "\n--------------------------Tweaks---VLC-------------------------\n"
rm -rf /home/hritwik/.config/vlc
unzip ./configs/vlc_bak.zip -d /home/hritwik/.config/

printf "\n--------------------------Tweaks---jetbrains-------------------------\n"
# rm -rf /home/hritwik/PycharmProjects
# rm -rf /home/hritwik/CLionProjects
# unzip ./configs/clion_bak.zip -d /home/hritwik/
# unzip ./configs/pycharm_bak.zip -d /home/hritwik/

printf "\n--------------------------Tweaks---ssh-------------------------\n"
rm -rf /home/hritwik/.ssh
unzip ./configs/git_ssh.zip -d /home/hritwik/


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


printf "\n--------------------------Theme_Ext---fonts-------------------------\n"
# rm -rf /home/hritwik/my_downloads/pop_fonts
# git clone --depth 1 https://github.com/pop-os/fonts.git /home/hritwik/my_downloads/pop_fonts
# cd /home/hritwik/my_downloads/pop_fonts/
# sudo make install

# gsettings set org.gnome.desktop.interface font-name 'Fira Sans Semi-Light 11'
# gsettings set org.gnome.desktop.interface document-font-name 'Roboto Slab 11'
# gsettings set org.gnome.desktop.interface monospace-font-name 'Fira Mono 13'
# gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Fira Sans Semi-Bold 11'



printf "\n--------------------------Theme_Ext---shell-theme & Extensions-------------------------\n"

rm -rf /home/hritwik/my_downloads/materia-theme
git clone --depth 1 https://github.com/nana-4/materia-theme.git /home/hritwik/my_downloads/materia-theme
sudo /home/hritwik/my_downloads/materia-theme/install.sh
gsettings set org.gnome.shell.extensions.user-theme name 'Materia-dark'


printf "\n--------------------------Theme_Ext---Theme: Yaru-Colors-------------------------\n"
rm -rf /home/hritwik/my_downloads/Yaru-Colors
git clone --depth 1 https://github.com/Jannomag/Yaru-Colors.git /home/hritwik/my_downloads/Yaru-Colors
/home/hritwik/my_downloads/Yaru-Colors/install.sh
