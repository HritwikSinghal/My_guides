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

mkdir -p ~/roms/aicp && cd ~/roms/aicp
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

ccache -M 50G
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
export SKIP_ABI_CHECKS=true

chmod +x build/envsetup.sh
source build/envsetup.sh

time brunch aicp_X2-userdebug -j$(nproc --all) | tee log.txt


mkdir -p ~/mnt/linode/aicp
sshfs hritwik@xxx.xxx.xxx.xxx:/home/hritwik/ ~/mnt/linode/aicp
cd ~/mnt/linode/aicp

exit
umount ~/mnt/linode/aicp
