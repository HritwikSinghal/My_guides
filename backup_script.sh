#!/bin/sh
set -e

# todo: backup and restore of whole OS

# Backup configs
# PulseEffects
# conky
# fusuma

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
echo "Backuping up Extensions"
mkdir ~/Backups
cd ~/.local/share/gnome-shell
zip -r ~/Backups/extensions_bak.zip ./extensions
