# Common Things for all Linux Distros


## Apps & Extensions

### Apps

- There are many distro specific apps that are not known
    - Linux Mint
        - Warpinator, AirDrop for Linux
        - Web apps creater

    - Elementary OS
        - Find some [here](https://github.com/kleinrein/awesome-elementaryos), [here](https://www.fossmint.com/best-elementary-os-applications/), [here](https://appcenter.elementary.io/)
        - appImageLauncher, for managing appImages.
        - [eddy](https://github.com/donadigo/eddy), for installing deb files.

    - Manjaro
        -

- [Deskreen. This is a desktop app that makes any device with a web browser a second screen for your computer](https://www.reddit.com/r/electronjs/comments/kzuf10/i_created_deskreen_this_is_a_desktop_app_that/)


- Audio Tagger
    - https://www.ubuntupit.com/top-15-best-music-tag-editor-software-for-linux-system/
    - [Kid3 audio tagger](https://kid3.kde.org/)


- Bulk rename linux (GPrename)
    - https://www.fossmint.com/krename-batch-file-renamer-for-linux/
    - https://linuxhint.com/rename_files_linux/
    - https://askubuntu.com/questions/511862/an-ubuntu-linux-alternative-of-bulk-rename-utility-for-windows
    - https://askubuntu.com/questions/1217683/rename-multiple-files-at-the-same-time

- Clipboard Managers
    - [copyq](https://github.com/hluk/CopyQ/releases)

- IDE
    - Jetbrains
    - Atom
    - codium
    - VSCode

- Markdown Editors
    - https://github.com/marktext/marktext
    - https://github.com/wereturtle/ghostwriter
    - https://www.qownnotes.org/
    - https://boostnote.io/


- Metadata Viewer
    - https://libre-software.net/edit-metadata-exiftool/
    - https://ostechnix.com/display-media-files-information-on-linux-using-mediainfo/
    - [Exiftool](https://libre-software.net/edit-metadata-exiftool/)


- Music Players
    - Elisa music player

- SS tools
    - [Normal SS in Linux](https://itsfoss.com/take-screenshot-linux/)
    - [Ksnip](https://www.linuxuprising.com/2020/12/cross-platform-screenshot-tool-ksnip.html)
    - [Flameshot](https://itsfoss.com/flameshot/)


### Extensions
- [multi-monitors-add-on](https://extensions.gnome.org/extension/921/multi-monitors-add-on/)


## Guides

#### 1) Steps to restore Win7

- copy disk image ```win7``` to some folder. (let ```/home/hritwik/boxes/```)
- install boxes and virt manager with all dependencies
- start virt manager, ```Edit -> pref -> enabre Xml editing```
- ```File -> new Virtual machine -> import existing disk image```
- add the folder and select the disk image, enter OS name, and move till end.
- **Select ```customize configuration before install``` and then click finish**
- Here copy the xml contents to the xml tab.
- start from boxes


### 2) Gaming

- https://leduccc.medium.com/simple-dgpu-passthrough-on-a-dell-precision-7450-ebe65b2e648e
    - for GPU passthrough (don't bother, it won't work on muxless) and also for QEMU on manjaro
- [another GPU passthrough Tut](https://heiko-sieger.info/running-windows-10-on-linux-using-kvm-with-vga-passthrough/)

- [How To Setup Gaming on Manjaro](https://www.youtube.com/watch?v=w3yUVQ4QFGU)
- [How to set up Manjaro Linux and making it fit for gaming](https://www.youtube.com/watch?v=XPc-Ty3rtRE)
- [How To Set Up Manjaro For Gaming - GPU Drivers, Kernel, Steam Proton, Wine, Lutris - GUI Method](https://www.youtube.com/watch?v=01KCtHcB2D0)

- [Get 10% MORE FPS in Linux games with GAMEMODE!](https://www.youtube.com/watch?v=sZb1v4EM-2U)
- [The Ultimate Linux Gaming Guide](https://www.youtube.com/watch?v=xvrft9ULvho)
- [How To Set Up Debian, Ubuntu, Arch for Gaming Using Python - Wine, Lutris, Steam, GOverlay, MangoHUD](https://www.youtube.com/watch?v=NLW6n8MM3R8)
- [How to Install Games on Linux with WINE and DXVK Vulkan](https://www.youtube.com/watch?v=BefTUxsRiwY)




#### 3) Other

- [Linux Wifi Hotspot](https://github.com/lakinduakash/linux-wifi-hotspot)
- [login with USB on liunx](https://www.linuxuprising.com/2021/02/how-to-login-with-usb-flash-drive.html)
- [change mac](https://linuxconfig.org/change-mac-address-with-macchanger-linux-command)
	- and as always, [THE GREAT ARCH WIKI](https://wiki.archlinux.org/index.php/MAC_address_spoofing#Automatically) to change mac auto on every boot.
	- [another guide, not complete](https://itsfoss.com/change-mac-address-linux/)
- [autostart](https://www.linuxuprising.com/2020/11/how-to-launch-startup-applications-with.html)
- [Swap file](https://www.youtube.com/watch?v=0mgefj9ibRE)

- [download-latest-version-from-github](https://smarterco.de/download-latest-version-from-github-with-curl/)

        DOWNLOAD_URL=$(curl -s https://api.github.com/repos/felixb/swamp/releases/latest \
        | grep browser_download_url \
        | grep swamp_amd64 \
        | cut -d '"' -f 4)
        curl -s -L --create-dirs -o ~/downloadDir "$DOWNLOAD_URL"
	Note: Replace the repository URL and grep "swamp_amd64" with the file you need (grep "YOUR_FILE").

- [dconf guide](https://askubuntu.com/questions/424621/which-files-does-gconf-editor-edit)


---
- [youtube-dl Gui](https://itsfoss.com/youtube-dl-gui-apps/)
- [ffmpeg gui: mystiq](https://www.linuxuprising.com/2020/03/mystiq-is-easy-to-use-ffmpeg-gui.html)

- https://linuxhint.com/add_shortcuts_ubuntu_desktop/

- https://www.linuxuprising.com/2020/10/schedule-commands-and-scripts-in-linux.html
- https://www.linuxuprising.com/2020/01/bandwhich-shows-whats-taking-up-your.html
- https://www.linuxuprising.com/2020/05/how-to-encrypt-cloud-storage-files-with.html
- https://www.linuxuprising.com/2020/04/cryptomator-150-released-with.html
- https://medium.com/swlh/backing-up-with-borg-c6f13d74dd6


- https://www.linuxuprising.com/2020/07/ubuntu-how-to-free-up-port-53-used-by.html
    - https://askubuntu.com/questions/973017/wrong-nameserver-set-by-resolvconf-and-networkmanager

- https://www.linuxuprising.com/2020/02/tlp-13-linux-laptop-battery-extender.html





--- XXX ---
