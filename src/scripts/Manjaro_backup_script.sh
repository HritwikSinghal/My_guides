#!/bin/sh
set -e

#
# printf "\n-------------------------easyeffects-------------------------\n"
# cd ~
# zip -r ~/Backups/easyeffects.zip ~/.config/easyeffects
#
# printf "\n-------------------------fusuma-------------------------\n"
# cd ~
# sudo cp ~/.config/fusuma/config.yml ~/Backups/config.yml

# printf "\n-------------------------conky-------------------------\n"
# cd ~
# cp -r ~/.conky ~/Backups/.conky

# printf "\n-------------------------Atom-------------------------\n"
# cd ~
# zip -r ~/Backups/atom_bak.zip ./.atom
#
# printf "\n-------------------------sublime-------------------------\n"
# cd ~/.config/sublime-text-3/Packages
# zip -r ~/Backups/sublime_bak.zip ./User
#
# printf "\n-------------------------VLC-------------------------\n"
# cd ~/.config/
# zip -r ~/Backups/vlc_bak.zip ./vlc

# printf "\n-------------------------jetbrains-------------------------\n"
# cd ~
# zip -r ~/Backups/clion_bak.zip ./CLionProjects
# zip -r ~/Backups/pycharm_bak.zip ./PycharmProjects
#
# printf "\n-------------------------vnstat-------------------------\n"
# cd ~
# cp ./.vnstatrc ~/Backups/

# printf "\n-------------------------Qbittorrent-------------------------\n"
# # https://github.com/qbittorrent/qBittorrent/wiki/Frequently-Asked-Questions#Where_does_qBittorrent_save_its_settings
# cd ~
# zip -r ~/Backups/qbit_settings.zip ./.config/qBittorrent/
# zip -r ~/Backups/qbit_data.zip ./.local/share/qBittorrent/

# printf "\n-------------------------XDM-------------------------\n"
# cd ~
# zip -r ~/Backups/xdm.zip ./.xdman/

# printf "\n-------------------------Telegram-------------------------\n"
# cd ~
# rm -rf ~/.local/share/TelegramDesktop/tdata/user_data
# zip -r ~/Backups/telegram.zip ./.local/share/TelegramDesktop
#
# printf "\n-------------------------Signal-------------------------\n"
# cd ~
# zip -r ~/Backups/signal.zip ./.config/Signal
#
#
# printf "\n-------------------------Backuping up Extensions-------------------------\n"
# cd ~/.local/share/gnome-shell
# zip -r ~/Backups/extensions_bak.zip ./extensions
#
# printf "\n-------------------------Backuping up startup-apps-------------------------\n"
# cp -r ~/.config/autostart/ ~/Backups/autostart







printf "\n-------------------------Backuping up Configs-------------------------\n"
cd ~
mkdir -p ~/Backups

tar -cvf ~/Backups/Documents.tar Documents/
tar -cvf ~/Backups/Downloads.tar Downloads/
tar -cvf ~/Backups/Music.tar Music/
tar -cvf ~/Backups/Pictures.tar Pictures/
tar -cvf ~/Backups/Videos.tar Videos/

tar -cvf ~/Backups/projects.tar Projects/
tar -cvf ~/Backups/my_guides.tar Projects/My_guides/

tar -cvf ~/Backups/brave.tar .config/BraveSoftware/
tar -cvf ~/Backups/jetbrains_config .config/JetBrains/
tar -cvf ~/Backups/jetbrains_data.tar .local/share/JetBrains/
tar -cvf ~/Backups/web_apps.tar .local/share/ice/profiles/

tar -cvf ~/Backups/mozilla.tar .thunderbird .mozilla
tar -cvf ~/Backups/ssh.tar .ssh
tar -cvf ~/Backups/vscode .vscode-oss/


# copy them to other SSD automatically
# make extract srcipt for these

printf "\n-------------------------Backuping up gsettings-------------------------\n"
mkdir -p ~/Backups/gsettings
dconf dump /org/gnome/ > ~/Backups/gsettings/org.gnome
dconf dump /org/nemo/ > ~/Backups/gsettings/org.nemo
dconf dump /com/github/wwmm/easyeffects/ > ~/Backups/gsettings/com.github.wwmm.easyeffects

echo "Finished Successfully..."
echo "Dont forget to Copy contents of '~/Backups/' into your 'configs' directory "


# Extras to manually backup
# /etc/environment, /etc/pacman.conf , /etc/paru.conf, yay conf
#     - Backup Projects folder
#     - downloads and other folders
#     - /etc/
#     - .vscode-oss/
#     - .config/JetBrains/
#     - .config/BraveSoftware
# Snap apps data (or dont use them)
# flatpak apps data in ~/.var/
# Backup gnome-boxes images: /home/hritwik/.local/share/gnome-boxes/images


