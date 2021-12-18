#!/bin/bash


adduser hritwik
adduser hritwik sudo
# SSH using this

sudo apt update && sudo apt upgrade -y

# spacevim
curl -sLf https://spacevim.org/install.sh | bash

# Fish
sudo apt install fish bashtop -y

# Zellij
sudo apt install cargo -y && cargo install zellij -j$(nproc --all)
export PATH="$PATH:$HOME/.cargo/bin"
# run zellij


# AICP

sudo apt update && sudo apt upgrade -y && sudo apt install android-tools-adb android-tools-fastboot -y

mkdir -p ~/roms && cd ~/roms
# This will setup repo in /usr/bin
git clone https://github.com/akhilnarang/scripts.git
chmod +x ./scripts/setup/android_build_env.sh
./scripts/setup/android_build_env.sh

git config --global user.email "test@test.com"
git config --global user.name "testcom"

# AICP

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
git fetch off_rr
git cherry-pick b27490b437a1bc2a767af6d0dd8a30aae96036f0
cd ../..


cd packages/apps/Settings
git remote add off_rr https://github.com/ResurrectionRemix/Resurrection_packages_apps_Settings
git fetch off_rr
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

mkdir -p ~/mnt/linode/aicp
sshfs hritwik@xxx.xxx.xxx.xxx:/home/hritwik/ ~/mnt/linode/aicp
cd ~/mnt/linode/aicp

exit
umount ~/mnt/linode/aicp
