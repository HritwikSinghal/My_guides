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








# todo: backup and restore of whole OS
# https://ostechnix.com/backup-and-restore-linux-desktop-system-settings-with-dconf/
# https://github.com/lra/mackup
# https://ostechnix.com/backup-and-restore-application-settings-on-newly-installed-linux-system/

# Snap apps data
# Backup gnome-boxes images: /home/hritwik/.local/share/gnome-boxes/images
#    ~/.config/BraveSoftware
# web apps data: ~/.local/share/ice/profiles/
# JetBrains apps: /home/hritwik/.local/share/Jetbrains
# /etc/environment, /etc/pacman.conf , /etc/paru.conf, yay conf


printf "\n-------------------------Backuping up Configs-------------------------\n"
cd ~
mkdir -p ~/Backups


printf "\n-------------------------mozilla-------------------------\n"
cd ~
zip -r ~/Backups/mozilla.zip ./.thunderbird ./.mozilla

printf "\n-------------------------ssh-------------------------\n"
cd ~
zip -r ~/Backups/ssh.zip ./.ssh

printf "\n-------------------------Backuping up gsettings-------------------------\n"
mkdir -p ~/Backups/gsettings
dconf dump /org/gnome/ > ~/Backups/gsettings/org.gnome
dconf dump /org/nemo/ > ~/Backups/gsettings/org.nemo
dconf dump /com/github/wwmm/easyeffects/ > ~/Backups/gsettings/com.github.wwmm.easyeffects


echo "Finished Successfully..."
echo "Dont forget to Copy contents of '~/Backups/' into your 'configs' directory "



yadm add \
    ~/.gitignore \
    \
    ~/Templates \
    ~/.android \
    ~/.atom \
    ~/.gnupg \
    ~/.java \
    ~/.kodi \
    ~/.pki \
    ~/.pvpn-cli \
    ~/.SpaceVim.d \
    ~/.ssh \
    ~/.steam \
    ~/.var \
    ~/.vnc \
    ~/.vscode-oss \
    ~/.xdman \
    ~/.bash* \
    ~/.dir_colors \
    ~/.gitconfig \
    ~/.gtkrc-2.0 \
    ~/.p10k.zsh \
    ~/.profile \
    ~/.vnstatrc \
    ~/.zhistory \
    ~/.zsh* \
    \
    \
    ~/.config/Atom \
    ~/.config/autostart \
    ~/.config/bleachbit \
    ~/.config/"Code - OSS" \
    ~/.config/conky \
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
    ~/.config/JetBrains \
    ~/.config/Kid3 \
    ~/.config/Kvantum \
    ~/.config/libreoffice \
    ~/.config/libvirt \
    ~/.config/manjaro \
    ~/.config/micro \
    ~/.config/nemo \
    ~/.config/neofetch \
    ~/.config/obs-studio \
    ~/.config/pamac \
    ~/.config/pop-shell \
    ~/.config/qBittorrent \
    ~/.config/Signal \
    ~/.config/stacer \
    ~/.config/sublime-text-3 \
    ~/.config/systemd \
    ~/.config/Thunar \
    ~/.config/transmission \
    ~/.config/vlc \
    ~/.config/VSCodium \
    ~/.config/warpinator \
    ~/.config/wireshark \
    ~/.config/yay \
    ~/.config/appimagelauncher.cfg \
    ~/.config/kate* \
    ~/.config/kid3rc \
    ~/.config/topgrade.toml


yadm add \
    ~/.local/share/copyq \
    ~/.local/share/desktop-directories \
    ~/.local/share/evolution \
    ~/.local/share/firefoxprofileswitcher \
    ~/.local/share/fish \
    ~/.local/share/fonts \
    ~/.local/share/gedit \
    ~/.local/share/ghostwriter \
    ~/.local/share/gnome-background-properties \
    ~/.local/share/gnome-settings-daemon \
    ~/.local/share/gnome-shell \
    ~/.local/share/gnote \
    ~/.local/share/gstreamer-1.0 \
    ~/.local/share/JetBrains \
    ~/.local/share/keyrings \
    ~/.local/share/lutris \
    ~/.local/share/man \
    ~/.local/share/mime \
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



# Extras
#     ~/.local/share/lollypop \


# todo: create python script that:
#		- checks if folder to add exists, if not then create it
# 		- run command yadm add '''
# 		- if i want to remove a folder from tracking, add that folder to gitignore and (find soln online)
#            - https://stackoverflow.com/questions/1274057/how-can-i-make-git-forget-about-a-file-that-was-tracked-but-is-now-in-gitign
#            - yadm rm -rf --cached .local/share/gnome-shell/application_state
# a blacklist for folders and list new folders which are added (by apps newly installed) so that i can choose to add them only


# yadm rm -rf --cached .
# yadm stash
# yadm stash drop

