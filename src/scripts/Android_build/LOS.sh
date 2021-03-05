#!/usr/bin/env bash
	
# To run 
# curl -SsL https://raw.githubusercontent.com/HritwikSinghal/My_guides/new/src/scripts/Android_build/LOS.sh | sudo bash


# https://askubuntu.com/questions/8653/how-to-keep-processes-running-after-ending-ssh-session
tmux

sudo apt update && sudo apt upgrade -y
sudo apt install android-tools-adb android-tools-fastboot -y


# This will setup repo in /usr/bin 
git clone https://github.com/akhilnarang/scripts.git
chmod +x ./scripts/setup/android_build_env.sh
./scripts/setup/android_build_env.sh
# ./scripts/setup/arch-manjaro.sh    # This is not required if you install all below 


ccache -M 70G

# put below lines in bashrc
echo "export USE_CCACHE=1" >> ~/.bashrc
echo "export CCACHE_EXEC=/usr/bin/ccache"  >> ~/.bashrc

# to reload zsh
source ~/.bashrc



mkdir los && cd los
repo init -u git://github.com/LineageOS/android.git -b lineage-18.1
repo sync --force-sync -j$(nproc --all) --no-tags --no-clone-bundle  -c

git clone "https://www.github.com/HritwikSinghal/android_device_realme_X2.git" -b lineage-18.0 device/realme/X2
git clone "https://www.github.com/HritwikSinghal/android_vendor_realme_X2.git" -b lineage-18.0 vendor/realme/X2
git clone "https://www.github.com/HritwikSinghal/android_kernel_realme_sm6150.git" -b android-11.0.0 kernel/realme/sm6150

# Now rename files like shown in video

chmod +x build/envsetup.sh
# . build/envsetup.sh 			# this or below
source build/envsetup.sh
lunch lineage_X2-userdebug
m -j$(nproc --all) | tee log.txt
# make update-api && time m -j$(nproc --all) | tee log.txt



#To copy a file from B to A while logged into A:

# scp username@b:/path/to/file /path/to/destination
# scp root@198.13.32.138:~/.profile ~/Videos

# OR


# https://linuxize.com/post/how-to-setup-passwordless-ssh-login/
# https://linuxize.com/post/how-to-transfer-files-with-rsync-over-ssh/
sudo apt install rsync -y

# Remote to Local: rsync [OPTION]... -e ssh [USER@]HOST:SRC... [DEST]
# Where SRC is the source directory, DEST is the destination directory 
# USER is the remote SSH username and HOST is the remote SSH host or IP Address
# To transfer data from a remote to a local machine, use the remote location as the source and the local location as destination:

# rsync -a root@198.13.32.138:/foo/bar/file.zip ~/Videos
#!/bin/bash
