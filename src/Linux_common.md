# Common Things for all Linux Distros

# **Table of Contents**
- Notes & Saved
    - Notes
    - Saved
- Apps, Extensions, Themes
    - Apps
    - Extensions
    - Themes, Icons, Fonts
- Guides
    - grub reinstall
    - Virtualization, QEMU/KVM
    - Gaming




---



## Notes & Saved

### Notes

- Tmux
    - [Oh my tmux](https://github.com/gpakosz/.tmux)
    - https://github.com/jimeh/tmux-themepack
    - Try [zellij](https://www.linuxuprising.com/2021/04/zellij-is-new-terminal-multiplexer.html)

- This is for displaying fps counter on wine games.
    - DRI_PRIME=1 GALLIUM_HUD=fps wine game.exe

- [restart-network](https://itsfoss.com/restart-network-ubuntu)
    - use nmcli commands:
        - sudo nmcli networking off
        - sudo nmcli networking on
    - maybe look into 'ip'

- DNS lookup
    - nmcli dev show | grep DNS
    - nslookup website_name
    - cat /etc/resolv.conf
    - just check in wifi settings


- [Fix secondary monitor display](https://wayneoutthere.com/2018/12/29/how-to-fix-wrong-monitor-display-ubuntu/)
    - rm .config/monitors.xml
    - or maybe the problem is that dash to panel shows itself on 2nd monitor

- Switch to wayland (to be removed when wayland becomes def in ubuntu LTS and other major distros)
    - [This link](https://bugs.launchpad.net/ubuntu/+source/gnome-shell-extension-ubuntu-dock/+bug/1874578) is for dock bug in 20.04 LTS wayland.

- [set su passwd](https://askubuntu.com/questions/155278/how-do-i-set-the-root-password-so-i-can-use-su-instead-of-sudo)
    - sudo passwd



### Saved

- [This thing runs OFFICE and ADOBE APPS like they were NATIVE? - YouTube](https://www.youtube.com/watch?v=fzzf2QnyPgY)

- [How To Use DSLR as Webcam In Linux - YouTube](https://www.youtube.com/watch?v=TsuY4o2zLVQ)

- Setup guide
    - [Reddit, take extension install from comments](https://www.reddit.com/r/Ubuntu/comments/jbhur4/goodbye_whatever_it_is_hello_ubuntu_2010_beta/)
    - [github, for great selection of apps and other things. This is great](https://github.com/themagicalmammal/howtopopbuntu)

- [login with USB on liunx](https://www.linuxuprising.com/2021/02/how-to-login-with-usb-flash-drive.html)

- [cut m4a audio](https://superuser.com/questions/140899/ffmpeg-splitting-mp4-with-same-quality)

- [schedule-commands-and-scripts-in-linux](https://www.linuxuprising.com/2020/10/schedule-commands-and-scripts-in-linux.html)

- Timeshift will fuck up windows bootloader if you restore it back to an old windows bootloader installation
    - [FIX](https://thegeekpage.com/bootrec-fixboot-access-is-denied/)


- [Linux Wifi Hotspot](https://github.com/lakinduakash/linux-wifi-hotspot)


- Emulation of x86 on arm64 and more.
    - https://superuser.com/questions/781454/debian-arm-and-brother-dcp195c-with-cups
    - https://wiki.debian.org/QemuUserEmulation
    - https://wiki.debian.org/Multiarch/HOWTO
    - https://wiki.debian.org/Multiarch
    - http://neuro.debian.net/blog/2013/2013-05-31_matlab_64bit_on_32bit.html
    - https://unix.stackexchange.com/questions/118343/run-64-bit-app-on-32-bit-ubuntu-system
    - [Box64 Emulator Released for Arm64 Linux - It's FOSS News](https://news.itsfoss.com/box64-emulator-released/)


- QEMU
    - https://github.com/qemu/qemu/search?q=harddisk
    - https://github.com/SafeExamBrowser/seb-win-refactoring/blob/master/SafeExamBrowser.SystemComponents/VirtualMachineDetector.cs#L19
    - https://github.com/SafeExamBrowser/seb-win/blob/2199f9d167fb05b9b869bebd86a2df61352c0bb0/SebWindowsClient/SebWindowsClient/SebWindowsClientMain.cs#L264
    - https://blog.prowling.nu/2012/09/modifying-kvm-qemu-kvm-settings-for.html
    - https://wiki.qemu.org/Hosts/Linux
    - https://www.google.com/search?q=compile+qemu+ubuntu
    - https://wiki.qemu.org/index.php?title=Hosts/Linux&action=edit
    - https://gns3.com/community/blog/how-to-compile-qemu-2-2-0-in-ubu
    - https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide/sect-guest_virtual_machine_disk_access_with_offline_tools-using_virt_customize
    - https://developers.redhat.com/blog/2020/03/06/configure-and-run-a-qemu-based-vm-outside-of-libvirt/
    - https://www.google.com/search?q=qemu+change+directory
    - https://www.google.com/search?q=compile+qemu+to+usr%2Fbin
    - https://www.reddit.com/r/VFIO/comments/9pi2cd/how_to_set_up_qemu_30_on_ubuntu_1804/
    - https://help.ubuntu.com/community/AppArmor
    - https://phoenixnap.com/kb/grep-command-linux-unix-examples
    - https://www.digitalocean.com/community/tutorials/using-grep-regular-expressions-to-search-for-text-patterns-in-linux
    - https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide/sect-manipulating_the_domain_xml-smbios_system_information
    - https://blog.prowling.nu/2012/09/modifying-kvm-qemu-kvm-settings-for.html
    - https://askubuntu.com/questions/58321/how-do-i-install-glib
    - https://gns3.com/community/blog/how-to-compile-qemu-2-2-0-in-ubu
    - https://askubuntu.com/questions/1123697/where-are-image-files-for-gnome-boxes-stored
    - https://github.com/nsmfoo/antivmdetection
    - https://www.guyrutenberg.com/2018/10/25/sharing-a-folder-a-windows-guest-under-virt-manager/



- [Using FFMPEG and V4l2 Loopback to Play YouTube Videos as a WebCam](https://theterminallife.com/using-ffmpeg-and-v4l2-loopback-to-play-youtube-videos-as-a-webcam/)
    ```
    With the increased amount of video conferencing going on, I decided to dust off an old trick to 'spice' things up during the many video calls I am on.
    Things You Need

        Linux : I'm using Pop_OS 20.04 for this one.
            maybe other OSes too...but I'm too lazy to try right now
        ffmpeg
            standard apt install ffmpeg should suffice
        youtube-dl
            again just a apt install youtube-dl away
        v4l2loopback-dkms
            you guessed it apt install v4l2loopback-dkms
            you may need to reboot after that one...

    Codeblock for the lazy:

    sudo apt install ffmpeg youtube-dl v4l2loopback-dkms

    Putting it Together

    The first thing to do is to see how many video devices you already have on your machine. This is handy to know for when we add the virtual one in.

    In my case, I have 3 devices that show up there.

    quinnm@pop-os:~$ ll /dev/video*
    crw-rw----+ 1 root video 81, 0 Apr 28 13:48 /dev/video0
    crw-rw----+ 1 root video 81, 1 Apr 28 13:51 /dev/video1
    crw-rw----+ 1 root video 81, 2 Apr 28 13:51 /dev/video2

    Armed with that knowledge, we can load the kernel module for v4l2loopback.

    quinnm@pop-os:~$ sudo modprobe v4l2loopback

    You should now have a new video device. In my case it is video3. Yours may not be, so that is why we eyeballed the directory before loading the module.

    quinnm@pop-os:~$ ll /dev/video*
    crw-rw----+ 1 root video 81, 0 Apr 28 13:48 /dev/video0
    crw-rw----+ 1 root video 81, 1 Apr 28 13:51 /dev/video1
    crw-rw----+ 1 root video 81, 2 Apr 28 13:51 /dev/video2
    crw-rw----+ 1 root video 81, 2 Apr 28 13:51 /dev/video3

    Now, head to Youtube and find the video you want to pump into that virtual device. I like to choose "Calming TV for Cats : Cat TV - My Garden Birds - Relaxing Nature Music for Cats to Sleep" because why not.

    Get the URL of the video chosen and use youyube-dl -F to find out what formats are available. I find that mp4 formats seem to work the best for this. Other formats seem to error when I try to stream them to the virtual device. Not sure if that is a codec thing or an error on my part.

    quinnm@pop-os:~$ youtube-dl -F 'https://www.youtube.com/watch?v=4joV8bgLSDo'

    Rather than paste the wall of text from that command, I'll just tell you I chose format number 134.

    Now we can stream that video into /dev/video3 using ffmpeg:

    quinnm@pop-os:~$ ffmpeg -re -i \
      $(youtube-dl -g -f 134 https://www.youtube.com/watch\?v\=4joV8bgLSDo) \
      -f v4l2 /dev/video3

    Command     Option  Reason
    ffmpeg  -re     Reads the input at native framerate.
    This option will slow down the reading
    of the input(s) to the native frame rate of the input(s).
    It is useful for real-time output (e.g. live streaming)
    (from man ffmpeg)
        -i  Specify the input.
    In this case it is the full URL to the youtube video
    as returned by youtube-dl -g URL
        -f v4l2     Tell ffmpeg to use the format 4vl2 for our output
        /dev/video3     Tell ffmpeg to output to our virtual device
    youtube-dl  -g  Prints out the full URL of the video from youtube
    ...which is crazy long
        -f 134  Specify which format number we want
    (we got that further up this doc using youtube-dl -F)

    I've not yet worked out how to get audio pumped in there from youtube, so for now it is only the video and I just add my own sound effects with my microphone when ZoomSkypeJitsi callin'. 
    ```
    - https://atinkerholic.wordpress.com/2018/10/10/how-to-use-a-virtual-webcam-with-static-image-or-video-ffmpeg-v4l-utils-and-v4l2loopback/
    - https://askubuntu.com/questions/881305/is-there-any-way-ffmpeg-send-video-to-dev-video0-on-ubuntu
    - search this on google


- [change mac](https://linuxconfig.org/change-mac-address-with-macchanger-linux-command)
    - and as always, [THE GREAT ARCH WIKI](https://wiki.archlinux.org/index.php/MAC_address_spoofing#Automatically) to change mac auto on every boot.
    - [another guide, not complete](https://itsfoss.com/change-mac-address-linux/)

- https://www.linuxuprising.com/2020/01/bandwhich-shows-whats-taking-up-your.html
- https://www.linuxuprising.com/2020/05/how-to-encrypt-cloud-storage-files-with.html
- [cryptomator](https://www.linuxuprising.com/2020/04/cryptomator-150-released-with.html)
- [borg backup](https://medium.com/swlh/backing-up-with-borg-c6f13d74dd6)


- [free-up-port-53 in ubuntu](https://www.linuxuprising.com/2020/07/ubuntu-how-to-free-up-port-53-used-by.html)
    - https://askubuntu.com/questions/973017/wrong-nameserver-set-by-resolvconf-and-networkmanager


- [TLP, extend battery linux](https://www.linuxuprising.com/2020/02/tlp-13-linux-laptop-battery-extender.html)
- [script to use a smartphone (or any audio stream) as microphone on PulseAudio](https://github.com/MatthiasCoppens/pulseaudio-virtualmic)


- Brother Printer
    - [Arch Wiki](https://wiki.archlinux.org/index.php/Packaging_Brother_printer_drivers)
    - [LPR vs Cups](https://askubuntu.com/questions/383515/whats-the-difference-between-lpr-and-cupswrapper-drivers-how-to-install-printe)
    - https://aur.archlinux.org/packages/brother-hll2360d/


- [dconf guide](https://askubuntu.com/questions/424621/which-files-does-gconf-editor-edit)


- Change compression level
    ```
    gsettings set org.gnome.FileRoller.General compression-level "very-fast"
    gsettings set org.gnome.FileRoller.General compression-level "fast"
    gsettings set org.gnome.FileRoller.General compression-level "normal"
    gsettings set org.gnome.FileRoller.General compression-level "maximum"
    ```

- [download-latest-version-from-github](https://smarterco.de/download-latest-version-from-github-with-curl/)
    - Note: Replace the repository URL and grep "swamp_amd64" with the file you need (grep "YOUR_FILE").
        ```
        DOWNLOAD_URL=$(curl -s https://api.github.com/repos/felixb/swamp/releases/latest \
        | grep browser_download_url \
        | grep swamp_amd64 \
        | cut -d '"' -f 4)
        curl -s -L --create-dirs -o ~/downloadDir "$DOWNLOAD_URL"
        ```



---





## Apps, Extensions, Themes

### Apps

- There are many distro specific apps that are not known
    - Linux Mint
        - Warpinator, AirDrop for Linux
        - Web apps creater

    - Elementary OS
        - Find some [here](https://github.com/kleinrein/awesome-elementaryos), [here](https://www.fossmint.com/best-elementary-os-applications/), [here](https://appcenter.elementary.io/)
        - [appImageLauncher, for managing appImages.](https://github.com/TheAssassin/AppImageLauncher)
        - [eddy](https://github.com/donadigo/eddy), for installing deb files.

    - Manjaro
        - Pamac (for gui of AUR and other)
        - 
    - Solus
        - Doflicky (hardware manager)


- Audio Tagger
    - https://www.ubuntupit.com/top-15-best-music-tag-editor-software-for-linux-system/
    - [Kid3 audio tagger](https://kid3.kde.org/)


- Browers
    - Firefox
        - Put "MOZ_ENABLE_WAYLAND=1" in "/etc/environment"
    - Firefox Nightly

- Bulk rename linux
    - GPrename
    - https://www.makeuseof.com/batch-rename-files-in-linux/
    - https://www.fossmint.com/krename-batch-file-renamer-for-linux/
    - https://linuxhint.com/rename_files_linux/
    - https://askubuntu.com/questions/511862/an-ubuntu-linux-alternative-of-bulk-rename-utility-for-windows
    - https://askubuntu.com/questions/1217683/rename-multiple-files-at-the-same-time
    - Thunar comes with bulk rename
    - Lunux mint 20.2 comes with one
    - [F2: Fast And Safe Batch Rename Tool For The Command Line (Cross-Platform)](https://www.linuxuprising.com/2021/05/f2-fast-and-safe-batch-rename-tool-for.html)

- Clipboard Managers
    - [copyq](https://github.com/hluk/CopyQ/releases)
    - [Klipper](https://userbase.kde.org/Klipper)
    - [clipcat, a clipboard manager written in Rust Programming Language](https://github.com/xrelkd/clipcat)
    - [Clipboard Manager extension for Gnome](https://extensions.gnome.org/extension/779/clipboard-indicator/)


- Custom Kernel
    - Xanmod

- Download Manager
    - [Uget](https://itsfoss.com/install-latest-uget-ubuntu-linux-mint/)
    - XDM
        - [Issue of xdm not picking up downloads in FF](https://github.com/subhra74/xdm/issues/235)

- Emulators
    - [Box64 Emulator Released for Arm64 Linux - It's FOSS News](https://news.itsfoss.com/box64-emulator-released/)

- File Manager
    - Nemo    
        - [Github](https://github.com/linuxmint/nemo/releases/)
        - disable "desktop icons" extension before installing nemo, add "nemo-desktop to startup"
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


- Gestures

    - [Touchegg](https://github.com/JoseExposito/touchegg)
    - [Fusuma](https://github.com/iberianpig/fusuma)

    - [Extended gestures](https://github.com/mpiannucci/gnome-shell-extended-gestures) Extension
        - wayland only
        - change sensitivity to 50
    - [libinput-gestures](https://github.com/bulletmark/libinput-gestures)
        - Xorg only, may work on wayland but not recommended, see wiki
    - [Comfortable-swipe](https://github.com/Hikari9/comfortable-swipe)
        - Xorg only

- IDE
    - Jetbrains
    - [Atom]((https://flight-manual.atom.io/getting-started/sections/installing-atom/))
        - [change soft tabs to 4](https://stackoverflow.com/questions/22608160/how-to-change-indentation-mode-in-atom)
    - [codium](https://vscodium.com/)
        - [Install from repo](https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo)
    - VSCode (Don't ever Use this proprietary shit, use codium with patches for marketplace)


- Image Processing
    - [Converseen for Batch Processing Images on Linux - It's FOSS](https://itsfoss.com/converseen/)

- Mail Clients
    - Good ol Thunderbird
        - [For calender & task](https://fruux.com/sync/)
    - [Mailspring](https://www.youtube.com/watch?v=Oij2U1d3yL4)
    - Geary

- Markdown Editors
    - https://github.com/marktext/marktext
    - https://github.com/wereturtle/ghostwriter
    - https://www.qownnotes.org/
    - https://boostnote.io/


- Media Editors
    - Audacity
    - Kdenlive

- Messaging
    - [Signal Desktop](https://signal.org/en/download)
    - Element
    - Telegram
    - Whatsapp

- Metadata Viewer
    - https://libre-software.net/edit-metadata-exiftool/
    - https://ostechnix.com/display-media-files-information-on-linux-using-mediainfo/
    - [Exiftool](https://libre-software.net/edit-metadata-exiftool/)


- Music Players
    - Lollypop music player
    - Elisa music player

- Network Monitor
    - Vnstat
        - [Link1](https://www.cyberciti.biz/faq/ubuntu-install-vnstat-console-network-traffic-monitor/)
        - [Link2](https://www.techrepublic.com/article/how-to-monitor-network-traffic-with-linux-and-vnstat/)
        - [Link3, for GUI via apache](https://www.cloudsigma.com/how-to-use-vnstat-and-iftop-to-monitor-data-consumption-within-a-vm/)


- Package Managers & Installers
    - [appImageLauncher, for managing appImages.](https://github.com/TheAssassin/AppImageLauncher)    
	- [CubeGet, Portable and offline package manager for Linux](https://github.com/camicri/cube-get/)
		- lets you download all dependencies offline for (DEB files only)
    - [eddy](https://github.com/donadigo/eddy), for installing deb files.
    - Gdebi (for .deb files)


- Packet Sniffers
    - [Wireshark](https://itsfoss.com/install-wireshark-ubuntu/)
    - Fiddler
    - Burp

- Paint Apps
    - [7 Open Source Paint Applications for Linux Users](https://itsfoss.com/open-source-paint-apps/)


- Pdf Editor
    - [PDF Mix Tool](https://www.linuxuprising.com/2021/06/pdf-mix-tool-10-released-with.html)


- Proxy
    - [GreenTunnel](https://www.linuxuprising.com/2020/07/unblock-websites-restricted-by-isps-in.html)

- Remote control software
    - Reminna
    - TigerVNC
    - RealVNC
    - [More here](https://www.tecmint.com/remmina-remote-desktop-sharing-and-ssh-client/)


- Screen Mirror Tools
    - [With Deskreen, You Can Mirror or Stream Your Linux Computer Screen to Any Device](https://itsfoss.com/deskreen/)



- ScreenRecorder Tools
    - [Obs-studio](https://obsproject.com/wiki/install-instructions)
        - ```paru obs-studio-git``` (current git version has wayland patches)
        - OR ```sudo pacman -S obs-studio && paru obs-xdg-portal-git && paru obs-gnome-screencast```
        - OR wait till OBS-v27 for native wayland support

- Screenshot tools
    - [Normal SS in Linux](https://itsfoss.com/take-screenshot-linux/)
    - [Ksnip](https://www.linuxuprising.com/2020/12/cross-platform-screenshot-tool-ksnip.html)
    - [Flameshot](https://itsfoss.com/flameshot/)
        - https://github.com/flameshot-org/flameshot/releases

- Sound Management
    - [PulseEffects](http://ubuntuhandbook.org/index.php/2019/06/install-audio-effects-pulseeffects-ubuntu-18-04-higher/)
        - configs are stored in "~/.config/PulseEffects/output")
        - Do "Start Service at Login" in PE Settings
        - [Lots of LSP icons in apps due to pulseeffects in Gnome 3.38](https://askubuntu.com/questions/1286239/show-all-apps-menu-flooded-with-lsp-modules-after-upgrade-to-20-10)
            - ```echo "[Desktop Entry] Hidden=true" > /tmp/1```
            - ```find /usr -name "*lsp_plug*desktop" 2>/dev/null | cut -f 5 -d '/' | xargs -I {} cp /tmp/1 ~/.local/share/applications/{}```

- System Optimizer
    - [Bleachbit](https://www.bleachbit.org/download)
    - [Stacer](https://itsfoss.com/optimize-ubuntu-stacer/)
    - [cpufreq Extension](https://github.com/konkor/cpufreq)
    - [cpupower Extension](https://github.com/martin31821/cpupower)


- Temp Mail
    - [tmpmail, temp mail from shell](https://github.com/sdushantha/tmpmail)

- Text Editor
    - [Sublime](https://linuxconfig.org/how-to-install-sublime-text-editor-on-ubuntu-20-04-focal-fossa-linux)
        - Change its theme (pref -> theme -> adaptive.XXX)


- Time Tracker
    - [ActivityWatch](https://news.itsfoss.com/activitywatch-0-11-release/)


- Torrent Clients
    - Qbittorrent
    - Transmission

- Video Players
    - VLC
        - If problems on wayland, change to X11 Video Decoder in settings

- Wallpapers
    - [BingWall](https://www.omgubuntu.co.uk/2020/02/bing-wallpaper-app-ubuntu-snap)
    - Wonderwall
    - [Bing wallpaper extension](https://extensions.gnome.org/extension/1262/bing-wallpaper-changer/)


- Widgets
    - [Conky](http://ubuntuhandbook.org/index.php/2020/07/install-conky-manager-ubuntu-20-04-lts/)
        -  for backup: just copy .conky/ to home
        - [Conky config variables](http://conky.sourceforge.net/variables.html)
            - OR 'man conky'
        - [Titlebar Fix](https://www.youtube.com/watch?v=miLrmIGPCJs)
        - [Run Mltiple Conky scrips](https://www.omgubuntu.co.uk/2016/02/run-multiple-conky-scripts-same-session)
        - [Conky Setup by Chrits Titus Tech Youtube](https://www.youtube.com/watch?v=QB8cjKpdVQY)
        - [Conky Widgets Config Link 1](https://linuxconfig.org/ubuntu-20-04-system-monitoring-with-conky-widgets)
        - [Conky Widgets Config Link 2](http://ubuntuhandbook.org/index.php/2020/07/install-conky-manager-ubuntu-20-04-lts/)


- Xtra
    - [Debtap: A script for converting .deb packages into Arch Linux packages, focused on accuracy](https://github.com/helixarch/debtap)

    - [Deskreen](https://www.reddit.com/r/electronjs/comments/kzuf10/i_created_deskreen_this_is_a_desktop_app_that/)
        - This is a desktop app that makes any device with a web browser a second screen for your computer

    - [duf: A Cross-Platform disk usage utility written in Golang](https://itsfoss.com/duf-disk-usage/)

    - [Fildem Global Menu And HUD](https://www.linuxuprising.com/2021/02/how-to-install-fildem-global-menu-and.html)
        - Using this, the menu that's usually built into the application window is displayed on the top GNOME Shell panel. Thanks to the HUD functionality (which is brought up by using the Alt + Space keyboard shortcut), you can also use this to search through the application menu, very useful for applications with vast menus, like GIMP for example.

    - Freetube
    
    - [Fly-Pie](https://github.com/Schneegans/Fly-Pie)
    
    - [gnome-sushi](https://www.omgubuntu.co.uk/gnome-sushi-mac-quick-for-ubuntu) (spacebar preview for nautilus)

    - [NoiseTorch Is A Real-Time Microphone Noise Suppression Application For Linux](https://www.linuxuprising.com/2021/02/noisetorch-is-real-time-microphone.html)
    
    - [ulauncher](https://ulauncher.io/#Download)

    - Youtube-dl & ffmpeg GUI
        - [Youtube-dl Gui](https://itsfoss.com/youtube-dl-gui-apps/)
        - [Simple-to-use graphical interface for youtube-dl](https://www.reddit.com/r/linux/comments/kyw5jx/a_simpletouse_graphical_interface_for_youtubedl/)

        - [ffmpeg gui: mystiq](https://www.linuxuprising.com/2020/03/mystiq-is-easy-to-use-ffmpeg-gui.html)



### Extensions

- [Install from ZIP](https://linuxconfig.org/how-to-install-gnome-shell-extensions-from-zip-file-using-command-line-on-ubuntu-18-04-bionic-beaver-linux)

- [user-themes](https://extensions.gnome.org/extension/19/user-themes/)

- [Animation-Tweaks](https://github.com/Selenium-H/Animation-Tweaks)
    - [Change notification Position](https://github.com/Selenium-H/Animation-Tweaks/issues/34)
            ```
            The Tween Parameters - "First Number" denotes the position of the notification banner at the start of the animation
            and Tween Parameters - "Last Number" denotes the ending position of the notification banner.
            ```

- [notifications-alert](https://extensions.gnome.org/extension/258/notifications-alert-on-user-menu/)

- [Transparent Notification](https://extensions.gnome.org/extension/1080/transparent-notification/)
    - set "/.local/share/gnome-shell/extensions/transparentnotification@ipaq3870/stylesheet.css" to "background-color: rgba(0,0,0,0.72);"

- [Noannoyance](https://extensions.gnome.org/extension/1236/noannoyance/)

- [windowoverlay-icons](https://extensions.gnome.org/extension/302/windowoverlay-icons/)

- [multi-monitors-add-on](https://extensions.gnome.org/extension/921/multi-monitors-add-on/)

- [workspace-indicator](https://extensions.gnome.org/extension/21/workspace-indicator/)

- [gsconnect](https://extensions.gnome.org/extension/1319/gsconnect/)

- [Impatience](https://extensions.gnome.org/extension/277/impatience/) (speed gnome animations)
    - set it to 0.6 in its settings

- [panel osd](https://extensions.gnome.org/extension/708/panel-osd/)
    - set 98 & 92


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



### Themes, Icons, Fonts

- [Grub Themes](https://github.com/vinceliuice/grub2-themes)

- [Orchis-theme](https://github.com/vinceliuice/Orchis-theme) (For Apps)
    - Also take close buttons from here   
    - [Install its snap version for snap Apps](https://snapcraft.io/orchis-themes)
- [materia-theme](https://github.com/nana-4/materia-theme) (For Shell)
- [Pop! Os Application theme](https://github.com/pop-os/gtk-theme) (Compile it)
    - DO NOT INSTALL 'pop-theme' or its ppa, it will mess up ubuntu
- [Yaru-Colors](https://github.com/Jannomag/Yaru-Colors)


- [Pop Icons and curser](https://github.com/pop-os/icon-theme)
- [Papirus Icons](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
- [Flat Remix Icons](https://github.com/daniruiz/Flat-Remix)

- Pop Fonts
    - sudo apt install pop-fonts
        ```
        Interface: Fira Sans Book 11
        Documents: Roboto Slab Regular 11
        Monospace: Fira Mono Regular 13
        Window Titles: Fira Sans SemiBold 11
        scaling factor: 0.85
        ```

- [Pop! Os Wall](https://github.com/pop-os/wallpapers)

- For macOS like look ([see video](https://www.youtube.com/watch?v=IzPxJK4drcc))
    - https://itsfoss.com/make-ubuntu-look-like-macos/
    - https://www.linuxuprising.com/2020/10/whitesur-macos-big-sur-like-gtk-gnome.html
        - https://github.com/vinceliuice/WhiteSur-gtk-theme
    - https://www.omgubuntu.co.uk/2017/03/make-ubuntu-look-like-mac-5-steps
    - [MacOS wallpapers](https://photos.google.com/share/AF1QipNNQyeVrqxBdNmBkq9ILswizuj-RYJFNt5GlxJZ90Y6hx0okrVSLKSnmFFbX7j5Mg?key=RV8tSXVJVGdfS1RIQUI0Q3RZZVhlTmw0WmhFZ2V3)
    - [Mcata gtk theme ](https://www.gnome-look.org/p/1381832/)
    - https://github.com/vinceliuice/Sierra-gtk-theme
    - https://github.com/vinceliuice/Mojave-gtk-theme





---






## Guides

#### grub reinstall

- Sources
    - https://howtoubuntu.org/how-to-repair-restore-reinstall-grub-2-with-a-ubuntu-live-cd
    - https://askubuntu.com/questions/831216/how-can-i-reinstall-grub-to-the-efi-partition

    - https://bbs.archlinux.org/viewtopic.php?id=172867
    - https://unix.stackexchange.com/a/418913

    Mount the partition your Ubuntu Installation is on. If you are not sure which it is, launch GParted (included in the Live CD) and find out. It is usually a EXT4 Partition. Replace the XY with the drive letter, and partition number, for example: sudo mount -t ext4 /dev/sda1 /mnt.

    ```sh
    sudo mount /dev/sdXY /mnt
    sudo mount /dev/sdXX /mnt/boot/efi
    for i in /dev /dev/pts /proc /sys /run; do sudo mount -B $i /mnt$i; done

    for i in /dev /dev/pts /proc /sys /sys/firmware/efi/efivars /run; do sudo mount -B $i /mnt$i; done
    modprobe efivars
    mount -t efivarfs efivarfs /sys/firmware/efi/efivars
    mount --bind /sys/firmware/efi/efivars /mnt/sys/firmware/efi/efivars

    sudo chroot /mnt
    grub-install /dev/sdX
    update-grub

    ```



#### Virtualization, QEMU/KVM

- Enable 3d-acceleration in Linux Guests
    - https://www.spice-space.org/spice-user-manual.html#virgl
    - [Running VMs with VirtIO 3D Acceleration](https://ryan.himmelwright.net/post/virtio-3d-vms/)

- Steps to restore Win7
    - copy disk image ```win7``` to some folder. (let ```/home/hritwik/boxes/```)
    - install boxes and virt manager with all dependencies (do not run any of them as root)
    - start virt manager, ```Edit -> pref -> enabre Xml editing```
    - ```File -> new Virtual machine -> import existing disk image```
    - add the folder and select the disk image, enter OS name, and move till end.
    - **Select ```customize configuration before install``` and then click finish**
    - Here copy the xml contents to the xml tab.
    - start from boxes


- [Install Win10 VM](https://getlabsdone.com/install-windows-10-on-ubuntu-kvm/)

- gnome-boxes (DONT installl via flathub)
    - [Guide](https://ostechnix.com/manage-remote-and-virtual-machines-with-gnome-boxes/)
    - [Cant copy big files to VM fix](https://gitlab.gnome.org/GNOME/gnome-boxes/-/issues/353)

OR

- virt-manager (run as sudo)
    - [Link1](https://www.tecmint.com/install-kvm-on-ubuntu/)
    - [Link2](https://linuxize.com/post/how-to-install-kvm-on-ubuntu-20-04/)

    ```
    egrep -c '(vmx|svm)' /proc/cpuinfo
    sudo apt install cpu-checker
    sudo kvm-ok
    sudo apt install -y qemu qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager
    sudo systemctl enable --now libvirtd

    sudo usermod -a -G libvirt hritwik
    sudo usermod -a -G kvm hritwik
    ```

- [Move gnome boxes to another PC](https://www.debugpoint.com/2020/06/move-virtual-machine-image-another-host/)
    ```
    - GNOME Boxes keeps the physical image of the virtual machine (this is usually in the size of GB) in the below path. For each of your virtual machines, you will find an image there.
    Copy the image file to your new host’s path: ~/.local/share/gnome-boxes/images/
    ~/.local/share/gnome-boxes/images/

    - Copy the libvirt configuration XML from the below path to your new host’s same location.
    In the below path, you should be seeing separate xml files for each of your virtual machines. Copy the one you need.
    ~/.config/libvirt/qemu/

    - Open the below file in your current system.
    Copy the section (from “[display” … to end of this section) which belongs to your virtual machine. You can easily find it using the name (see below – ‘last seen name’).
    Open the same above file in the other host machine and append the copied content at the end. Save the file.
    ~/.config/gnome-boxes/sources/'QEMU Session'

    Close all applications including GNOME Boxes in the new host machine.
    ```

- [fix for: cannot run boxes without root](https://askbot.fedoraproject.org/en/question/45805/how-to-use-virt-manager-as-a-non-root-user/)
    - virt-manager --connect qemu:///session


- Path to gnome-boxes images for flatpak version:
    - "~/.var/app/org.gnome.Boxes/data/gnome-boxes/images"
    - https://gitlab.gnome.org/GNOME/gnome-boxes/-/issues/610
    - https://askubuntu.com/questions/1123697/where-are-image-files-for-gnome-boxes-stored
    - find ~ -size +1G -ls

- [Steps to migrate from Boxes rpm to Boxes Flatpak](https://gitlab.gnome.org/GNOME/gnome-boxes/-/issues/610)
    ```
    Move images from ~/.local/share/gnome-boxes/images to ~/.var/app/org.gnome.Boxes/data/gnome-boxes/images

    Move domain .xml files from ~/.config/libvirt/qemu/ to ~/.var/app/org.gnome.Boxes/config/libvirt/qemu/

    Modify domain .xml files to ensure paths are correct

    Ensure disk source path is correct, i.e. <source file='/home/user/.var/app/org.gnome.Boxes/data/gnome-boxes/images/disk-name'/>

    Ensure os-state is installed, and remove any referenced media
    Ensure network interfaces are set to user, not bridge.  Bridge mode is not supported in Flatpak at this time.
    If this line, if present. <seclabel type='dynamic' model='selinux' relabel='yes'/> It appears that selinux seclabel is also not supported in Flatpak, based on resulting error. Unable to start domain: unsupported configuration: Security driver model 'selinux' is not available

    Use the following command to help debug any further issues.  G_MESSAGS_DEBUG=all flatpak run org.gnome.Boxes
    ```


### Gaming


- [How To Setup Gaming on Manjaro](https://www.youtube.com/watch?v=w3yUVQ4QFGU)
- [How to set up Manjaro Linux and making it fit for gaming](https://www.youtube.com/watch?v=XPc-Ty3rtRE)
- [How To Set Up Manjaro For Gaming - GPU Drivers, Kernel, Steam Proton, Wine, Lutris - GUI Method](https://www.youtube.com/watch?v=01KCtHcB2D0)

- [Get 10% MORE FPS in Linux games with GAMEMODE!](https://www.youtube.com/watch?v=sZb1v4EM-2U)
- [The Ultimate Linux Gaming Guide](https://www.youtube.com/watch?v=xvrft9ULvho)
- [How To Set Up Debian, Ubuntu, Arch for Gaming Using Python - Wine, Lutris, Steam, GOverlay, MangoHUD](https://www.youtube.com/watch?v=NLW6n8MM3R8)
- [How to Install Games on Linux with WINE and DXVK Vulkan](https://www.youtube.com/watch?v=BefTUxsRiwY)


- https://leduccc.medium.com/simple-dgpu-passthrough-on-a-dell-precision-7450-ebe65b2e648e
    - for GPU passthrough (don't bother, it won't work on muxless) and also for QEMU on manjaro
- [another GPU passthrough Tut](https://heiko-sieger.info/running-windows-10-on-linux-using-kvm-with-vga-passthrough/)


- Prefer Pop!_Os and use 'gamemoderun' prefix for running games on Ubuntu.
- Bleeding edge = oibaf/graphics-drivers, Latest point release = kisak/kisak-mesa. [Source](https://itsfoss.com/install-mesa-ubuntu/)
- for 20.04 [video](https://www.youtube.com/watch?v=DToZ9wU2qRk), [reddit](https://www.reddit.com/r/linux4noobs/comments/g7753y/how_to_set_up_ubuntu_2004_for_gaming_tutorial/)
- [Wiki](https://www.reddit.com/r/linux_gaming/wiki/starting_guide)

- [Latest AMDGPU](https://linuxconfig.org/amd-radeon-ubuntu-20-04-driver-installation) (uses ppa:oibaf/graphics-drivers)
    ```
    sudo add-apt-repository ppa:oibaf/graphics-drivers
    sudo apt update && sudo apt -y upgrade
    ```

- [latest mesa](https://itsfoss.com/install-mesa-ubuntu/)
    ```
    sudo add-apt-repository ppa:kisak/kisak-mesa
    sudo apt update
    sudo apt install mesa
    ```
- [install latest mesa vulkan](https://github.com/lutris/docs/blob/master/InstallingDrivers.md)
    ```
    sudo add-apt-repository ppa:kisak/kisak-mesa    
    sudo dpkg --add-architecture i386
    sudo apt update && sudo apt upgrade
    sudo apt install libgl1-mesa-dri:i386
    sudo apt install mesa-vulkan-drivers mesa-vulkan-drivers:i386
    ```

- OR see guide for mesa [vulkan](https://linuxconfig.org/install-and-test-vulkan-on-linux)
    ```
    sudo add-apt-repository ppa:oibaf/graphics-drivers
    sudo apt update
    sudo apt upgrade
    sudo apt install libvulkan1 mesa-vulkan-drivers vulkan-utils
    ```
- OR use [AMDVLK](https://github.com/GPUOpen-Drivers/AMDVLK/releases)
- [Wine staging branch](https://wiki.winehq.org/Ubuntu)
- [Lutris](https://lutris.net/downloads/)
- [DXVK](https://linuxconfig.org/improve-your-wine-gaming-on-linux-with-dxvk)



---


