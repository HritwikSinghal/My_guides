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


- If terminal wont open after changing language, add the language (EN-IN) again in manjaro setting manager.
	- https://forum.manjaro.org/t/gnome-terminal-wont-open-after-update/52808


- change f8 key to lock (Done when changing keyboard layout)
	- Update: this is fixed when replacing keyboard layout
	- also does not occur when chosing English india as lang.

- change "alternate characters Key" from "Right Alt" to "Right Super" (go to keyboard shortcuts settings)


- Add shortcuts
    - Calc (F7)
    - System monitor (ctrl+shift+Esc 'gnome-system-monitor')
    - terminal (ctrl + alt + t) and (super + enter)
    - close to 'super + c'
    - move windows with super m
    - resize windows with super r

- If vlc is not playing video, try https://bbs.archlinux.org/viewtopic.php?id=252113

- install on guest in gnome-boxes (arch based guest)
    - spice-vdagent xf86-video-qxl




- In ```~/Templates```, there are various templates, add more

- enable snap, flatpak, AUR support in pamac (and maybe globally) via terminal

- for startup app fix see [this](https://forum.manjaro.org/t/solved-trouble-setting-up-a-startup-command/37323/15).
    This thread is also awesome, read whole convo.

- for snap apps fix
    - Dont use them
	-
    ```
        sudo rm /var/cache/fontconfig/*
        rm ~/.cache/fontconfig/*
    ```


- https://openbuildservice.org/

- https://wiki.archlinux.org/index.php/Nemo#Tips_and_tricks
	- [How to get extract here, extract to and compress options in Nemo file manager context menu](https://www.lxle.net/forums/discussion/1396/how-to-get-extract-here-extract-to-and-compress-options-in-nemo-file-manager-context-menu/p1)
- https://linuxhint.com/add_shortcuts_ubuntu_desktop/
- [Display media info in nemo](https://www.linuxuprising.com/2018/08/display-extensive-media-information-in.html)




## Notes & Saved

- Build manjaro ISO (use git version of 'manjaro-tools-iso') 
    - https://wiki.manjaro.org/index.php/Build_Manjaro_ISOs_with_buildiso#Prerequisites
    - https://gitlab.manjaro.org/tools/development-tools/manjaro-tools
    - https://forum.manjaro.org/t/how-create-iso-from-current-manjaro-installation/26219/5
    - google search for 'build own manjaro iso'


- disable quiet boot so that when press 'del' key on boot it shows info (its shown by systemd)
-  to display advanced option in grub, and also disable quiet boot.
	- sudo nano /etc/default/grub
	- Comment "GRUB_TIMEOUT_STYLE=hidden"
	- remove quiet from "GRUB_CMDLINE_LINUX_DEFAULT="
	- sudo update-grub

- Fix gdm not starting on manjaro
	- [Fix on manjaro forum, see last post 19](https://forum.manjaro.org/t/login-screen-not-showing-on-startup/16847/19?u=hritwik)
	- [Similar issue on Arch forums](https://bbs.archlinux.org/viewtopic.php?id=257421)
	- [Fix on Arch wiki, first see above 2 points](https://wiki.archlinux.org/index.php/Kernel_mode_setting#Early_KMS_start)

	- In short
        	-  edit ``` /etc/mkinitcpio.conf ``` 
        	- Add the required module for the 'video driver' to the MODULES array: 
        		- so add 'intel_agp i915 amdgpu' to MODULES
        	- ``` sudo mkinitcpio -P ```


- Enable hibernate (use Arch wiki)
    - [howto-enable-and-configure-hibernation-with-btrfs](https://forum.manjaro.org/t/howto-enable-and-configure-hibernation-with-btrfs/51253)
        - see comments
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
	- in "/etc/default/grub" in line "GRUB_CMDLINE_LINUX_DEFAULT" add The kernel parameter resume=swap_device.
	Any of the persistent block device naming methods can be used as swap_device. For example:
        ```
        resume=UUID=4209c845-f495-4c43-8a03-5363dd433153
        resume="PARTLABEL=Swap partition"
        resume=/dev/archVolumeGroup/archLogicalVolume
        ```

    basically add "resume=UUID=4209c845-f495-4c43-8a03-5363dd433153"
    Then Configure the initramfs

    ```
    When an initramfs with the base hook is used, which is the default, the resume hook is required in /etc/mkinitcpio.conf. Whether by label or by UUID, the swap partition is referred to with a udev device node, so the resume hook must go after the udev hook. This example was made starting from the default hook configuration:
    HOOKS=(base udev autodetect keyboard modconf block filesystems resume fsck)
    Remember to regenerate the initramfs for these changes to take effect.
    ```

    [Then regenerate the initramfs for these changes to take effect](https://wiki.archlinux.org/index.php/Mkinitcpio#Image_creation_and_activation)
    - do ```sudo mkinitcpio -P```



- Install Apps and shell and other configs from Disrtotube channel 
	- Dotfiles
	    - https://github.com/iberianpig/dotfiles
	    - https://github.com/search?q=dotfiles
	    - DT dotfiles on gitlab
	    - https://github.com/webpro/awesome-dotfiles

	- PROMPTS
		- [Install powerlevel10k prompt](https://github.com/romkatv/powerlevel10k)
			- [Fix '[ERROR] p10k configure: cannot create /usr/share/zsh/p10k.zsh because /usr/share/zsh is readonly' on manjaro](https://forum.manjaro.org/t/customize-manjaro-zsh-config/46156/9)
		- [starship prompt](https://itsfoss.com/starship/)
	        - https://starship.rs/guide/#%F0%9F%9A%80-installation
            - https://www.youtube.com/watch?v=LDLisRPAC_g
	    - [Customize prompt](https://itsfoss.com/customize-linux-terminal/)
	        - search it on internet, this is just basic.
	            
	- SHELL
		- [MAYBE switch to fish shell (Read comments)](https://forum.manjaro.org/t/is-it-time-to-switch-the-default-shell-from-bash-to-fish/28745)
		- Oh-my-zsh
			- zsh-autosuggestions
			- zsh-sytax-highlighting
			- zsh-autocorrections
			- change theme to powerlevel10k

	- TUTS
	    - [bash - "Friendly" terminal color names in shell scripts? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/92563/friendly-terminal-color-names-in-shell-scripts)
	    - [Bash tips for everyday at the command line | Opensource.com](https://opensource.com/article/18/5/bash-tricks)
	    - https://itsfoss.com/linux-command-tricks/
	    - https://www.playonlinux.com/en/
	    - https://linuxjourney.com/lesson/filesystem-hierarchy
	    - [shell scripting](https://www.shellscript.sh/variables2.html)
	    - https://ryanstutorials.net/linuxtutorial/
	    - https://explainshell.com/
	    - "cut" and "tr", fd, find, awk



- [KDE tag editor](https://www.ubuntupit.com/top-15-best-music-tag-editor-software-for-linux-system/)
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


- [x] [Making alt+tab show windows instead of applications in Gnome](https://bbs.archlinux.org/viewtopic.php?id=228893)
