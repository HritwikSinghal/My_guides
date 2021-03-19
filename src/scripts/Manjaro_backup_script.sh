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
    # "~/.config/gnome-boxes" and ".config/libvirt/"
# downloads and other folders
# bash history and bashrc


# Todo Bring uniformity, make backups from /home/hritwik

printf "\n-------------------------Backuping up Configs-------------------------\n"
mkdir -p /home/hritwik/Backups

printf "\n-------------------------PulseEffects-------------------------\n"
sudo cp /home/hritwik/.config/PulseEffects/output/PulseEffects_MyPreset.json /home/hritwik/Backups/

printf "\n-------------------------fusuma-------------------------\n"
sudo cp /home/hritwik/.config/fusuma/config.yml /home/hritwik/Backups/config.yml

printf "\n-------------------------conky-------------------------\n"
cp -r /home/hritwik/.conky /home/hritwik/Backups/.conky

printf "\n-------------------------firefox-------------------------\n"
cd /home/hritwik/
zip -r /home/hritwik/Backups/firefox_bak.zip ./.mozilla

printf "\n-------------------------thunderbird-------------------------\n"
cd /home/hritwik/
zip -r /home/hritwik/Backups/thunderbird_bak.zip ./.thunderbird

printf "\n-------------------------Atom-------------------------\n"
cd /home/hritwik/
zip -r /home/hritwik/Backups/atom_bak.zip ./.atom

printf "\n-------------------------sublime-------------------------\n"
cd /home/hritwik/.config/sublime-text-3/Packages
zip -r /home/hritwik/Backups/sublime_bak.zip ./User

printf "\n-------------------------VLC-------------------------\n"
cd /home/hritwik/.config/
zip -r /home/hritwik/Backups/vlc_bak.zip ./vlc

printf "\n-------------------------jetbrains-------------------------\n"
cd /home/hritwik/
zip -r /home/hritwik/Backups/clion_bak.zip ./CLionProjects
zip -r /home/hritwik/Backups/pycharm_bak.zip ./PycharmProjects

printf "\n-------------------------vnstat-------------------------\n"
cd /home/hritwik/
cp ./.vnstatrc /home/hritwik/Backups/

printf "\n-------------------------ssh-------------------------\n"
cd /home/hritwik/
zip -r /home/hritwik/Backups/git_ssh.zip ./.ssh

printf "\n-------------------------Qbittorrent-------------------------\n"
# https://github.com/qbittorrent/qBittorrent/wiki/Frequently-Asked-Questions#Where_does_qBittorrent_save_its_settings
cd /home/hritwik/
zip -r /home/hritwik/Backups/qbit_settings.zip ./.config/qBittorrent/
zip -r /home/hritwik/Backups/qbit_data.zip ./.local/share/qBittorrent/

printf "\n-------------------------XDM-------------------------\n"
cd /home/hritwik/
zip -r /home/hritwik/Backups/xdm.zip ./.xdman/

printf "\n-------------------------Telegram-------------------------\n"
cd /home/hritwik/
rm -rf /home/hritwik/.local/share/TelegramDesktop/tdata/user_data
zip -r /home/hritwik/Backups/telegram.zip ./.local/share/TelegramDesktop




printf "\n-------------------------Backuping up Extensions-------------------------\n"
cd /home/hritwik/.local/share/gnome-shell
zip -r /home/hritwik/Backups/extensions_bak.zip ./extensions


printf "\n-------------------------Backuping up gsettings-------------------------\n"
mkdir -p /home/hritwik/Backups/gsettings
dconf dump /org/gnome/ > /home/hritwik/Backups/gsettings/org.gnome
dconf dump /org/nemo/ > /home/hritwik/Backups/gsettings/org.nemo
dconf dump /com/github/wwmm/pulseeffects/ > /home/hritwik/Backups/gsettings/com.github.wwmm.pulseeffects


printf "\n-------------------------Backuping up startup-apps-------------------------\n"
cp -r /home/hritwik/.config/autostart/ /home/hritwik/Backups/autostart


echo "Finished Successfully..."
echo "Dont forget to Copy contents of '~/Backups/' into your 'configs' directory "
