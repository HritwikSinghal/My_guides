# Manjaro Specific Things


# **Table of Contents**
- Todo
- Notes & Saved


--- 


## Todo


- Swap
	- [Swap file](https://www.youtube.com/watch?v=0mgefj9ibRE)
	- [increase Swap file by 6144 MB](https://askubuntu.com/questions/927854/how-do-i-increase-the-size-of-swapfile-without-removing-it-in-the-terminal)
	    - https://linuxhint.com/change_swap_size_ubuntu/
	- [create swap partiton](https://wiki.manjaro.org/index.php/Swap)



- [Enable OS-prober](https://forum.manjaro.org/t/stable-update-2021-03-08-kernels-plasma-5-21-2-haskell-kodi-grub-kde-dev/56877)
	- If you need dual-boot you can reactivate os-prober the easiest with the following command combination in a terminal
    	```sudo echo GRUB_DISABLE_OS_PROBER=false >> /etc/default/grub && sudo update-grub```

- If terminal wont open after changing language, add the language (EN-IN) again in manjaro setting manager.
	- https://forum.manjaro.org/t/gnome-terminal-wont-open-after-update/52808


- change f8 key to lock (Done when changing keyboard layout)
	- Update: this is fixed when replacing keyboard layout
	- also does not occur when chosing English india as lang.

- change "alternate characters Key" from "Right Alt" to "Right Super" (go to keyboard shortcuts settings)


- Increase terminal size to 100x30 and change its color and shortcuts

- Add shortcuts
    - Calc (F7)
    - System monitor (ctrl+shift+Esc 'gnome-system-monitor')
    - terminal (ctrl + alt + t)

- If vlc is not playing video, try https://bbs.archlinux.org/viewtopic.php?id=252113

- Install Just perfection Extension in gnome 40 to increase workspace size in overview


- some Qt tweaks to put in /etc/env
	QT_AUTO_SCREEN_SCALE_FACTOR=1
	QT_QPA_PLATFORMTHEME="gnome"
	QT_STYLE_OVERRIDE="kvantum"
	QT_QPA_PLATFORM=wayland



- In ```~/Templates```, there are various templates, add more

- Setup thunderbird (and backup it like FF)

- Firefox Setup (and desktop icons)
	- write script to install firefox nightly 

- enable snap, flatpak, AUR support in pamac (and maybe globally) via terminal

- for startup app fix see [this](https://forum.manjaro.org/t/solved-trouble-setting-up-a-startup-command/37323/15). This thread is also awesome, read whole convo.






- chaotic aur 
- [AUR helper like yay](https://itsfoss.com/best-aur-helpers/)
	- [Paru](https://itsfoss.com/paru-aur-helper/)
- https://itsfoss.com/pacman-command/
- https://openbuildservice.org/2021/02/18/introducing-flatpak-builds/


- [How to get extract here, extract to and compress options in Nemo file manager context menu](https://www.lxle.net/forums/discussion/1396/how-to-get-extract-here-extract-to-and-compress-options-in-nemo-file-manager-context-menu/p1)
    - https://wiki.archlinux.org/index.php/Nemo#Tips_and_tricks
- https://linuxhint.com/add_shortcuts_ubuntu_desktop/
- [Display media info in nemo](https://www.linuxuprising.com/2018/08/display-extensive-media-information-in.html)




## Notes & Saved



- disable quiet boot so that when press 'del' key on boot it shows info
-  to display advanced option in grub, and also disable quiet boot.
	- sudo nano /etc/default/grub
	- Comment "GRUB_TIMEOUT_STYLE=hidden"
	- remove quiet from "GRUB_CMDLINE_LINUX_DEFAULT="
	- sudo update-grub

- Fix gdm not starting on manjaro
	- [Fix on manjaro forum, see last post 19](https://forum.manjaro.org/t/login-screen-not-showing-on-startup/16847/19?u=hritwik)
	- [Similar issue on Arch forums](https://bbs.archlinux.org/viewtopic.php?id=257421)
	- [Fix on Arch wiki, first see above 2 points](https://wiki.archlinux.org/index.php/Kernel_mode_setting#Early_KMS_start)

	- In short do
	- sudo nano /etc/mkinitcpio.conf
	- Add the required module for the 'video driver' to the MODULES array: 
		- so add 'intel_agp i915 amdgpu' to MODULES
	- sudo mkinitcpio -P


- Enable hibernate (use Arch wiki)
	- Manjaro has hibernate option if i create swap partition > RAM
	
	OR
	
	- sudo pacman -S hibernator
	- sudo hibernator

	OR
	
	- https://wiki.archlinux.org/index.php/Power_management/Suspend_and_hibernate#Hibernation
	- https://wiki.archlinux.org/index.php/Mkinitcpio#Image_creation_and_activation
	
	- https://confluence.jaytaala.com/display/TKB/Use+a+swap+file+and+enable+hibernation+on+Arch+Linux+-+including+on+a+LUKS+root+partition
	- https://archived.forum.manjaro.org/t/installed-hibernator-but-nothing-happened-how-to-enable-hibernate/154361/9
	
	- https://forum.manjaro.org/t/howto-disable-turn-off-hibernate-completely/8033
	
	- add hibernate shortcut or install gnome extension or change power button behaviour in setting to hibernate
	
	OR
	
	- in "/etc/default/grub" in line "GRUB_CMDLINE_LINUX_DEFAULT" do 
	```
	The kernel parameter resume=swap_device must be used. Any of the persistent block device naming methods can be used as swap_device. For example:
    resume=UUID=4209c845-f495-4c43-8a03-5363dd433153
    resume="PARTLABEL=Swap partition"
    resume=/dev/archVolumeGroup/archLogicalVolume
    ```
    # basically add "resume=UUID=4209c845-f495-4c43-8a03-5363dd433153"
    # Then Configure the initramfs
    ```
    When an initramfs with the base hook is used, which is the default, the resume hook is required in /etc/mkinitcpio.conf. Whether by label or by UUID, the swap partition is referred to with a udev device node, so the resume hook must go after the udev hook. This example was made starting from the default hook configuration:
    HOOKS=(base udev autodetect keyboard modconf block filesystems resume fsck)
    Remember to regenerate the initramfs for these changes to take effect.
    ```
    Then regenerate the initramfs for these changes to take effect.
    https://wiki.archlinux.org/index.php/Mkinitcpio#Image_creation_and_activation
    do ```sudo mkinitcpio -P```



- Install Apps and shell and other configs from Disrtotube channel 
	- [MAYBE switch to fish shell (Read comments)](https://forum.manjaro.org/t/is-it-time-to-switch-the-default-shell-from-bash-to-fish/28745)
	- Shell/terminal/prompt
	    - Learn to modify zsh and fish shell (if installed)
	    - [starship](https://itsfoss.com/starship/)
	        - https://starship.rs/guide/#%F0%9F%9A%80-installation
	    - https://www.youtube.com/watch?v=TKX29fJ8U2Y (bash customize)

	    - [Customize prompt](https://itsfoss.com/customize-linux-terminal/)
	        - search it on internet, this is just basic.
	    - [bash - "Friendly" terminal color names in shell scripts? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/92563/friendly-terminal-color-names-in-shell-scripts)
	    - [Bash tips for everyday at the command line | Opensource.com](https://opensource.com/article/18/5/bash-tricks)
	    - https://itsfoss.com/linux-command-tricks/

	    - https://www.playonlinux.com/en/
	    - https://linuxjourney.com/lesson/filesystem-hierarchy
	    - How this works: ```nmcli dev show | grep DNS | awk '{ print $2 }'```
	    - [shell scripting](https://www.shellscript.sh/variables2.html)
	    - [Linux Tutorial for Beginners - Learn Linux and the Bash Command Line](https://ryanstutorials.net/linuxtutorial/)
	    - https://explainshell.com/


- [install android apps on manjaro](https://www.reddit.com/r/ManjaroLinux/comments/cbkblb/guide_run_android_apps_on_manjaro_super_simple/)

- [Enable vscode marketplace in Codium](https://github.com/VSCodium/vscodium/blob/master/DOCS.md#migrating) and backup codium backup
	- [x] install ```aur/vscodium-bin-marketplace``` to Enable vscode marketplace in vscodium-bin

- https://www.ubuntupit.com/top-15-best-music-tag-editor-software-for-linux-system/
	- if installing ```kid3``` in Arch, also insatll ```kio```


- [Make Persistent Live Manjaro USB](https://forum.manjaro.org/t/manjaro-xfce-20-0-3-persistent-usb-released/54/30)
	- 
	```sh
	git clone git@github.com:HritwikSinghal/alma.git
	cd alma
	git remote add phil https://github.com/philmmanjaro/alma.git
	git cherry-pick b2dc7e628aa64152864b4019f583cc6b89603576..5610aa03352a3343e77b63e4fe193fcfa1e09699
	# resolve any errors

	cargo build
	sudo ln -s '/home/hritwik/Documents/alma/target/debug/alma' /usr/local/bin

	# to install deps
	paru alma-git
	paru -R alma-git

	------------------------------------------

	sudo alma create --image 10GiB almatest.img
	sudo losetup -f ./almatest.img
	sudo losetup -j ./almatest.img
	sudo alma qemu /dev/loop7
	sudo losetup -d /dev/loop7

	sudo ALMA_USER=manjaro alma create --image 5GiB almaxfce.img --presets ./presets/user.toml ./presets/xorg.toml ./presets/xfce.toml
	# type password

	sudo losetup -f ./almaxfce.img
	sudo losetup -j ./almaxfce.img
	sudo alma qemu /dev/loop9
	sudo losetup -d /dev/loop9
	-------------------------------------------
	You can plug the flash drive in a PC and edit
	/etc/passwd
	change
	manjaro:x:1000:1000::/home/manjaro:/bin/bash
	to
	manjaro:x:0:0::/home/manjaro:/bin/bash
	so you are root now
	--------------------------------------------

	[Manjaro Tools: How to create your own Manjaro Spin](https://www.youtube.com/watch?v=B--je--m0VI)
	[Manjaro | Create a persistent USB-Stick easily](https://www.youtube.com/watch?v=jssqg7ax6YY)
	[Manjaro | Add XFCE to your persistent USB-Stick image](https://www.youtube.com/watch?v=NhVuqgrv2iw)
	https://wiki.manjaro.org/index.php/Install_Desktop_Environments#Gnome_3
	```



- [x] [ADB](https://wiki.archlinux.org/index.php/Android_Debug_Bridge#Detect_the_device)

- [x] [Install Ruby gems system-wide](https://wiki.archlinux.org/index.php/ruby#Installing_Ruby)

- [x] [Making alt+tab show windows instead of applications in Gnome](https://bbs.archlinux.org/viewtopic.php?id=228893)

- [x] [Fix auto backups timeshift](https://forum.manjaro.org/t/back-in-time-crono-jobs-are-not-excuted/45892)


- [x] for pulseeffects
	- pamac install manjaro-pipewire
	- pamac install gst-plugin-pipewire