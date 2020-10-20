# These are all the steps i do after installing Ubuntu to make Ubuntu my type.

Feel free to copy anything from here and use it.


## Most Important


* Install time shift first to make backup (https://itsfoss.com/backup-restore-linux-timeshift/)
* https://askubuntu.com/questions/87111/if-i-build-a-package-from-source-how-can-i-uninstall-or-remove-completely
* https://askubuntu.com/questions/866161/setting-path-variable-in-etc-environment-vs-profile
* https://wiki.archlinux.org/index.php/Packaging_Brother_printer_drivers
* https://askubuntu.com/questions/383515/whats-the-difference-between-lpr-and-cupswrapper-drivers-how-to-install-printe


* Put the below lines in "/etc/environment"
    * DRI_PRIME=1
    * MOZ_ENABLE_WAYLAND=1


* This is for displaying fps counter on wine games.
    * DRI_PRIME=1 GALLIUM_HUD=fps wine game.exe


* DNS
    * https://askubuntu.com/questions/973017/wrong-nameserver-set-by-resolvconf-and-networkmanager
    * use 'nmcli' command for dns server ip addr
        - nmcli dev show | grep DNS
        - https://www.liquidweb.com/kb/how-to-install-and-configure-nmcli/
    * OR 'nslookup website_name'
    * OR "cat /etc/resolv.conf"
    * OR just check in wifi settings


## Appearance & Customization


- https://askubuntu.com/questions/806200/how-can-you-enable-gtk3-themes-dark-theme-mode-when-using-unity-7 (see maual method)


- change system theme to dark
    - https://itsfoss.com/dark-mode-ubuntu/


- and enable complete dark theme in qt5 apps
	https://www.linuxuprising.com/2018/05/use-custom-themes-for-qt-applications.html
	Dont compile it, install like from here (https://github.com/tsujan/Kvantum/blob/master/Kvantum/INSTALL.md)


- if using secondary monitor, make sure both have 1920*1080 and 60Hz


- Switch to wayland on Ubuntu
	https://bugs.launchpad.net/ubuntu/+source/gnome-shell-extension-ubuntu-dock/+bug/1874578


- Gnome-tweaks settings
    - change to right click and mouse sensitivity in settings
    - change trackpad behaviour in gnome tweak tool to "fingers"
    - change settings in gnome tweak tool
    - enable middle click to minimize on title bar (in gnome tweak tool)


- Theme:
    - for grub
        - https://github.com/vinceliuice/grub2-themes

    - https://github.com/vinceliuice/Orchis-theme (for apps)
        - (also take close buttons from here)

    - https://github.com/nana-4/materia-theme (for shell)
        - also install its snap version
            - https://snapcraft.io/orchis-themes

	OR

	- https://github.com/pop-os/gtk-theme (compile it)
        - DO NOT INSTALL 'pop-theme' or its ppa, it will mess up ubuntu

	OR

	- change yaru theme color (chose Yaru Blue)
		- https://github.com/Jannomag/Yaru-Colors


- Icons:
	- pop icons
		https://github.com/pop-os/icon-theme

	OR
	- papirus icons


- Fonts: (Install font manager first ("sudo apt install font-manager"))
    - for Pop! like look
            Interface: Fira Sans Book 10
            Documents: Roboto Slab Regular 11
            Monospace: Fira Mono Regular 11
            Window Titles: Fira Sans SemiBold 10
            scaling factor: 0.85


- [Pop! Os Wall](https://github.com/pop-os/wallpapers)

- [Pop! Os curser](https://github.com/pop-os/icon-theme) (Same as curser)

- For macOS like look ([see video](https://www.youtube.com/watch?v=IzPxJK4drcc))

	- https://itsfoss.com/make-ubuntu-look-like-macos/
	- https://www.linuxuprising.com/2020/10/whitesur-macos-big-sur-like-gtk-gnome.html
        - https://github.com/vinceliuice/WhiteSur-gtk-theme
	- https://www.omgubuntu.co.uk/2017/03/make-ubuntu-look-like-mac-5-steps

	- [MacOS wallpapers](https://photos.google.com/share/AF1QipNNQyeVrqxBdNmBkq9ILswizuj-RYJFNt5GlxJZ90Y6hx0okrVSLKSnmFFbX7j5Mg?key=RV8tSXVJVGdfS1RIQUI0Q3RZZVhlTmw0WmhFZ2V3)

	- [Mcata gtk theme ](https://www.gnome-look.org/p/1381832/)

	- https://github.com/vinceliuice/Sierra-gtk-theme
	- https://github.com/vinceliuice/Mojave-gtk-theme



## System


- Setup thunderbird (and backup it like FF)
	- [for calender & task](https://fruux.com/sync/)
    - [for getting latest Thunderbird](https://launchpad.net/~ubuntu-mozilla-security/+archive/ubuntu/ppa/)

- Firefox Setup (and desktop icons)
	- [for latest nightly](https://launchpad.net/~ubuntu-mozilla-daily/+archive/ubuntu/ppa)

- [Enable flatpack support](https://flatpak.org/setup/Ubuntu/)


- run all prog via amd gpu
	https://askubuntu.com/questions/791022/how-to-configure-an-application-to-always-run-with-dri-prime-1-set-is-there-an

- increase terminal size to 120x30 and change its color and shortcuts

- change terminal 'built-in-schemas' to 'Linux console'
	(pref -> profile(unnamed) -> colors -> palette)

- change keyboard layout

- remove sudo passwd
	https://askubuntu.com/questions/147241/execute-sudo-without-password

- see in ubuntu folder (in mods)

- Enable touchpad gestures

	- fusuma
	(with its addons & config file, add it to startup: "/usr/local/bin/fusuma -d")
		https://github.com/iberianpig/fusuma
	OR
	- extended gestures (wayland only) (change sensitivity to 50)
		https://extensions.gnome.org/extension/1253/extended-gestures/
		https://github.com/mpiannucci/gnome-shell-extended-gestures


	For Xorg only:
	- libinput-gestures (Xorg only, may work on wayland but not recommended, see wiki)
		https://github.com/bulletmark/libinput-gestures

	- comfortable-swipe (Xorg only)
		https://github.com/Hikari9/comfortable-swipe


- Add shortcuts
	- Calc
		(F7)
	- System monitor
		(ctrl+shift+Esc 'gnome-system-monitor')

- Increment volume by 2 onstead of default 6
	"gsettings set org.gnome.settings-daemon.plugins.media-keys volume-step 2"
	https://www.reddit.com/r/gnome/comments/f4owxw/gnome_volume_step_adjustment/



## Install Apps & extensions



- sudo apt update && sudo apt upgrade -y

- Install Apps:
	- sublime & change its theme (pref -> theme -> adaptive.XXX)
		https://linuxconfig.org/how-to-install-sublime-text-editor-on-ubuntu-20-04-focal-fossa-linux

	- gdebi (for installing .deb files)

	- gnome-tweak-tool

	- nemo (disable "desktop icons" extension before installing nemo ,add "nemo-desktop to startup")
		https://itsfoss.com/install-nemo-file-manager-ubuntu/

	- vnstat
		https://www.techrepublic.com/article/how-to-monitor-network-traffic-with-linux-and-vnstat/
		https://www.cyberciti.biz/faq/ubuntu-install-vnstat-console-network-traffic-monitor/
		https://www.cloudsigma.com/how-to-use-vnstat-and-iftop-to-monitor-data-consumption-within-a-vm/

	- PulseEffects (configs are stored in "~/.config/PulseEffects/output") (Do "Start Service at Login" in PE Settings)
		http://ubuntuhandbook.org/index.php/2019/06/install-audio-effects-pulseeffects-ubuntu-18-04-higher/


	- Uget (with its integrator for firefox, fix the issues)
	OR
	- XDM
		https://itsfoss.com/xtreme-download-manager-install/

	- BingWall
		https://www.omgubuntu.co.uk/2020/02/bing-wallpaper-app-ubuntu-snap
	OR
	- Bing wallpaper extension
		https://extensions.gnome.org/extension/1262/bing-wallpaper-changer/

	- lollypop music player
		https://linuxconfig.org/how-to-install-lollypop-music-player-on-linux
		https://launchpad.net/~gnumdk/+archive/ubuntu/lollypop

	- bleachbit
		https://www.bleachbit.org/download

	- stacer
		https://itsfoss.com/optimize-ubuntu-stacer/

	- GreenTunnel
		npm i -g green-tunnel
	OR
		https://www.linuxuprising.com/2020/07/unblock-websites-restricted-by-isps-in.html

	- flameshot (SS tool)
		https://itsfoss.com/flameshot/
	OR
	- Normal SS in Linux
		https://itsfoss.com/take-screenshot-linux/

	- conky (just copy .conky/ to home)
		(http://conky.sourceforge.net/variables.html) or (man conky)

		- https://www.youtube.com/watch?v=miLrmIGPCJs (fix titlebar)

		- https://www.omgubuntu.co.uk/2016/02/run-multiple-conky-scripts-same-session
		- https://www.youtube.com/watch?v=QB8cjKpdVQY
		- https://www.youtube.com/watch?v=e4qNmPAYkFs


		- https://linuxconfig.org/ubuntu-20-04-system-monitoring-with-conky-widgets
		- http://ubuntuhandbook.org/index.php/2020/07/install-conky-manager-ubuntu-20-04-lts/

	- telegram (sudo snap install telegram-desktop)
	- whatsapp desktop (https://itsfoss.com/whatsapp-linux-desktop/)
	- Wireshark (https://itsfoss.com/install-wireshark-ubuntu/)
	- vlc (change to X11 in vlc)
	- freetube

EXTRA Apps:
		- tilix (alternative terminal)
			https://github.com/gnunn1/tilix

		- Elisa music player
			sudo apt install elisa

		- Fly-Pie
			https://github.com/Schneegans/Fly-Pie

		- ulauncher
			https://ulauncher.io/#Download


- Extensions Install:
	- Animation-Tweaks
		https://github.com/Selenium-H/Animation-Tweaks
		(https://github.com/Selenium-H/Animation-Tweaks/issues/34)


	- notifications-alert
		https://extensions.gnome.org/extension/258/notifications-alert-on-user-menu/
	OR
	- always indicator
		https://extensions.gnome.org/extension/258/notifications-alert-on-user-menu/
	OR
	- New mail indicator
		https://extensions.gnome.org/extension/1505/new-mail-indicator/

	- Transparent Notification (.local/share/gnome-shell/extensions/transparentnotification@ipaq3870/stylesheet.css)
		https://extensions.gnome.org/extension/1080/transparent-notification/

	- clipboard history (klipper or copyq or https://extensions.gnome.org/extension/779/clipboard-indicator/)
		https://askubuntu.com/questions/19370/gnome-alternatives-equivalent-for-klipper

	- cpu speed control
		https://github.com/konkor/cpufreq
		https://github.com/martin31821/cpupower

	- panel osd (set 98 & 92)
		https://extensions.gnome.org/extension/708/panel-osd/

	- noannoyance
		https://extensions.gnome.org/extension/1236/noannoyance/

	- impatience (speed gnome animations) (set it to 0.6 in its settings)
		https://extensions.gnome.org/extension/277/impatience/

	- gsconnect
		https://extensions.gnome.org/extension/1319/gsconnect/



## Todo
