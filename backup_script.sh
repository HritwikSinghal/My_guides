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


echo "------------------------------------------------------"
echo "Backuping up Configs"
mkdir -p /home/hritwik/Backups

# PulseEffects
sudo cp /home/hritwik/.config/PulseEffects/output/PulseEffects_MyPreset.json /home/hritwik/Backups/
# fusuma
sudo cp /home/hritwik/.config/fusuma/config.yml /home/hritwik/Backups/config.yml
# conky
cp -r /home/hritwik/.conky /home/hritwik/Backups/.conky
# firefox
cd /home/hritwik/
zip -r /home/hritwik/Backups/firefox_bak.zip ./.mozilla
# thunderbird
cd /home/hritwik/
zip -r /home/hritwik/Backups/thunderbird_bak.zip ./.thunderbird
# Atom
cd /home/hritwik/
zip -r /home/hritwik/Backups/atom_bak.zip ./.atom
# sublime
cd /home/hritwik/.config/sublime-text-3/Packages
zip -r /home/hritwik/Backups/sublime_bak.zip ./User
# VLC
cd /home/hritwik/.config/
zip -r /home/hritwik/Backups/vlc_bak.zip ./vlc


echo "------------------------------------------------------"
echo "Backuping up Extensions"
cd /home/hritwik/.local/share/gnome-shell
zip -r /home/hritwik/Backups/extensions_bak.zip ./extensions


echo "------------------------------------------------------"
echo "Backuping up gsettings"
mkdir -p /home/hritwik/Backups/gsettings
dconf dump /org/gnome/ > /home/hritwik/Backups/gsettings/org.gnome
dconf dump /org/nemo/ > /home/hritwik/Backups/gsettings/org.nemo
dconf dump /com/github/wwmm/pulseeffects/ > /home/hritwik/Backups/gsettings/com.github.wwmm.pulseeffects

echo "------------------------------------------------------"
echo "Backuping up startup apps"
cp -r /home/hritwik/.config/autostart/ /home/hritwik/Backups/autostart





echo "Finished Successfully..."
echo "Dont forget to Copy '~/Backups/' to your directory "
