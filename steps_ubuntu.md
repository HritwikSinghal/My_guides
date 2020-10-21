# These are all the steps i do after installing Ubuntu to make Ubuntu my type.

Feel free to copy anything from here and use it.


## Most Important


- [x] [Install Timeshift & make backup](https://itsfoss.com/backup-restore-linux-timeshift/)

* [CheckInstall](https://askubuntu.com/questions/87111/if-i-build-a-package-from-source-how-can-i-uninstall-or-remove-completely)

- Brother Printer
    * [Arch Wiki](https://wiki.archlinux.org/index.php/Packaging_Brother_printer_drivers)
    * [LPR vs Cups](https://askubuntu.com/questions/383515/whats-the-difference-between-lpr-and-cupswrapper-drivers-how-to-install-printe)


* [Path variable in profile vs environment](https://askubuntu.com/questions/866161/setting-path-variable-in-etc-environment-vs-profile)

* This is for displaying fps counter on wine games.
    * DRI_PRIME=1 GALLIUM_HUD=fps wine game.exe

* DNS
    * https://askubuntu.com/questions/973017/wrong-nameserver-set-by-resolvconf-and-networkmanager
    * [x] use 'nmcli' command for dns server ip addr ([Link](https://www.liquidweb.com/kb/how-to-install-and-configure-nmcli/))
        - nmcli dev show | grep DNS
    * OR 'nslookup website_name'
    * OR "cat /etc/resolv.conf"
    * OR just check in wifi settings


## Appearance & Customization


- [x] [GTK3 Dark mode](https://askubuntu.com/questions/806200/how-can-you-enable-gtk3-themes-dark-theme-mode-when-using-unity-7) (See maual method, check if this is valid now or not)

- [Full Dark Mode in Ubuntu](https://itsfoss.com/dark-mode-ubuntu/)

- [x] [Full Dark theme in Qt5 apps](https://github.com/tsujan/Kvantum/blob/master/Kvantum/INSTALL.md#debian-based-distributions)

	- Dont compile it
    - Another [Guide](https://www.linuxuprising.com/2018/05/use-custom-themes-for-qt-applications.html)

- If using secondary monitor, make sure both have 1920*1080 and 60Hz

- Switch to wayland on Ubuntu, [This link](https://bugs.launchpad.net/ubuntu/+source/gnome-shell-extension-ubuntu-dock/+bug/1874578) is for dock bug.

- Gnome-tweaks settings
    - change to right click and mouse sensitivity in settings
    - change trackpad behaviour in gnome tweak tool to "fingers"
    - change settings in gnome tweak tool
    - enable middle click to minimize on title bar (in gnome tweak tool)

- Theme:
    - [Grub Themes](https://github.com/vinceliuice/grub2-themes)

    - [Orchis-theme](https://github.com/vinceliuice/Orchis-theme) (For Apps)
        - Also take close buttons from here

    - [materia-theme](https://github.com/nana-4/materia-theme) (For Shell)
        - [Install its snap version for snap Apps](https://snapcraft.io/orchis-themes)

	OR

	- [Pop! Os Application theme](https://github.com/pop-os/gtk-theme) (Compile it)
        - DO NOT INSTALL 'pop-theme' or its ppa, it will mess up ubuntu

	OR

	- [Yaru-Colors](https://github.com/Jannomag/Yaru-Colors)


- Icons:
	- [Pop Icons](https://github.com/pop-os/icon-theme)

	OR
	- [Papirus Icons](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)

    OR
    - [Flat Remix](https://github.com/daniruiz/Flat-Remix)

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
	- [For calender & task](https://fruux.com/sync/)
    - [x] [for getting latest Thunderbird](https://launchpad.net/~ubuntu-mozilla-security/+archive/ubuntu/ppa/)

- Firefox Setup (and desktop icons)
	- [x] [For Latest Nightly](https://launchpad.net/~ubuntu-mozilla-daily/+archive/ubuntu/ppa)
    - [x] Put "MOZ_ENABLE_WAYLAND=1" in "/etc/environment"

- [x] [Enable flatpack support](https://flatpak.org/setup/Ubuntu/)


- [x] [Run all Apps via descrete GPU](https://askubuntu.com/questions/791022/how-to-configure-an-application-to-always-run-with-dri-prime-1-set-is-there-an)
    - Put "DRI_PRIME=1" in "/etc/environment"

- Increase terminal size to 120x30 and change its color and shortcuts
- Change terminal 'built-in-schemas' to 'Linux console'
	(pref -> profile(unnamed) -> colors -> palette)

- Change keyboard layout to DVORAK

- [Remove sudo passwd](https://askubuntu.com/questions/147241/execute-sudo-without-password)

- See in ubuntu folder (in mods)

- Touchpad Gestures

	- [Fusuma](https://github.com/iberianpig/fusuma)
	(with its addons & config file, add it to startup: "/usr/local/bin/fusuma -d")

    OR

	- [Extended gestures](https://extensions.gnome.org/extension/1253/extended-gestures/) Extension
        - wayland only, (change sensitivity to 50)
        - [Github](https://github.com/mpiannucci/gnome-shell-extended-gestures)

	- [libinput-gestures](https://github.com/bulletmark/libinput-gestures)
        - Xorg only, may work on wayland but not recommended, see wiki

	- [Comfortable-swipe](https://github.com/Hikari9/comfortable-swipe)
        - (Xorg only)

- Add shortcuts
	- Calc (F7)
	- System monitor (ctrl+shift+Esc 'gnome-system-monitor')

- [x] [Increment volume](https://www.reddit.com/r/gnome/comments/f4owxw/gnome_volume_step_adjustment/) by 2 onstead of default 6
	- gsettings set org.gnome.settings-daemon.plugins.media-keys volume-step 2


## Install Apps & extensions


- Install Apps:

    - [Atom](https://atom.io/)
	   - [change soft tabs to 4](https://stackoverflow.com/questions/22608160/how-to-change-indentation-mode-in-atom)
	   - Install
        - "termination" (and disable other terminals)
        - "Autosave-Onchange"

    OR

	- [Sublime](https://linuxconfig.org/how-to-install-sublime-text-editor-on-ubuntu-20-04-focal-fossa-linux)
        - Change its theme (pref -> theme -> adaptive.XXX)

	- [x] gdebi (for installing .deb files)

	- [x] gnome-tweak-tool

	- [Nemo](https://itsfoss.com/install-nemo-file-manager-ubuntu/)
        - disable "desktop icons" extension before installing nemo, add "nemo-desktop to startup"
        - [Fix for one window opening only](https://www.reddit.com/r/linuxquestions/comments/f9zfia/why_cant_i_open_multiple_instances_of_nemo_from/)
                "After some tinkering around, I managed to solve the issue!
                I opened nemo.desktop (location: /usr/share/applications/) in a text editor and added "new-window;" to the "Actions" line so it looked like the following:

                Actions=new-window;open-home;open-computer;open-trash;
                [Desktop Action new-window]
                Name=New Window
                Exec=nemo

                After saving the file and restarting I was able to open as many instances of Nemo as I wanted from the dash."

        - [Fix Explaination](https://forums.linuxmint.com/viewtopic.php?t=293818)

	- Vnstat
		- [Link1](https://www.techrepublic.com/article/how-to-monitor-network-traffic-with-linux-and-vnstat/)
		- [Link2](https://www.cyberciti.biz/faq/ubuntu-install-vnstat-console-network-traffic-monitor/)
		- [Link3](https://www.cloudsigma.com/how-to-use-vnstat-and-iftop-to-monitor-data-consumption-within-a-vm/)

	- [PulseEffects](http://ubuntuhandbook.org/index.php/2019/06/install-audio-effects-pulseeffects-ubuntu-18-04-higher/)
		- configs are stored in "~/.config/PulseEffects/output") (Do "Start Service at Login" in PE Settings

	- [Uget](https://itsfoss.com/xtreme-download-manager-install/) (with its integrator for firefox, fix the issues)

    OR

	- XDM

	- [x] [BingWall](https://www.omgubuntu.co.uk/2020/02/bing-wallpaper-app-ubuntu-snap)
        - sudo snap install bing-wall
        - [x] and "wonderwall"
            - sudo snap install wonderwall

    OR

    - [Bing wallpaper extension](https://extensions.gnome.org/extension/1262/bing-wallpaper-changer/)

	- [x] [Lollypop music player](https://launchpad.net/~gnumdk/+archive/ubuntu/lollypop)

	- [Bleachbit](https://www.bleachbit.org/download)

	- [Stacer](https://itsfoss.com/optimize-ubuntu-stacer/)

	- [x] [GreenTunnel](https://www.linuxuprising.com/2020/07/unblock-websites-restricted-by-isps-in.html)
		- npm i -g green-tunnel

	- [Flameshot](https://itsfoss.com/flameshot/) (SS tool)

	OR

	- [Normal SS in Linux](https://itsfoss.com/take-screenshot-linux/)

	- Conky (just copy .conky/ to home)
        - [x] [install](http://ubuntuhandbook.org/index.php/2020/07/install-conky-manager-ubuntu-20-04-lts/)
        - [Conky config variables](http://conky.sourceforge.net/variables.html) OR 'man conky'

		- [Titlebar Fix](https://www.youtube.com/watch?v=miLrmIGPCJs)

		- [Run Mltiple Conky scrips](https://www.omgubuntu.co.uk/2016/02/run-multiple-conky-scripts-same-session)
		- [Conky Setup by Chrits Titus Tech Youtube](https://www.youtube.com/watch?v=QB8cjKpdVQY)

		- [Conky Widgets Config Link 1](https://linuxconfig.org/ubuntu-20-04-system-monitoring-with-conky-widgets)
		- [Conky Widgets Config Link 2](http://ubuntuhandbook.org/index.php/2020/07/install-conky-manager-ubuntu-20-04-lts/)

	- [x] Telegram
        - sudo snap install telegram-desktop
	- [x] [Whatsapp desktop](https://itsfoss.com/whatsapp-linux-desktop/)
        - sudo snap install whatsdesk
	- [Wireshark](https://itsfoss.com/install-wireshark-ubuntu/)
	- [x] VLC
        - change to X11 Video Decoder in settings
	- Freetube

    - EXTRA Apps:
		- Elisa music player
			- sudo apt install elisa
		- [Fly-Pie](https://github.com/Schneegans/Fly-Pie)
		- [ulauncher](https://ulauncher.io/#Download)

- Extensions Install:
    - [user-themes](https://extensions.gnome.org/extension/19/user-themes/)

	- [Animation-Tweaks](https://github.com/Selenium-H/Animation-Tweaks)
        - [Change notification Position](https://github.com/Selenium-H/Animation-Tweaks/issues/34)

	- [notifications-alert](https://extensions.gnome.org/extension/258/notifications-alert-on-user-menu/)

	OR
	- [always indicator](https://extensions.gnome.org/extension/258/notifications-alert-on-user-menu/)

	OR
	- [New mail indicator](https://extensions.gnome.org/extension/1505/new-mail-indicator/)

	- [Transparent Notification](https://extensions.gnome.org/extension/1080/transparent-notification/)
        - .local/share/gnome-shell/extensions/transparentnotification@ipaq3870/stylesheet.css

	- Clipboard history
        - klipper
            - [Alt for Klipper in Gnome](https://askubuntu.com/questions/19370/gnome-alternatives-equivalent-for-klipper)
        - copyq
        - [Clipboard-indicator Gnome Extension](https://extensions.gnome.org/extension/779/clipboard-indicator/)

	- cpu speed control
		- [cpufreq](https://github.com/konkor/cpufreq)
		- [cpupower](https://github.com/martin31821/cpupower)

	- [panel osd](https://extensions.gnome.org/extension/708/panel-osd/)
        - Not Req with animations Tweaks Extension
        - set 98 & 92

	- [Noannoyance](https://extensions.gnome.org/extension/1236/noannoyance/)

	- [Impatience](https://extensions.gnome.org/extension/277/impatience/) (speed gnome animations)
        - set it to 0.6 in its settings

	- [gsconnect](https://extensions.gnome.org/extension/1319/gsconnect/)


## Todo

- make one script for all startup apps
- startup bug
    - conky  (maybe its taking time to start)
	- desktop icons for nemo

    - try these in startup apps
        ```
        bash -c 'sleep 3; /home/hritwik/.conky/conky-startup.sh'
        bash -c 'sleep 3; nemo-desktop'
        bash -c 'sleep 3; /usr/local/bin/fusuma -d'
        ```

- backup gnome boxes

- make script for all above actions (backup and restore of whole OS)
	- https://www.reddit.com/r/Ubuntu/comments/jbhur4/goodbye_whatever_it_is_hello_ubuntu_2010_beta/

    - BACKUP "~/.local/share/gnome-shell/extensions" for extensions
        - this does not backup their data
        - https://askubuntu.com/questions/1178580/where-are-gnome-extensions-preferences-stored

    - https://ostechnix.com/backup-and-restore-linux-desktop-system-settings-with-dconf/
 		- (for nemo and extensions and system backup)


- make current shell theme transparent

- fusuma on sleep
- Close button big
- screen sharing wayland,
- pinch to zoom Ubuntu,
- theme color change our create new theme,
- Firefox profile shortcuts,


- try VS-codium

- learn shell language and how this works: "nmcli dev show | grep DNS | awk '{ print $2 }"

- try this for audio not coming in headphone fix
	- sudo apt install pavucontrol

    OR

	- [upgrade kernel](https://itsfoss.com/upgrade-linux-kernel-ubuntu/#ukuu)
        - secure boot ka chod hoga agar unsigned install kiya to


- Virtualization
	- [Install Win10 VM](https://getlabsdone.com/install-windows-10-on-ubuntu-kvm/)

	- gnome-boxes (installl via flathub)
		- [Guide](https://ostechnix.com/manage-remote-and-virtual-machines-with-gnome-boxes/)
        - [Cant copy big files to VM fix](https://gitlab.gnome.org/GNOME/gnome-boxes/-/issues/353)

	OR
	- virt-manager (run as sudo)
		- [Link1](https://www.tecmint.com/install-kvm-on-ubuntu/)

		OR
		- [Link2](https://linuxize.com/post/how-to-install-kvm-on-ubuntu-20-04/)

- make terminal shell beatiful and maybe switch to zhs
	- show current branch in git in terminal


# Extra Articles

- https://linuxhint.com/add_shortcuts_ubuntu_desktop/

- https://www.linuxuprising.com/2020/10/schedule-commands-and-scripts-in-linux.html
- https://www.linuxuprising.com/2020/03/mystiq-is-easy-to-use-ffmpeg-gui.html
- https://www.linuxuprising.com/2020/01/bandwhich-shows-whats-taking-up-your.html
- https://www.linuxuprising.com/2020/05/how-to-encrypt-cloud-storage-files-with.html
- https://www.linuxuprising.com/2020/04/cryptomator-150-released-with.html
- https://medium.com/swlh/backing-up-with-borg-c6f13d74dd6


- https://www.linuxuprising.com/2020/07/ubuntu-how-to-free-up-port-53-used-by.html
- https://www.linuxuprising.com/2020/02/tlp-13-linux-laptop-battery-extender.html

- https://itsfoss.com/linux-command-tricks/
- https://opensource.com/article/18/5/bash-tricks
- https://linuxconfig.org/how-to-backup-and-restore-permissions-for-entire-directory-on-linux
- https://www.linuxuprising.com/2020/09/how-to-enable-echo-noise-cancellation.html
