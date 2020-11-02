#!/bin/sh
set -e

# todo: backup and restore of whole OS

# Backup configs:
# conky

# gsettings
# timeshift settings
# system Appearance in tweak-tool

# Thunderbird
# Firefox

# gnome boxes
# qBittorrent torrents for seed
# Atom pref
# Nemo pref


# for nemo and extensions and system backup
# https://ostechnix.com/backup-and-restore-linux-desktop-system-settings-with-dconf/


echo "------------------------------------------------------"
echo "Backuping up Configs"
mkdir ~/Backups

# PulseEffects
sudo cp /home/hritwik/.config/PulseEffects/output/PulseEffects_MyPreset.json ~/Backups/
# fusuma
sudo cp ~/.config/fusuma/config.yml ~/Backups/config.yml


echo "------------------------------------------------------"
echo "Backuping up Extensions"
cd ~/.local/share/gnome-shell
zip -r ~/Backups/extensions_bak.zip ./extensions










#
