# Things for Android Rom Building


# Table of Contents
- Todo & notes & Errors
	- Todo
	- Notes & Saved
	- Errors

- Setup
	- Manjaro
	- Ubuntu

- Sripts for Roms
	- Current
		- AICP
		- RR
	- Stale
		- AEX
		- CrDroid
		- Havoc
		- LOS
		
- Guides
- List of:
	- Custom Roms
	- Kernels
	- Custom Recoveries
- Things to check after booting ROM




--- 





## Todo & notes & Errors


### Todo

- Try to use ubuntu in Docker for build

- Use prebuilt Kernel

- see this, most of this is FA 
	- https://github.com/akhilnarang/scripts.git

- **For Cleaning**
	- only run ```mka clobber```
	- Unless you have space issues, you don't need to clean anything. If the need to do that arises, you can run ```mka clean```, ```mka clobber``` or just remove the ```out``` directory in the source tree
	- [Breakfast-Brunch-Lunch](http://www.trcompu.com/MySmartPhone/AndroidKitchen/Breakfast-Brunch-Lunch.html)

### Notes & Saved

- [build LineageOS with Nix using robotnix](https://www.reddit.com/r/LineageOS/comments/igg7mc/you_can_now_build_lineageos_with_nix_using/)
    - See LOS reddit wiki for more

- [Tmux](https://askubuntu.com/questions/8653/how-to-keep-processes-running-after-ending-ssh-session)

- [passwordless-ssh-login](https://linuxize.com/post/how-to-setup-passwordless-ssh-login/)

- To copy a file from B to A while logged into A via ssh:
	- 
	```sh
	scp username@b:/path/to/file /path/to/destination
	scp root@198.13.32.138:~/.profile ~/Videos
	```

- [transfer-files-with-rsync](https://linuxize.com/post/how-to-transfer-files-with-rsync-over-ssh/)
 	- Remote to Local: rsync [OPTION]... -e ssh [USER@]HOST:SRC... [DEST]
 	- Where SRC is the source directory, DEST is the destination directory 
 	- USER is the remote SSH username and HOST is the remote SSH host or IP Address
 	- To transfer data from a **remote to a local machine**, use the remote location as the source and the local location as destination:
 	- ```rsync -a root@198.13.32.138:/foo/bar/file.zip ~/Videos```


- Edit in (see others commits)
	- AndroidProducts.mk
	- lineage_X2.mk 
		- and this file name also
	- overlays also

- rename in
	- the two locations shown in video. make sure to rename to "aosp_X2.mk" and not "aosp.mk"
	- AndroidProducts.mk
	- Rename lineage to AOSP in device.mk biometric permissions OR Remove "Lineage Specific perms"


- delete
	- "hal_lineage_trust_default.te" from "./device/realme/X2/sepolicy/private"


- Imp commits
	- Debugging Q during boot
		- https://github.com/aoleary/device_lge_g4-common/commit/073490b8a5056d5d59c2bea04d6648f423db3a35

	- If no FOD in LOS based roms, add fod 1.0 commits from RR manifest

	- If rom bootloops into fastboot, apply this to **SOURCE**. This is about selinux
		- https://github.com/CannedOS/external_selinux/commit/db56d38c06ca4514304eec771a14558b867ab2ff
	- fix aac decoding on A11 roms with A10 vendor
		- https://github.com/phhusson/platform_frameworks_av/commit/624cfc90b8bedb024f289772960f3cd7072fa940

	- Prox A11
		- for prox use A11 KT
		- Dual Prox
			- dual proxy, add this in DT [RMX1921:overlay: enable AOSP dual proximity approach via overlay ](https://github.com/DerpFest-Devices/device_realme_RMX1921/commit/052e4ce3ef4fd1064a939b54404dae06d83a2d0c#)
			- dual proxy, revert this in kernel https://github.com/HritwikSinghal/android_kernel_realme_sm6150/commit/cf3ff1ae2759fa806fa3b50fa42119f20074c3e3

	- Wifi calling
		- maybe; revert this in vendor [X2: stopship telephony common jar for now ](https://github.com/HritwikSinghal/vendor_realme_X2/commit/b9a8253a6900485882be9b1f9b73aec06adb30e8) 
		- or add this https://github.com/AOSP-Realme-X2/platform_vendor_codeaurora_telephony



### Errors

- "Unrecognized check name".
	- We need to remove that line from "Makefile.lib" so for error like "FATAL ERROR: Unrecognized check name "avoid_unnecessary_addr_size"" we would remove "-Wno-avoid_unnecessary_addr_size" from "./kernel/realme/sm6150/scripts/Makefile.lib" line 283.

	- for "FATAL ERROR: Unrecognized check name "alias_paths"", remove "-Wno-alias-paths".

	- OR remove "-Wno-CHECK" alltogether. (if available)
	- Use grep for this as this may be anywhere

- if missing variable error in setting
	- https://github.com/CannedShroud/device_realme_X2/commit/fd8cdab4fa3a7cc8a58b86204c77883c54748e83

- If rom bootloops into fastboot, apply this to **SOURCE**
	- https://github.com/CannedOS/external_selinux/commit/db56d38c06ca4514304eec771a14558b867ab2ff

- if rom boots but is stuck at rom logo
	- to debug
		- https://github.com/kjanek/android_device_realme_x2/commit/8af4603704c803f18001b8a4e4bc01da672ccd6e

- ccache: error: Failed to create directory /media/hritwik/CR/.cache/ccache/tmp: Permission denied
	- Bcoz ccache dir should be "/run/media/...". If this does not solve then see below
	- https://stackoverflow.com/questions/61923015/ccache-fails-with-read-only

- lang.IllegalStateException: Signature|privileged permissions not in privapp-permissions whitelist
	- https://thealaskalinuxuser.wordpress.com/2019/08/29/e-zygote-java-lang-illegalstateexception-signatureprivileged-permissions-not-in-privapp-permissions-whitelist/
	OR
	- https://stackoverflow.com/questions/45653879/android-o-api-26-root-app-not-recognized-as-priviledged

- if ncurses lib not found error, try ```paru ncurses5-compat-libs```



--- 






## Setup


### Manjaro



```sh

sudo pacman -S base-devel yay android-tools android-udev
sudo usermod -a -G adbusers $USER
newgrp adbusers

# This will setup repo in /usr/bin 
git clone https://github.com/akhilnarang/scripts.git
chmod +x ./scripts/setup/android_build_env.sh ./scripts/setup/arch-manjaro.sh
./scripts/setup/android_build_env.sh
# ./scripts/setup/arch-manjaro.sh    # This is not required if you install all below 

sudo pacman -S base-devel multilib-devel gcc repo git gnupg gperf sdl wxgtk2 squashfs-tools curl ncurses zlib schedtool perl-switch zip unzip libxslt bc rsync ccache lib32-zlib lib32-ncurses lib32-readline --noconfirm --needed

sudo yay -S flex bison cpio clang ncurses5-compat-libs lib32-ncurses5-compat-libs xxd-standalone --noconfirm --needed
sudo yay -S lineageos-devel aosp-devel maven gradle xmlstarlet --noconfirm --needed

ccache -M 50G

# put below lines in zshrc
echo "export USE_CCACHE=1" >> ~/.zshrc
echo "export CCACHE_EXEC=/usr/bin/ccache" >> ~/.zshrc
# export CCACHE_EXEC=$(command -v ccache) 				# OR This
echo "export CCACHE_DIR=/run/media/hritwik/CR/.cache/ccache" >> ~/.zshrc

# to reload zsh
source ~/.zshrc

```


### Ubuntu



```sh

sudo apt update && sudo apt upgrade -y
sudo apt install android-tools-adb android-tools-fastboot


# This will setup repo in /usr/bin 
git clone https://github.com/akhilnarang/scripts.git
chmod +x ./scripts/setup/android_build_env.sh
./scripts/setup/android_build_env.sh

ccache -M 70G

# put below lines in bashrc
echo "export USE_CCACHE=1" >> ~/.bashrc
echo "export CCACHE_EXEC=/usr/bin/ccache"  >> ~/.bashrc
echo "export CCACHE_DIR=/media/hritwik/CR/.cache/ccache" >> ~/.bashrc

# to reload zsh
source ~/.bashrc



```



---




## Scripts for roms


### Current

#### AICP A11


```zsh
mkdir aicp && cd aicp
repo init -u https://github.com/AICP/platform_manifest.git -b r11.1 --depth=1
repo sync --force-sync -j$(nproc --all) --no-tags --no-clone-bundle  -c

git clone "https://github.com/HritwikSinghal/device_realme_X2.git" -b aicp device/realme/X2
git clone "https://github.com/HritwikSinghal/vendor_realme_X2.git" -b aicp vendor/realme/X2
git clone "https://github.com/HritwikSinghal/android_kernel_realme_sm6150" -b aicp kernel/realme/sm6150


export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
export CCACHE_DIR=/run/media/hritwik/CR/.cache/ccache


chmod +x build/envsetup.sh
source build/envsetup.sh
time brunch aicp_X2-userdebug -j$(nproc --all) | tee log.txt


```


#### RR A10

```sh
mkdir rr && cd rr
repo init -u https://github.com/ResurrectionRemix/platform_manifest.git -b Q --depth=1
repo sync --force-sync -j$(nproc --all) --no-tags --no-clone-bundle  -c

git clone "https://github.com/HritwikSinghal/device_realme_X2.git" -b rr_10 device/realme/X2
git clone "https://github.com/HritwikSinghal/vendor_realme_X2.git" -b rr_10 vendor/realme/X2
git clone "https://github.com/HritwikSinghal/android_kernel_realme_sm6150" -b lineage-17.1 kernel/realme/sm6150

export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
export CCACHE_DIR=/run/media/hritwik/CR/.cache/ccache
export RR_BUILDTYPE=Unofficial

chmod +x build/envsetup.sh
source build/envsetup.sh
lunch rr_X2-userdebug
time mka bacon -j$(nproc --all) | tee log.txt


```



### Stale

#### AEX A11


```sh

ROM_NAME = ""
mkdir aex && cd aex
repo init -u git://github.com/AospExtended/manifest.git -b 11.x --depth=1
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

git clone "https://github.com/HritwikSinghal/device_realme_X2.git" -b aex device/realme/X2
git clone "https://github.com/HritwikSinghal/vendor_realme_X2.git" -b test vendor/realme/X2
git clone "https://github.com/HritwikSinghal/kernel_realme_sm6150.git" -b test kernel/realme/sm6150

chmod +x build/envsetup.sh
source build/envsetup.sh
lunch aosp_X2-userdebug
time m aex -j$(nproc --all) | tee log.txt

```




#### CrDroid A11

**Not updated**

```zsh
mkdir crdroid && cd crdroid
repo init -u git://github.com/crdroidandroid/android.git -b 11.0 --depth=1
repo sync --force-sync -j$(nproc --all) --no-tags --no-clone-bundle  -c

git clone "https://github.com/HritwikSinghal/device_realme_X2.git" -b crdroid device/realme/X2
git clone "https://github.com/HritwikSinghal/vendor_realme_X2.git" -b test vendor/realme/X2
git clone "https://github.com/HritwikSinghal/kernel_realme_sm6150.git" -b test kernel/realme/sm6150

chmod +x build/envsetup.sh
source build/envsetup.sh
# time brunch aicp_X2-userdebug -j$(nproc --all) | tee log.txt
lunch crdroid_X2-userdebug
time mka -j$(nproc --all) | tee log.txt


```


####  Havoc A11

**Not updated**

```sh
mkdir havoc && cd havoc
repo init -u git://github.com/Havoc-OS/android_manifest.git -b eleven --depth=1
repo sync --force-sync -j$(nproc --all) --no-tags --no-clone-bundle  -c

git clone "https://github.com/HritwikSinghal/device_realme_X2.git" -b havoc device/realme/X2
git clone "https://github.com/HritwikSinghal/vendor_realme_X2.git" -b test vendor/realme/X2
git clone "https://github.com/HritwikSinghal/kernel_realme_sm6150.git" -b test kernel/realme/sm6150

chmod +x build/envsetup.sh
source build/envsetup.sh
# time brunch havoc_X2-userdebug -j$(nproc --all) | tee log.txt
lunch havoc_X2-userdebug
time mka -j$(nproc --all) | tee log.txt

```


####  LOS

**Not updated**

```sh

mkdir los && cd los
repo init -u git://github.com/LineageOS/android.git -b lineage-18.1 --depth=1
repo sync --force-sync -j$(nproc --all) --no-tags --no-clone-bundle  -c

git clone "https://github.com/HritwikSinghal/device_realme_X2.git" -b lineage-18 device/realme/X2
git clone "https://github.com/HritwikSinghal/vendor_realme_X2.git" -b test vendor/realme/X2
git clone "https://github.com/HritwikSinghal/kernel_realme_sm6150.git" -b test kernel/realme/sm6150

chmod +x build/envsetup.sh
source build/envsetup.sh
lunch lineage_X2-userdebug
time mka bacon -j$(nproc --all) | tee log.txt


```



---




## Guides

- [where to start from and other awesome stuff](https://www.youtube.com/watch?v=yNVe3mjCI1k)

- General Build
	- https://www.youtube.com/watch?v=So6ctQbxZO8&t=7s
	- https://wiki.lineageos.org/devices/bacon/build
	- https://forum.xda-developers.com/t/guide-2018-all-you-need-to-know-to-build-android-from-scratch.3862893/

- https://github.com/halogenOS/android_manifest
	- This is also great guide for arch and general	

- for Building on Arch linux
	- https://scorpionrom.com/building-scorpionrom-with-manjaro-linux/
	- https://wiki.archlinux.org/index.php/android#Building
	- https://forum.xda-developers.com/t/guide-linux-manjaro-arch-how-to-set-up-android-build-environment.3300596/
		- This is for reference only
			```sh
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



---





## List of:


### Custom Roms

- /e/

- AEX (AOSP Extended)
- AICP
- AOSiP 				- Option for Gapps
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
- Dirty Unicorn ROM 	- CAF based - DEAD
- DotOS

- EvolutionX 			- Gapps
- Extended UI 			- Maybe Dead

- Floko
- Fluid Rom

- HavocOS

- ION ROM

- KangOS

- LOS

- MSMXtended			- CAF based

- NusantaraProject-ROM
- Nezuko OS 			- Gapps (PE based)
- NitrogenOS

- Octavi
- Omni Rom

- PalladiumOS
- Paranoid Android 		- CAF based
- PE 					- Gapps
- PE+ 					- Gapps
- Pixel Extended
- PixelPlusUI			- Gapps
- PixyOS				- Gapps
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


- EXTENDED KERNEL
- InsigniuX Kernel
- Panda Kernel
- RAD Kernel


### Custom Recoveries


- OrangeFox Recovery
- Pitch Black Recovery
- Red Wolf Recovery
- SkyHawk Recovery
- TWRP




---


## Things to check after booting ROM


- Audio (Microphone & Speakers & Headphone Jack)
- Camera & Camcorder
- Charging
	- Fast charginig
	- Offline Charging
- Bluetooth
- Encryption (of internal storage)
- Fingerprint
- Flash
- GPS
- RIL (Calls, SMS, Data) + VoLTE + VoWIFI
- Selinux Enforcing
- Sensors
	- accelerometer
	- gyro
	- proximity
	- compass
- Vibration
- Video Playback
- Wifi & Hotspot
	- 2.4Ghz & 5Ghz
	- Is internet there?
	- Do both work at same time?
- Wifi Display

​