yadm add \
    ~/Templates \
    ~/.android \
    ~/.atom \
    ~/.gnupg \
    ~/.kodi \
    ~/.pki \
    ~/.pvpn-cli \
    ~/.SpaceVim.d \
    ~/.steam \
    ~/.vnc \
    ~/.vscode-oss \
    ~/.xdman \

yadm add \
    ~/.bash* \
    ~/.dir_colors \
    ~/.gitconfig \
    ~/.gitignore \
    ~/.gtkrc-2.0 \
    ~/.nanorc \
    ~/.p10k.zsh \
    ~/.profile \
    ~/.vnstatrc \
    ~/.zhistory \
    ~/.zsh* \



yadm add \
    ~/.config/Atom \
    ~/.config/autostart \
    ~/.config/bleachbit \
    ~/.config/bpytop \
    ~/.config/conky \
    ~/.config/copyq \
    ~/.config/easyeffects \
    ~/.config/evince \
    ~/.config/filezilla \
    ~/.config/fish \
    ~/.config/fusuma \
    ~/.config/gedit \
    ~/.config/ghostwriter \
    ~/.config/gnome-boxes \
    ~/.config/gnome-shell-extension-animation-tweaks@Selenium-H \
    ~/.config/gnote \
    ~/.config/gtk-3.0 \
    ~/.config/gtk-4.0 \
    ~/.config/htop \
    ~/.config/kate* \
    ~/.config/Kid3 \
    ~/.config/Kvantum \
    ~/.config/libreoffice \
    ~/.config/libvirt \
    ~/.config/manjaro \
    ~/.config/marktext \
    ~/.config/micro \
    ~/.config/nemo \
    ~/.config/neofetch \
    ~/.config/obs-studio \
    ~/.config/pamac \
    ~/.config/Pinta \
    ~/.config/pop-shell \
    ~/.config/qBittorrent \
    ~/.config/ranger \
    ~/.config/rclone \
    ~/.config/Signal \
    ~/.config/stacer \
    ~/.config/sublime-text-3 \
    ~/.config/Thunar \
    ~/.config/transmission \
    ~/.config/vlc \
    ~/.config/VSCodium \
    ~/.config/warpinator \
    ~/.config/wireshark \
    ~/.config/yay \
    ~/.config/appimagelauncher.cfg \
    ~/.config/katerc \
    ~/.config/katevirc \
    ~/.config/kid3rc \
    ~/.config/mimeapps.list \
    ~/.config/topgrade.toml


yadm add \
    ~/.local/share/copyq \
    ~/.local/share/evolution \
    ~/.local/share/fish \
    ~/.local/share/fonts \
    ~/.local/share/gedit \
    ~/.local/share/ghostwriter \
    ~/.local/share/gnome-background-properties \
    ~/.local/share/gnome-settings-daemon \
    ~/.local/share/gnome-shell \
    ~/.local/share/gnote \
    ~/.local/share/GPaste \
    ~/.local/share/keyrings \
    ~/.local/share/lutris \
    ~/.local/share/nautilus \
    ~/.local/share/nemo \
    ~/.local/share/nvim \
    ~/.local/share/pki \
    ~/.local/share/qBittorrent \
    ~/.local/share/ranger \
    ~/.local/share/TelegramDesktop \
    ~/.local/share/vlc

yadm add --update
yadm commit -m 'updates'
yadm push


# todo: backup and restore of whole OS
# https://ostechnix.com/backup-and-restore-linux-desktop-system-settings-with-dconf/
# https://github.com/lra/mackup
# https://ostechnix.com/backup-and-restore-application-settings-on-newly-installed-linux-system/

# todo: create python script that:
#		- checks if folder to add exists, if not then create it
# 		- run command yadm add '''
# 		- if i want to remove a folder from tracking, add that folder to gitignore and (find soln online)
#            - https://stackoverflow.com/questions/1274057/how-can-i-make-git-forget-about-a-file-that-was-tracked-but-is-now-in-gitign
#            - yadm rm -rf --cached .local/share/gnome-shell/application_state
# a blacklist for folders and list new folders which are added (by apps newly installed) so that i can choose to add them only
# if the path (like .kodi) does not exist, git gives error, so make sure that that path not committed
# add manual backup zip support where you just type path to folder and it will auto zip it and auto extract it

# i can write all apps to install in yaml file and that program will also create a bash script to install them for various distros.
# i should also add all folders to backup in yml file and it should add them to yadm, and create zip of them to backup.
# it should also be able to restore those folder by unzipping then or pulling from yadm.

# yadm rm -rf --cached .
# yadm stash
# yadm stash drop
