#!/bin/sh
set -e

# todo: backup and restore of whole OS
# https://ostechnix.com/backup-and-restore-linux-desktop-system-settings-with-dconf/
# https://github.com/lra/mackup
# https://ostechnix.com/backup-and-restore-application-settings-on-newly-installed-linux-system/


# Backup configs:

# timeshift settings
# gnome boxes & virt-manager
    # https://www.debugpoint.com/2020/06/move-virtual-machine-image-another-host/
    # https://gitlab.gnome.org/GNOME/gnome-boxes/-/issues/610 (for directories)
# qBittorrent torrents for seed
# clion and PyCharm settings
# downloads and other folders
# bash history and bashrc


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
# jetbrains
cd /home/hritwik/
zip -r /home/hritwik/Backups/clion_bak.zip ./CLionProjects
zip -r /home/hritwik/Backups/pycharm_bak.zip ./PycharmProjects
# vnstat
cd /home/hritwik/
cp ./.vnstatrc /home/hritwik/Backups/
# ssh keys
cd /home/hritwik/
zip -r /home/hritwik/Backups/git_ssh.zip ./.ssh


echo "Done"
echo ""
echo "------------------------------------------------------"
echo "Backuping up Extensions"
cd /home/hritwik/.local/share/gnome-shell
zip -r /home/hritwik/Backups/extensions_bak.zip ./extensions
echo "Done"
echo ""

echo "------------------------------------------------------"
echo "Backuping up gsettings"
mkdir -p /home/hritwik/Backups/gsettings
dconf dump /org/gnome/ > /home/hritwik/Backups/gsettings/org.gnome
dconf dump /org/nemo/ > /home/hritwik/Backups/gsettings/org.nemo
dconf dump /com/github/wwmm/pulseeffects/ > /home/hritwik/Backups/gsettings/com.github.wwmm.pulseeffects

echo "Done"
echo ""
echo "------------------------------------------------------"
echo "Backuping up startup apps"
cp -r /home/hritwik/.config/autostart/ /home/hritwik/Backups/autostart


echo ""
echo "Done"
echo "Finished Successfully..."
echo "Dont forget to Copy contents of '~/Backups/' into your 'configs' directory "
