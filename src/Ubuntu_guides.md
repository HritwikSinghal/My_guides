# These are all the steps i do after installing Ubuntu to make Ubuntu my type.

Feel free to copy anything from here and use it.


# **Table of Contents**
- Appearance & Customization
- System
- Install Apps
    - Extra Apps
- Install Extensions
    - Extra Extensions
- Saved & Todo


--- 



## Appearance & Customization


- [x] [GTK3 Dark mode](https://askubuntu.com/questions/806200/how-can-you-enable-gtk3-themes-dark-theme-mode-when-using-unity-7) (See maual method, check if this is valid now or not)

- [x] [Full Dark theme in Qt5 apps](https://github.com/tsujan/Kvantum/blob/master/Kvantum/INSTALL.md#debian-based-distributions)

	- Dont compile it
    - Another [Guide](https://www.linuxuprising.com/2018/05/use-custom-themes-for-qt-applications.html)


## System


- [Fix secondary monitor display](https://wayneoutthere.com/2018/12/29/how-to-fix-wrong-monitor-display-ubuntu/)
    - rm .config/monitors.xml

- Switch to wayland
    - [x] [This link](https://bugs.launchpad.net/ubuntu/+source/gnome-shell-extension-ubuntu-dock/+bug/1874578) is for dock bug in 20.04 LTS.

- [set su passwd](https://askubuntu.com/questions/155278/how-do-i-set-the-root-password-so-i-can-use-su-instead-of-sudo)
    - sudo passwd

- [Remove sudo passwd](https://askubuntu.com/questions/147241/execute-sudo-without-password)

- [x] [Enable flatpack support](https://flatpak.org/setup/Ubuntu/)

- [x] [Run all Apps via descrete GPU](https://askubuntu.com/questions/791022/how-to-configure-an-application-to-always-run-with-dri-prime-1-set-is-there-an)
    - [x] Put "DRI_PRIME=1" in "/etc/environment"

- [x] Increase terminal size to 100x30 and change its color and shortcuts

- [x] Change keyboard layout to DVORAK

- [x] Add shortcuts
	- [x] Calc (F7)
	- [x] System monitor (ctrl+shift+Esc 'gnome-system-monitor')

- [x] [Increment volume](https://www.reddit.com/r/gnome/comments/f4owxw/gnome_volume_step_adjustment/) by 3 onstead of default 6
	- gsettings set org.gnome.settings-daemon.plugins.media-keys volume-step 3

- [x] [ExFat in Linux](https://itsfoss.com/mount-exfat/)
    - sudo apt install exfat-fuse exfat-utils
- [x] [NTFS in Linux](https://www.cyberciti.biz/faq/debian-ubuntu-linux-auto-mounting-windows-ntfs-file-system/)
    - sudo apt install ntfs-3g

- [x] [Remove python2](https://stackoverflow.com/questions/44602191/how-to-completely-uninstall-python-2-7-13-on-ubuntu-16-04/60590067#60590067)

- [x] [increase Swap file by 6144 MB](https://askubuntu.com/questions/927854/how-do-i-increase-the-size-of-swapfile-without-removing-it-in-the-terminal)
    - https://linuxhint.com/change_swap_size_ubuntu/

- [x] Change compression level
        gsettings set org.gnome.FileRoller.General compression-level "very-fast"
        gsettings set org.gnome.FileRoller.General compression-level "fast"
        gsettings set org.gnome.FileRoller.General compression-level "normal"
        gsettings set org.gnome.FileRoller.General compression-level "maximum"




## Install Apps

- [x] Setup thunderbird (and backup it like FF)
    - [x] [for getting latest Thunderbird](https://launchpad.net/~ubuntu-mozilla-security/+archive/ubuntu/ppa/);

- [x] Firefox Setup (and desktop icons)
	- [x] [For Latest Nightly](https://launchpad.net/~ubuntu-mozilla-daily/+archive/ubuntu/ppa)


- [x] [qBittorrent](https://www.linuxbabe.com/ubuntu/install-qbittorrent-ubuntu-18-04-desktop-server)
    - [x] For stable:
        - sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
    - For Unstable
        - sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-unstable
    - add it to startup apps


- [CheckInstall](https://askubuntu.com/questions/87111/if-i-build-a-package-from-source-how-can-i-uninstall-or-remove-completely)
    - sudo apt install checkinstall -y

- Kdenlive
    - sudo add-apt-repository ppa:kdenlive/kdenlive-stable -y
    - sudo apt install kdenlive -y


## Saved & Todo


- [Add ppa from old release](https://askubuntu.com/questions/293203/how-can-i-add-a-ppa-from-a-previous-release)


- Increase Bash History
    - https://eshlox.net/2017/08/01/bash-increase-command-history-size
    - https://stackoverflow.com/questions/9457233/unlimited-bash-history
