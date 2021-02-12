# Steps Manjaro


### Misc

- enable snap, flatpak, AUR suppotr via terminal
- [x] add "alias ll='ls -al'"
- add keyboard shortcut for terminal
- change "alternate characters Key" from "Right Alt" to "Right Super" (go to keyboard shortcuts settings)
- [x] [Making alt+tab show windows instead of applications in Gnome](https://bbs.archlinux.org/viewtopic.php?id=228893)
- [Install Ruby gems system-wide](https://wiki.archlinux.org/index.php/ruby#Installing_Ruby)
- [x] [Fix auto bakups timeshift](https://forum.manjaro.org/t/back-in-time-cron-jobs-are-not-excuted/45892)

### Install Apps

- [AUR helper like yay](https://itsfoss.com/best-aur-helpers/)
- https://www.playonlinux.com/en/
- https://itsfoss.com/pacman-command/
- [sudo systemctl enable fstrim.timer](https://itsfoss.com/things-to-do-after-installing-manjaro/)


- language tools (install for ff and libreoffice also)
	- sudo pacman -S libmythes mythes-en languagetool aspell-en

- [x] Sublime
- [x] Nemo
	-  sudo pacman -S nemo-
		nemo-audio-tab                  nemo-python                   
		nemo-bulk-rename                nemo-qml-plugin-dbus          
		nemo-compare                    nemo-qml-plugin-notifications
		nemo-emblems                    nemo-qt-components            
		nemo-fileroller                 nemo-repairer                 
		nemo-image-converter            nemo-run-with-nvidia-prime-run
		nemo-media-columns              nemo-seahorse                 
		nemo-pastebin                   nemo-share                    
		nemo-pdf-tools                  nemo-terminal                 
		nemo-preview

- Clion & Pycharm


### QEMU
- https://wiki.archlinux.org/index.php/libvirt

- Steps to restore Win7
	- ```
		sudo pacman -S ebtables
		sudo systemctl restart libvirtd
	```
	- copy disk image ```win7``` to some folder. (let ```/home/hritwik/boxes/```)
	- install boxes and virt manager with all dependencies
	- start virt manager, ```Edit -> pref -> enabre Xml editing```
	- ```File -> new Virtual machine -> import existing disk image```
	- add the folder and select the disk image, enter OS name, and move till end.
	- **Select ```customize configuration before install``` and then click finish**
	- Here copy the xml contents to the xml tab.
	- start from boxes


### Gaming & Extra

- https://leduccc.medium.com/simple-dgpu-passthrough-on-a-dell-precision-7450-ebe65b2e648e
	- for GPU passthrough (don't bother, it won't work on muxless) and also for QEMU on manjaro
- [another GPU passthrough Tut](https://heiko-sieger.info/running-windows-10-on-linux-using-kvm-with-vga-passthrough/)

- https://www.youtube.com/watch?v=w3yUVQ4QFGU
- https://www.youtube.com/watch?v=XPc-Ty3rtRE
- https://www.youtube.com/watch?v=01KCtHcB2D0

- https://www.youtube.com/watch?v=sZb1v4EM-2U
- https://www.youtube.com/watch?v=xvrft9ULvho
- https://www.youtube.com/watch?v=NLW6n8MM3R8
- https://www.youtube.com/watch?v=BefTUxsRiwY

- [Linux Wifi Hotspot](https://github.com/lakinduakash/linux-wifi-hotspot)
- [login with USB on liunx](https://www.linuxuprising.com/2021/02/how-to-login-with-usb-flash-drive.html)
- [change mac](https://linuxconfig.org/change-mac-address-with-macchanger-linux-command)
	- and as always, [THE GREAT ARCH WIKI](https://wiki.archlinux.org/index.php/MAC_address_spoofing#Automatically) to change mac auto on every boot.
	- [another guide, not complete](https://itsfoss.com/change-mac-address-linux/)
- [autostart](https://www.linuxuprising.com/2020/11/how-to-launch-startup-applications-with.html)
- [Swap file](https://www.youtube.com/watch?v=0mgefj9ibRE)
- [nemo](https://www.lxle.net/forums/discussion/1396/how-to-get-extract-here-extract-to-and-compress-options-in-nemo-file-manager-context-menu/p1)
	- https://wiki.archlinux.org/index.php/Nemo#Tips_and_tricks
- use toolbox for jetbrains apps.

- https://www.ubuntupit.com/top-15-best-music-tag-editor-software-for-linux-system/
	- if insatlling ```kid3``` in Arch, also insatll ```kio```
- https://libre-software.net/edit-metadata-exiftool/
- https://ostechnix.com/display-media-files-information-on-linux-using-mediainfo/
