#!/bin/sh
set -e

# todo: backup and restore of whole OS
# https://ostechnix.com/backup-and-restore-linux-desktop-system-settings-with-dconf/

# Backup configs:

# timeshift settings

# Thunderbird
# Firefox

# gnome boxes
# qBittorrent torrents for seed
# Atom pref


echo "------------------------------------------------------"
echo "Backuping up Configs"
mkdir ~/Backups

# PulseEffects
sudo cp /home/hritwik/.config/PulseEffects/output/PulseEffects_MyPreset.json ~/Backups/
# fusuma
sudo cp ~/.config/fusuma/config.yml ~/Backups/config.yml
# conky
cp -r ~/.conky ~/Backups/.conky

echo "------------------------------------------------------"
echo "Backuping up Extensions"
cd ~/.local/share/gnome-shell
zip -r ~/Backups/extensions_bak.zip ./extensions




echo "------------------------------------------------------"
echo "Backuping up gsettings"
mkdir ~/Backups/gsettings
dconf dump /org/gnome/shell/ > ~/Backups/gsettings/org.gnome.shell
dconf dump /org/nemo/ > ~/Backups/gsettings/org.nemo



echo "Finished Successfully..."
echo "Dont forget to Copy '~/Backups/' to your directory "
