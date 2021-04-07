#!/usr/bin/env bash

# To run 
# curl -sSL https://raw.githubusercontent.com/HritwikSinghal/My_guides/master/src/scripts/Android_build/AICP.sh | sudo bash

tmux

sudo apt update && sudo apt upgrade -y
sudo apt install android-tools-adb android-tools-fastboot -y


# This will setup repo in /usr/bin 
git clone https://github.com/akhilnarang/scripts.git
chmod +x ./scripts/setup/android_build_env.sh
./scripts/setup/android_build_env.sh

ccache -M 70G

# put below lines in bashrc
echo "export USE_CCACHE=1" >> ~/.bashrc
echo "export CCACHE_EXEC=/usr/bin/ccache"  >> ~/.bashrc

# to reload zsh
source ~/.bashrc



mkdir aicp && cd aicp
repo init -u https://github.com/AICP/platform_manifest.git -b r11.1 --depth=1
repo sync --force-sync -j$(nproc --all) --no-tags --no-clone-bundle  -c

git clone "https://github.com/HritwikSinghal/device_realme_X2.git" -b aicp device/realme/X2
git clone "https://github.com/HritwikSinghal/vendor_realme_X2.git" -b test vendor/realme/X2
git clone "https://github.com/HritwikSinghal/kernel_realme_sm6150.git" -b test kernel/realme/sm6150

chmod +x build/envsetup.sh
source build/envsetup.sh
time brunch aicp_X2-userdebug -j$(nproc --all) | tee log.txt

sudo apt install rsync -y