#!/bin/zsh





# printf "\n---------------------------------------------------------------------------\n"
# printf "\n\n\n-------------------------Insatlling Apps-------------------------\n\n\n"

# printf "\n-------------------------Install--Sublime-------------------------\n"
# curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
# echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
# sudo pacman -Syu sublime-text

# printf "\n-------------------------Install--Nemo-------------------------\n"
# sudo pacman -S nemo
# xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
# # gsettings set org.gnome.desktop.background show-desktop-icons false
# # gsettings set org.nemo.desktop show-desktop-icons true
# # add nemo to startup apps




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
