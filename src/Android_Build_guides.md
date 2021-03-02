## List of:

### Custom Roms

- /e/
- AEX (AOSP Extended)
- AICP
- AOSiP
- AOSP
- AncientOS
- Arrow
- Awaken
- Bootleggers
- Bliss ROM
- Carbon ROM
- Cesium
- ColtOS
- Corvus
- CrDroid
- Derpfest
- Descendent
- Dirty Unicorn ROM
- DotOS
- EvolutionX 			- Gapps 
- Extended UI
- Floko
- Havoc
- ION ROM
- LOS
- MSMXtended
- NitrogenOS
- Octavi
- Omni Rom
- PalladiumOS
- Paranoid Android
- PE 					- Gapps
- PE+ 					- Gapps
- PixelPlusUI
- PixyOS
- POSP
- Project Sakura
- RevengeOS
- RR
- ShapeshiftOS
- StagOS
- Styx Project
- SuperiorOS
- ZenX


### Kernels

-
- EXTENDED KERNEL
- InsigniuX Kernel
- Panda Kernel
- RAD Kernel


### Custom Recoveries


- 
- OrangeFox Recovery
- Pitch Black Recovery
- SkyHawk Recovery
- TWRP




---


## Things to check after booting ROM








--- 







## steps i followed to build ROM on Manjaro

```
sudo pacman -S yay android-tools android-udev
sudo usermod -a -G adbusers $USER
newgrp adbusers

# This will setup repo in /usr/bin
git clone https://github.com/akhilnarang/scripts.git
./scripts/setup/android_build_env.sh

sudo pacman -S base-devel multilib-devel gcc repo git gnupg gperf sdl wxgtk2 squashfs-tools curl ncurses zlib schedtool perl-switch zip unzip libxslt bc rsync ccache lib32-zlib lib32-ncurses lib32-readline --noconfirm --needed

sudo yay -S flex bison cpio clang ncurses5-compat-libs lib32-ncurses5-compat-libs xxd-standalone --noconfirm --needed
sudo yay -S lineageos-devel aosp-devel maven gradle --noconfirm --needed

ccache -M 50G

mkdir aex && cd aex
repo init --depth=1 -u git://github.com/AospExtended/manifest.git -b 11.x
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

# put below lines in zshrc
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
export CCACHE_DIR=/ramdisk/ccache

# to reload zsh
source ~/.zshrc


git clone "https://github.com/dev-harsh1998/android_device_realme_x2.git" -b lineage-18.0 device/realme/X2
git clone "https://github.com/dev-harsh1998/android_kernel_realme_sm6150.git" -b lineage-17.1 kernel/realme/sm6150 
git clone "https://github.com/dev-harsh1998/android_vendor_realme_X2.git" -b lineage-18.0 vendor/realme/X2

source build/envsetup.sh
lunch aosp_X2-userdebug
m aex -j$(nproc --all) | tee log.txt

```


- rename in
	- the two locations shown in video. make sure to rename to "aosp_X2.mk" and not "aosp.mk"
	- AndroidProducts.mk,
	- Rename lineage to AOSP in device.mk biometric permissions OR Remove "Lineage Specific perms"
- delete
	- "hal_lineage_trust_default.te" from "aex/device/realme/X2/sepolicy/private"




---


## Todo

- see this, most of this is FA 
	- https://github.com/akhilnarang/scripts.git

- insatll yay through pacman, then use yay

- https://www.reddit.com/r/ManjaroLinux/comments/cbkblb/guide_run_android_apps_on_manjaro_super_simple/
	- install android apps on manjaro


```
From Xda (https://forum.xda-developers.com/t/guide-2018-all-you-need-to-know-to-build-android-from-scratch.3862893/)
repo sync -c -f --force-sync --no-tag --no-clone-bundle -j$(nproc --all) --optimized-fetch --prune


repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
```


---



## Guides

- [where to start from](https://www.youtube.com/watch?v=yNVe3mjCI1k)

- https://scorpionrom.com/building-scorpionrom-with-manjaro-linux/
- https://wiki.archlinux.org/index.php/android#Building

- https://wiki.lineageos.org/devices/bacon/build
- https://forum.xda-developers.com/t/guide-2018-all-you-need-to-know-to-build-android-from-scratch.3862893/
- https://www.youtube.com/watch?v=So6ctQbxZO8&t=7s


- https://forum.xda-developers.com/t/guide-linux-manjaro-arch-how-to-set-up-android-build-environment.3300596/
	- This is for reference only
		```


			# To install ncurses5-compat-libs you need
			# to enter this key in your terminal first.
			$ gpg --keyserver pgp.mit.edu --recv-keys C52048C0C0748FEE227D47A2702353E0F7E48EDB
			$ yay -S ncurses5-compat-libs

			# Before installing lib32-ncurses5-compat-libs I had to
			# uninstall these packages due to conflicts and dependencies.
			# this might or might not be necessary for you. If you are unable to
			# install lib32-ncureses5-compat-libs because it conflicts with other
			# installed packages, this should fix the problem.
			$ sudo pacman -R lib32-ncurses lib32-libxml2 lib32-gconf lib32-libcroco lib32-libsoup lib32-llvm-libs lib32-readline lib32-js17 lib32-librsvg lib32-mesa lib32-rest lib32-cairo lib32-glew1.10 lib32-gtk3 lib32-polkit lib32-colord lib32-gtk2 lib32-pango lib32-libdbusmenu-gtk2 lib32-libindicator-gtk2 lib32-libappindicator-gtk2

			# Install more necessary packages.
			$ yay -S lib32-ncurses5-compat-libs lib32-readline pngcrush pngquant

			# Install java 7 and set it as default
			$ yay -S jdk7-openjdk
			$ sudo archlinux-java set java-7-openjdk
			# Check java version.
			$ java -version
			# Output should look something like this.
			# java version "1.7.0_91"
			# OpenJDK Runtime Environment (IcedTea 2.6.3)
			# (Arch Linux build 7.u91_2.6.3-3-x86_64)
			# OpenJDK 64-Bit Server VM (build 24.91-b01, mixed mode)

			# Install java 8 and set it as default
			$ yay -S jdk8-openjdk
			$ sudo  archlinux-java set java-8-openjdk
			$ java -version
			# Output should look something like this.
			# openjdk version "1.8.0_112"
			# OpenJDK Runtime Environment (build 1.8.0_112-b15)
			# OpenJDK 64-Bit Server VM (build 25.112-b15, mixed mode)

		```
