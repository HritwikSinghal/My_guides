# Steps Manjaro


# **Table of Contents**
- Todo
- Install Apps
- Saved


--- 


## Todo


- [MAYBE switch to fish shell (Read comments)](https://forum.manjaro.org/t/is-it-time-to-switch-the-default-shell-from-bash-to-fish/28745)

- [Enable Os-prober](https://forum.manjaro.org/t/stable-update-2021-03-08-kernels-plasma-5-21-2-haskell-kodi-grub-kde-dev/56877)

- for pulseeffects
	- pamac install manjaro-pipewire
	- pamac install gst-plugin-pipewire
- https://www.reddit.com/r/ManjaroLinux/comments/cbkblb/guide_run_android_apps_on_manjaro_super_simple/
	- install android apps on manjaro

- [Enable vscode marketplace in Codium](https://github.com/VSCodium/vscodium/blob/master/DOCS.md#migrating) and backup codium backup

- Add adb for android
	- https://wiki.archlinux.org/index.php/Android_Debug_Bridge#Detect_the_device
	- sudo pacman -S android-tools android-udev --no-confirm
	- sudo usermod -a -G adbusers hritwik
	- newgrp adbusers

- [create swap partiton](https://wiki.manjaro.org/index.php/Swap)

- enable hibernate (use Arch wiki)
	- https://wiki.archlinux.org/index.php/Power_management/Suspend_and_hibernate#Hibernation
	- https://wiki.archlinux.org/index.php/Mkinitcpio#Image_creation_and_activation
	
	- https://confluence.jaytaala.com/display/TKB/Use+a+swap+file+and+enable+hibernation+on+Arch+Linux+-+including+on+a+LUKS+root+partition
	- https://archived.forum.manjaro.org/t/installed-hibernator-but-nothing-happened-how-to-enable-hibernate/154361/9
	
	- https://forum.manjaro.org/t/howto-disable-turn-off-hibernate-completely/8033
	
	- add hibernate shortcut or install gnome extension

- disable quiet boot so that when press 'del' key on boot it shows info
- change f8 key to lock (Done when changing keyboard layout)
	- Update: this is fixed when replacing keyboard layout
	
- If terminal wont open after changing language to EN-IN
	- https://forum.manjaro.org/t/gnome-terminal-wont-open-after-update/52808

- enable snap, flatpak, AUR support via terminal
- add keyboard shortcut for terminal, system-monitor
- change "alternate characters Key" from "Right Alt" to "Right Super" (go to keyboard shortcuts settings)
- [Install Ruby gems system-wide](https://wiki.archlinux.org/index.php/ruby#Installing_Ruby)

- [x] [Making alt+tab show windows instead of applications in Gnome](https://bbs.archlinux.org/viewtopic.php?id=228893)
- [x] [Fix auto bakups timeshift](https://forum.manjaro.org/t/back-in-time-crono-jobs-are-not-excuted/45892)



## Install Apps

- Disrtotube channel 
- chaotic aur 
- [AUR helper like yay](https://itsfoss.com/best-aur-helpers/)
	- [Paru](https://itsfoss.com/paru-aur-helper/)
- https://itsfoss.com/pacman-command/



## Saved

- https://www.ubuntupit.com/top-15-best-music-tag-editor-software-for-linux-system/
	- if insatlling ```kid3``` in Arch, also insatll ```kio```

- install ```aur/vscodium-bin-marketplace``` to Enable vscode marketplace in vscodium-bin
