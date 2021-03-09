# These are all the steps i do after installing Ubuntu to make Ubuntu my type.

Feel free to copy anything from here and use it.


# **Table of Contents**
- Most Important
- Appearance & Customization
- System
- Install Apps
    - Extra Apps
- Install Extensions
    - Extra Extensions
- Saved & Todo


--- 



## Most Important


- [x] [Install Timeshift & make backup](https://itsfoss.com/backup-restore-linux-timeshift/)


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
	- [For calender & task](https://fruux.com/sync/)

- [x] Firefox Setup (and desktop icons)
	- [x] [For Latest Nightly](https://launchpad.net/~ubuntu-mozilla-daily/+archive/ubuntu/ppa)
    - [x] Put "MOZ_ENABLE_WAYLAND=1" in "/etc/environment"


- [x] [qBittorrent](https://www.linuxbabe.com/ubuntu/install-qbittorrent-ubuntu-18-04-desktop-server)
    - [x] For stable:
        - sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
    - For Unstable
        - sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-unstable
    - add it to startup apps

- [x] gdebi (for installing .deb files)

- [x] gnome-tweak-tool

- [x] Vnstat
	- [Link1](https://www.cyberciti.biz/faq/ubuntu-install-vnstat-console-network-traffic-monitor/)
    -  [Link2](https://www.techrepublic.com/article/how-to-monitor-network-traffic-with-linux-and-vnstat/)
	- [Link3, for GUI via apache](https://www.cloudsigma.com/how-to-use-vnstat-and-iftop-to-monitor-data-consumption-within-a-vm/)

- [x] [BingWall](https://www.omgubuntu.co.uk/2020/02/bing-wallpaper-app-ubuntu-snap)
    - sudo snap install bing-wall

- [x] Wonderwall
    - sudo snap install wonderwall

- [x] [Lollypop music player](https://launchpad.net/~gnumdk/+archive/ubuntu/lollypop)

- [x] [GreenTunnel](https://www.linuxuprising.com/2020/07/unblock-websites-restricted-by-isps-in.html)
	- npm i -g green-tunnel


- [x] [Normal SS in Linux](https://itsfoss.com/take-screenshot-linux/)

OR

- [Ksnip](https://www.linuxuprising.com/2020/12/cross-platform-screenshot-tool-ksnip.html)

OR

- [x] [Flameshot](https://itsfoss.com/flameshot/) (SS tool)
    - install latest from [here](https://github.com/flameshot-org/flameshot/releases)


- [x] [Conky](http://ubuntuhandbook.org/index.php/2020/07/install-conky-manager-ubuntu-20-04-lts/)
    - [x] for backup: just copy .conky/ to home

    - [Conky config variables](http://conky.sourceforge.net/variables.html)
        - OR 'man conky'

	- [Titlebar Fix](https://www.youtube.com/watch?v=miLrmIGPCJs)

	- [Run Mltiple Conky scrips](https://www.omgubuntu.co.uk/2016/02/run-multiple-conky-scripts-same-session)
	- [Conky Setup by Chrits Titus Tech Youtube](https://www.youtube.com/watch?v=QB8cjKpdVQY)

	- [Conky Widgets Config Link 1](https://linuxconfig.org/ubuntu-20-04-system-monitoring-with-conky-widgets)
	- [Conky Widgets Config Link 2](http://ubuntuhandbook.org/index.php/2020/07/install-conky-manager-ubuntu-20-04-lts/)

- [x] Telegram
    - flatpak install flathub org.telegram.desktop -y
    - sudo snap install telegram-desktop
- [x] [Whatsapp desktop](https://itsfoss.com/whatsapp-linux-desktop/)
    - flatpak install io.bit3.WhatsAppQT -y
    - sudo snap install whatsdesk

- [x] [Wireshark](https://itsfoss.com/install-wireshark-ubuntu/)

- [x] VLC
    - [x] change to X11 Video Decoder in settings

- [x] Clion
    - flatpak install flathub com.jetbrains.CLion -y
    - sudo snap install clion --classic
- [x] Pycharm
    - flatpak install flathub com.jetbrains.PyCharm-Community -y
    - sudo snap install pycharm-community --classic

- [x] [PulseEffects](http://ubuntuhandbook.org/index.php/2019/06/install-audio-effects-pulseeffects-ubuntu-18-04-higher/)
	- [x] configs are stored in "~/.config/PulseEffects/output")
    - Do "Start Service at Login" in PE Settings
    - [Lots of LSP icons in apps due to pulseeffects in Gnome 3.38](https://askubuntu.com/questions/1286239/show-all-apps-menu-flooded-with-lsp-modules-after-upgrade-to-20-10)

        - ```echo "[Desktop Entry] Hidden=true" > /tmp/1```
        - ```find /usr -name "*lsp_plug*desktop" 2>/dev/null | cut -f 5 -d '/' | xargs -I {} cp /tmp/1 ~/.local/share/applications/{}```


- [x] [Uget (Prefer XDM)](https://itsfoss.com/install-latest-uget-ubuntu-linux-mint/)

- [x] [Obs-studio](https://obsproject.com/wiki/install-instructions)
    - sudo apt install obs-studio -y


- [x] [Sublime](https://linuxconfig.org/how-to-install-sublime-text-editor-on-ubuntu-20-04-focal-fossa-linux)
    - flatpak install flathub com.sublimetext.three -y
    - [x] Change its theme (pref -> theme -> adaptive.XXX)


- [x] [Atom](https://flight-manual.atom.io/getting-started/sections/installing-atom/)
    - flatpak install flathub io.atom.Atom -y
    - [x] [change soft tabs to 4](https://stackoverflow.com/questions/22608160/how-to-change-indentation-mode-in-atom)
    - [x] "termination" (and disable other terminals)
    - [x] "Autosave-Onchange"

- [x] [VS codium](https://vscodium.com/)
    - [x] [Install from repo](https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo#how-to-install-for-debianubuntulinux-mint)
    - flatpak install flathub com.vscodium.codium -y

- [x] [Signal Desktop](https://signal.org/en/download)

- [x] [youtube-dl latest version](https://ytdl-org.github.io/youtube-dl/download.html)

- [x] [copyq](https://github.com/hluk/CopyQ/releases)

- [x] [Nemo](https://itsfoss.com/install-nemo-file-manager-ubuntu/)

    - [Github](https://github.com/linuxmint/nemo/releases/)

    - [x] disable "desktop icons" extension before installing nemo, add "nemo-desktop to startup"

    - [Fix for one window opening only](https://www.reddit.com/r/linuxquestions/comments/f9zfia/why_cant_i_open_multiple_instances_of_nemo_from/)
    	- 
		```sh
		cp /usr/share/applications/nemo.desktop ~/.local/share/applications/nemo.desktop
		sed -i "s/Actions=open-home;open-computer;open-trash;/Actions=new-window;open-home;open-computer;open-trash;\n\n[Desktop Action new-window]\nName=New Window\nExec=nemo\n\n/g" ~/.local/share/applications/nemo.desktop
		```
    
        "After some tinkering around, I managed to solve the issue!
        I opened nemo.desktop (location: /usr/share/applications/) in a text editor and added "new-window;" to the "Actions" line so it looked like the following:

        Actions=new-window;open-home;open-computer;open-trash;
        [Desktop Action new-window]
        Name=New Window
        Exec=nemo

        After saving the file and restarting I was able to open as many instances of Nemo as I wanted from the dash."

    - [Fix Explaination](https://forums.linuxmint.com/viewtopic.php?t=293818)

    - [clear zoom cache](https://forums.linuxmint.com/viewtopic.php?t=308395)

- [XDM](https://itsfoss.com/xtreme-download-manager-install/)
    - [Issue of xdm not picking up downloads in FF](https://github.com/subhra74/xdm/issues/235)

- [Bleachbit](https://www.bleachbit.org/download)

- [Stacer](https://itsfoss.com/optimize-ubuntu-stacer/)

### Extra Apps:

- [gnome-sushi](https://www.omgubuntu.co.uk/gnome-sushi-mac-quick-for-ubuntu) (spacebar preview for nautilus)

- [CheckInstall](https://askubuntu.com/questions/87111/if-i-build-a-package-from-source-how-can-i-uninstall-or-remove-completely)
    - sudo apt install checkinstall -y

- Kdenlive
    - sudo add-apt-repository ppa:kdenlive/kdenlive-stable -y
    - sudo apt install kdenlive -y

- [Fly-Pie](https://github.com/Schneegans/Fly-Pie)
- [ulauncher](https://ulauncher.io/#Download)

- Freetube
    - flatpak install flathub io.freetubeapp.FreeTube


## Install extensions


- [x] [Install from ZIP](https://linuxconfig.org/how-to-install-gnome-shell-extensions-from-zip-file-using-command-line-on-ubuntu-18-04-bionic-beaver-linux)

- [x] [user-themes](https://extensions.gnome.org/extension/19/user-themes/)

- [x] [Animation-Tweaks](https://github.com/Selenium-H/Animation-Tweaks)
    - [x] [Change notification Position](https://github.com/Selenium-H/Animation-Tweaks/issues/34)

            The Tween Parameters - "First Number" denotes the position of the notification banner at the start of the animation
            and Tween Parameters - "Last Number" denotes the ending position of the notification banner.

- [x] [notifications-alert](https://extensions.gnome.org/extension/258/notifications-alert-on-user-menu/)

- [x] [Transparent Notification](https://extensions.gnome.org/extension/1080/transparent-notification/)
    - set "/.local/share/gnome-shell/extensions/transparentnotification@ipaq3870/stylesheet.css" to "background-color: rgba(0,0,0,0.72);"

- [x] [cpufreq](https://github.com/konkor/cpufreq)

- [x] [Noannoyance](https://extensions.gnome.org/extension/1236/noannoyance/)

- [x] [windowoverlay-icons](https://extensions.gnome.org/extension/302/windowoverlay-icons/)

### Extra Extensions:

- [workspace-indicator](https://extensions.gnome.org/extension/21/workspace-indicator/)

- [Clipboard-indicator Gnome Extension](https://extensions.gnome.org/extension/779/clipboard-indicator/)

- [gsconnect](https://extensions.gnome.org/extension/1319/gsconnect/)

- [Bing wallpaper extension](https://extensions.gnome.org/extension/1262/bing-wallpaper-changer/)

- [Impatience](https://extensions.gnome.org/extension/277/impatience/) (speed gnome animations)
    - set it to 0.6 in its settings

- [panel osd](https://extensions.gnome.org/extension/708/panel-osd/)
    - set 98 & 92

- [cpupower](https://github.com/martin31821/cpupower)

- [always indicator](https://extensions.gnome.org/extension/258/notifications-alert-on-user-menu/)

- [New mail indicator](https://extensions.gnome.org/extension/1505/new-mail-indicator/)


- sudo apt-get install gir1.2-clutter-1.0 gir1.2-clutter-gst-3.0 gir1.2-gtkclutter-1.0
    - this is dependency of below 3

- [blur-my-shell/](https://extensions.gnome.org/extension/3193/blur-my-shell/)
    - BUGGY! use below 2 for Replacement.

- [blyr](https://extensions.gnome.org/extension/1251/blyr/), for blurring activities screen
    - [github](https://github.com/yozoon/gnome-shell-extension-blyr)

- [lock screen blur](https://extensions.gnome.org/extension/2935/control-blur-effect-on-lock-screen/)
    - [github](https://github.com/PRATAP-KUMAR/Control_Blur_Effect_On_Lock_Screen)
    - set to 0.5 and 15


## Saved & Todo


- [Add ppa from old release](https://askubuntu.com/questions/293203/how-can-i-add-a-ppa-from-a-previous-release)


- Increase Bash History
    - https://eshlox.net/2017/08/01/bash-increase-command-history-size
    - https://stackoverflow.com/questions/9457233/unlimited-bash-history
