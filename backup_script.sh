#!/bin/sh
set -e


# --------------------------------------------------------#
# !! DO NOT RUN THIS SCRIP WIT SUDO !!
# --------------------------------------------------------#


# todo: backup and restore of whole OS
# https://ostechnix.com/backup-and-restore-linux-desktop-system-settings-with-dconf/
# https://github.com/lra/mackup
# https://ostechnix.com/backup-and-restore-application-settings-on-newly-installed-linux-system/


# Backup configs:
# Clion (projects also)
# pycharm (projects also)

# timeshift settings
# gnome boxes
# qBittorrent torrents for seed
# Atom pref


echo "------------------------------------------------------"
echo "Backuping up Configs"
mkdir -p /home/$USER/Backups

# PulseEffects
sudo cp /home/$USER/.config/PulseEffects/output/PulseEffects_MyPreset.json /home/$USER/Backups/
# fusuma
sudo cp /home/$USER/.config/fusuma/config.yml /home/$USER/Backups/config.yml
# conky
cp -r /home/$USER/.conky /home/$USER/Backups/.conky
# firefox
cd /home/$USER/
zip -r /home/$USER/Backups/firefox_bak.zip ./.mozilla
# thunderbird
cd /home/$USER/
zip -r /home/$USER/Backups/thunderbird_bak.zip ./.thunderbird


echo "------------------------------------------------------"
echo "Backuping up Extensions"
cd /home/$USER/.local/share/gnome-shell
zip -r /home/$USER/Backups/extensions_bak.zip ./extensions


echo "------------------------------------------------------"
echo "Backuping up gsettings"
mkdir -p /home/$USER/Backups/gsettings
dconf dump /org/gnome/ > /home/$USER/Backups/gsettings/org.gnome
dconf dump /org/nemo/ > /home/$USER/Backups/gsettings/org.nemo
dconf dump /com/github/wwmm/pulseeffects/ > /home/$USER/Backups/gsettings/com.github.wwmm.pulseeffects

echo "------------------------------------------------------"
echo "Backuping up startup apps"
cp -r /home/hritwik/.config/autostart/ /home/$USER/Backups/autostart





echo "Finished Successfully..."
echo "Dont forget to Copy '~/Backups/' to your directory "
