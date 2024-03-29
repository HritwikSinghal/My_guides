# Things for Android Rom Building


# Table of Contents
- Todo & notes & Errors
	- Todo
	- Notes & Saved
	- Errors

- Setup
	- Manjaro
	- Ubuntu

- Scripts for Roms
    - AICP
    - Havoc
    - AOSiP
    - RR
		
- Guides
- List of:
	- Custom Roms
	- Kernels
	- Custom Recoveries
- Things to check after booting ROM




--- 





## Todo & notes & Errors


### Todo

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
    - or zellij


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
- error: Please update ABI references with: $ANDROID_BUILD_TOP/development/vndk/tools/header-checker/utils/create_reference_dumps.py
	- export SKIP_ABI_CHECKS=true

- if ncurses lib not found error, try ```paru ncurses5-compat-libs```

- "'vendor/aosip/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml', needed by 'out/target/product/X2/system/etc/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml', missing and no known rule to make it"
    - https://gerrit.pixelexperience.org/c/vendor_aosp/+/658
    - https://gerrit.pixelexperience.org/plugins/gitiles/vendor_aosp/+/9a269eebcb30284b41863dcd337597d41256c7f3/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml

    - mkdir -p vendor/aosip/config/permissions/
    - touch vendor/aosip/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml
    - vim vendor/aosip/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml
    ```
        <?xml version="1.0" encoding="utf-8"?>
        <!-- Copyright (C) 2019 The LineageOS Project
            Licensed under the Apache License, Version 2.0 (the "License");
            you may not use this file except in compliance with the License.
            You may obtain a copy of the License at
                http://www.apache.org/licenses/LICENSE-2.0
            Unless required by applicable law or agreed to in writing, software
            distributed under the License is distributed on an "AS IS" BASIS,
            WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
            See the License for the specific language governing permissions and
            limitations under the License.
        -->
        <permissions>
            <feature name="vendor.lineage.biometrics.fingerprint.inscreen" />
        </permissions>

    ```

- Bhai splash pe stuck ho ja rha ..Logs kaise lun? Adb work nhi kar rha splash par.
    Log it via init.rc
    Create a logcat service that writes to /cache/myFavLogcat.log
    Then pull this file via recovery



--- 


## Mount remote FS as folder in local machine

