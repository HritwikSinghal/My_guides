# Common Things for all Linux Distros

**Table of Contents**
    - Saved
    - Apps, Extensions, Themes
        - Apps
        - Extensions
        - Themes, Icons, Fonts
    - Guides
        - Virtualization, QEMU/KVM
        - Gaming


## Saved

* This is for displaying fps counter on wine games.
    * DRI_PRIME=1 GALLIUM_HUD=fps wine game.exe

- [restart-network-ubuntu](https://itsfoss.com/restart-network-ubuntu)
    - use nmcli commands:
        - sudo nmcli networking off
        - sudo nmcli networking on

* DNS lookup
    * nmcli dev show | grep DNS
    * nslookup website_name
    * cat /etc/resolv.conf
    * just check in wifi settings



- [change mac](https://linuxconfig.org/change-mac-address-with-macchanger-linux-command)
    - and as always, [THE GREAT ARCH WIKI](https://wiki.archlinux.org/index.php/MAC_address_spoofing#Automatically) to change mac auto on every boot.
    - [another guide, not complete](https://itsfoss.com/change-mac-address-linux/)
- [Swap file](https://www.youtube.com/watch?v=0mgefj9ibRE)

- [download-latest-version-from-github](https://smarterco.de/download-latest-version-from-github-with-curl/)

        DOWNLOAD_URL=$(curl -s https://api.github.com/repos/felixb/swamp/releases/latest \
        | grep browser_download_url \
        | grep swamp_amd64 \
        | cut -d '"' -f 4)
        curl -s -L --create-dirs -o ~/downloadDir "$DOWNLOAD_URL"
    Note: Replace the repository URL and grep "swamp_amd64" with the file you need (grep "YOUR_FILE").

- [dconf guide](https://askubuntu.com/questions/424621/which-files-does-gconf-editor-edit)

- Setup guide
    - [Reddit, take extension install from comments](https://www.reddit.com/r/Ubuntu/comments/jbhur4/goodbye_whatever_it_is_hello_ubuntu_2010_beta/)
    - [github, for great selection of apps and other things. This is great](https://github.com/themagicalmammal/howtopopbuntu)


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

#### 1) Virtualization, QEMU/KVM

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


### 2) Gaming


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




--- XXX ---