- [How to Mount Remote Linux Filesystem or Directory Using SSHFS Over SSH](https://www.tecmint.com/sshfs-mount-remote-linux-filesystem-directory-using-ssh/)
    - All of below is done on local machine
        - sudo apt-get install sshfs
        - yay -S sshfs

        - mkdir -p ~/mnt/linode/aicp
        - sshfs username@ip_addr:<home_dir_server> ~/mnt/linode/aicp
        - cd ~/mnt/linode/aicp

        - your server will be accessible in ~/mnt/linode/aicp
        - rom in '/home/hritwik/mnt/linode/rr/roms/rr/out/target/product/X2'
        - umount ~/mnt/linode/rr



```
mkdir -p ~/mnt/linode/rr
sshfs hritwik@45.79.127.92:/home/hritwik/ ~/mnt/linode/rr
cd ~/mnt/linode/rr

umount ~/mnt/linode/rr
```

## To test roms in emulator after completing build

```
. build/envsetup.sh
set_stuff_for_environment
lunch havoc_X2-userdebug
QT_QPA_PLATFORM=xcb emulator -verbose
```

## Setup


### Manjaro



```sh
#!/bin/bash
sudo pacman -S base-devel yay android-tools android-udev --noconfirm --needed
sudo usermod -a -G adbusers $USER
newgrp adbusers

git config --global user.email "test@test.com"
git config --global user.name "testcom"

# This will setup repo in /usr/bin 
git clone https://github.com/akhilnarang/scripts.git
chmod +x ./scripts/setup/android_build_env.sh ./scripts/setup/arch-manjaro.sh
./scripts/setup/android_build_env.sh
# ./scripts/setup/arch-manjaro.sh    # This is not required if you install all below 

# Note that Vim is a dependency of aosp-devel and will be in conflict with xxd-standalone. So install aosp-devel, remove Vim, install neovim in place of vim (and then optional, install xxd-standalone) to remove any conflicts

sudo pacman -S --noconfirm --needed yay base-devel multilib-devel gcc repo git gnupg gperf sdl wxgtk2 squashfs-tools curl ncurses zlib schedtool perl-switch zip unzip libxslt bc rsync ccache lib32-zlib lib32-ncurses lib32-readline

yay -S --noconfirm --needed lineageos-devel aosp-devel maven gradle xmlstarlet neovim 

yay -Rdd vim --noconfirm

yay -S --noconfirm --needed flex bison cpio clang ncurses5-compat-libs lib32-ncurses5-compat-libs xxd-standalone xml2 libxcrypt-compact

ccache -M 50G

# put below lines in zshrc
echo "export USE_CCACHE=1" >> ~/.zshrc
echo "export CCACHE_EXEC=/usr/bin/ccache" >> ~/.zshrc
echo "export CCACHE_DIR=/run/media/hritwik/CR/.cache/ccache" >> ~/.zshrc
# export CCACHE_EXEC=$(command -v ccache) 				# OR This

# to reload zsh
source ~/.zshrc

or

export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
export CCACHE_DIR=/run/media/hritwik/CR/.cache/ccache


```


### Ubuntu



```sh
#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt install android-tools-adb android-tools-fastboot

git config --global user.email "test@test.com"
git config --global user.name "testcom"

mkdir -p ~/roms && cd ~/roms
# This will setup repo in /usr/bin 
git clone https://github.com/akhilnarang/scripts.git
chmod +x ./scripts/setup/android_build_env.sh
./scripts/setup/android_build_env.sh

ccache -M 70G

# put below lines in bashrc
echo "export USE_CCACHE=1" >> ~/.bashrc
echo "export CCACHE_EXEC=/usr/bin/ccache"  >> ~/.bashrc
echo "export CCACHE_DIR=/media/hritwik/CR/.cache/ccache" >> ~/.bashrc

# to reload bash
source ~/.bashrc


```



---




## Scripts for roms

**Do below if selinux is permissive otherwise the rom wont boot**

```sh
cd external/selinux
git remote add can https://github.com/CannedOS/external_selinux
git fetch can
git cherry-pick db56d38c06ca4514304eec771a14558b867ab2ff
printf "Canned DONE"
```



#### AICP A11


```zsh
mkdir -p ./roms/aicp/&& cd ./roms/aicp
repo init -u https://github.com/AICP/platform_manifest.git -b r11.1 --depth=1
repo sync --force-sync -j$(nproc --all) --no-tags --no-clone-bundle  -c

git clone "https://github.com/HritwikSinghal/device_realme_X2.git" -b aicp device/realme/X2
git clone "https://github.com/HritwikSinghal/vendor_realme_X2.git" -b master vendor/realme/X2
git clone "https://github.com/HritwikSinghal/android_kernel_realme_sm6150" -b android-11.0.0 kernel/realme/sm6150

cd external/selinux
git remote add can https://github.com/CannedOS/external_selinux
git fetch can
git cherry-pick db56d38c06ca4514304eec771a14558b867ab2ff
cd ..
cd ..


# see https://github.com/AOSPK/frameworks_base/commit/3feb1ac8fcfe5b9f1cc07febbee80ce472a7ed85
# and change "DeviceConfig.NAMESPACE_SYSTEMUI, BRIGHTLINE_FALSING_MANAGER_ENABLED, true" to "false"

# https://github.com/AOSP-Realme-X2/platform_frameworks_base/commit/30867565a37912255aeb08bfae39d1cf9a7843d6
# https://github.com/Retypolkg/device_realme_X2/commit/143e7780ba7828c21af9a8e322f7d8c1ca217b63

ccache -M 50G
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
export CCACHE_DIR=/run/media/hritwik/CR/.cache/ccache
export SKIP_ABI_CHECKS=true
# export ALLOW_MISSING_DEPENDENCIES=true

chmod +x build/envsetup.sh
. build/envsetup.sh
time brunch aicp_X2-userdebug

```


#### AOSiP A11


```zsh
mkdir -p ~/roms/aosip && cd ~/roms/aosip
repo init -u git://github.com/AOSiP/platform_manifest.git -b eleven --depth=1
repo sync --force-sync -j$(nproc --all) --no-tags --no-clone-bundle -c

git clone "https://github.com/HritwikSinghal/device_realme_X2.git" -b aosip device/realme/X2
git clone "https://github.com/HritwikSinghal/vendor_realme_X2.git" -b master vendor/realme/X2
git clone "https://github.com/HritwikSinghal/android_kernel_realme_sm6150" -b android-11.0.0 kernel/realme/sm6150

cd external/selinux
git remote add can https://github.com/CannedOS/external_selinux
git fetch can
git cherry-pick db56d38c06ca4514304eec771a14558b867ab2ff
cd ..
cd ..

export USE_CCACHE=1
ccache -M 50G
# export CCACHE_EXEC=/usr/bin/ccache
# export CCACHE_DIR=/run/media/hritwik/CR/.cache/ccache
export SKIP_ABI_CHECKS=true
# export ALLOW_MISSING_DEPENDENCIES=true

chmod +x build/envsetup.sh
source build/envsetup.sh
lunch aosip_X2-userdebug



#   # This error will come
# - "'vendor/aosip/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml', needed by 'out/target/product/X2/system/etc/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml', missing and no known rule to make it"
#     - https://gerrit.pixelexperience.org/c/vendor_aosp/+/658
#     - https://gerrit.pixelexperience.org/plugins/gitiles/vendor_aosp/+/9a269eebcb30284b41863dcd337597d41256c7f3/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml
#
#    # to solve
#     - mkdir -p vendor/aosip/config/permissions/
#     - touch vendor/aosip/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml
#     - vim vendor/aosip/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml
#     ```
# <?xml version="1.0" encoding="utf-8"?>
# <!-- Copyright (C) 2019 The LineageOS Project
#     Licensed under the Apache License, Version 2.0 (the "License");
#     you may not use this file except in compliance with the License.
#     You may obtain a copy of the License at
#         http://www.apache.org/licenses/LICENSE-2.0
#     Unless required by applicable law or agreed to in writing, software
#     distributed under the License is distributed on an "AS IS" BASIS,
#     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#     See the License for the specific language governing permissions and
#     limitations under the License.
# -->
# <permissions>
#     <feature name="vendor.lineage.biometrics.fingerprint.inscreen" />
# </permissions>
#
#     ```



time m kronic -j$(nproc --all) | tee log.txt

```




####  Havoc A11


```sh
mkdir -p ~/roms/havoc && cd ~/roms/havoc
repo init -u https://github.com/Havoc-OS/android_manifest.git -b eleven --depth=1
repo sync --force-sync -j$(nproc --all) --no-tags --no-clone-bundle  -c

git clone "https://github.com/HritwikSinghal/device_realme_X2.git" -b havoc device/realme/X2
git clone "https://github.com/HritwikSinghal/vendor_realme_X2.git" -b master vendor/realme/X2
git clone "https://github.com/HritwikSinghal/android_kernel_realme_sm6150.git" -b android-11.0.0 kernel/realme/sm6150

cd external/selinux
git remote add can https://github.com/CannedOS/external_selinux
git fetch can
git cherry-pick db56d38c06ca4514304eec771a14558b867ab2ff
cd ..
cd ..

export USE_CCACHE=1
ccache -M 50G
export CCACHE_EXEC=/usr/bin/ccache
export CCACHE_DIR=/run/media/hritwik/CR/.cache/ccache
export SKIP_ABI_CHECKS=true

chmod +x build/envsetup.sh
. build/envsetup.sh
lunch havoc_X2-userdebug

# make api-stubs-docs-update-current-api -j$(nproc --all) && \
# make system-api-stubs-docs-non-updatable-update-current-api -j$(nproc --all) && \
# time brunch -j$(nproc --all) | tee log.txt        # DONT USE THIS, WILL GIVE ERRORS
brunch


```



#### RR A10

```sh
mkdir rr && cd rr
repo init -u https://github.com/ResurrectionRemix/platform_manifest.git -b Q --depth=1
repo sync --force-sync -j$(nproc --all) --no-tags --no-clone-bundle  -c

git clone "https://github.com/HritwikSinghal/device_realme_X2.git" -b rr_10 device/realme/X2
git clone "https://github.com/HritwikSinghal/vendor_realme_X2.git" -b rr_10 vendor/realme/X2
git clone "https://github.com/HritwikSinghal/android_kernel_realme_sm6150" -b lineage-17.1 kernel/realme/sm6150

# Not needed
#
# cd external/selinux
# git remote add can https://github.com/CannedOS/external_selinux
# git fetch can
# git cherry-pick db56d38c06ca4514304eec771a14558b867ab2ff
# cd ..
# cd ..


# For devices with in-display fingerprint, you need to adapt your devices to FOD 1.1 for things to work properly. FOD1.1 + fod-ext value to call the HAL layer
#
# Also set this flag in device tree device.mk
# TARGET_HAS_FOD := true
#
# For Devices who don't wish to adapt to 1.1, and wish to stick to los 1.0 ext impl, please merge the following two commits in frameworks/base and packages/apps/Settings
# Base:
# https://github.com/ResurrectionRemix/android_frameworks_base/commit/b27490b437a1bc2a767af6d0dd8a30aae96036f0
# Settings
# https://github.com/ResurrectionRemix/Resurrection_packages_apps_Settings/commit/24551c50223cbccd8fd74f053463f99e38ee93d8
#
# Please don't forget extension lib (already in X2 RR DT)


cd frameworks/base
git remote add off_rr https://github.com/ResurrectionRemix/android_frameworks_base
git fetch off_rr --depth=1
git cherry-pick b27490b437a1bc2a767af6d0dd8a30aae96036f0
cd ../..


cd packages/apps/Settings
git remote add off_rr https://github.com/ResurrectionRemix/Resurrection_packages_apps_Settings
git fetch off_rr --depth=1
git cherry-pick 24551c50223cbccd8fd74f053463f99e38ee93d8
cd ../../..


export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
export RR_BUILDTYPE=Unofficial
export SKIP_ABI_CHECKS=true
export CCACHE_DIR=/run/media/hritwik/CR/.cache/ccache


chmod +x build/envsetup.sh
source build/envsetup.sh
lunch rr_X2-userdebug
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
- AncientOS             - Source private
- Arrow
- Awaken

- Bootleggers
- Bliss ROM

- Carbon ROM
- CesiumOS
- CherishOS
- ColtOS
- ConquerOS             - CAF based
- Corvus
- CrDroid
- Cygnus OS             - CAF based

- Derpfest
- Descendent-XI
- Dirty Unicorn ROM 	- CAF based - DEAD
- DotOS

- EvolutionX 			- Gapps
- Extended UI 			- Dead

- Floko
- Fluid Rom

- HavocOS
- HyconOS

- ION ROM

- KangOS

- Legion OS
- LessAOSP
- LOS

- MSMXtended			- CAF based

- NusantaraProject-ROM
- Nezuko OS 			- Gapps (PE based), Dead
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
- Project Lighthouse
- Project Radiant
- Project Sakura

- RevengeOS
- RR

- ShapeshiftOS
- SparkOS
- StagOS
- Styx Project
- SuperiorOS

- The Styx Project

- WaveOS

- Xtended

- ZenX





### Kernels


- EXTENDED KERNEL
- Elixir
- Hydra
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
