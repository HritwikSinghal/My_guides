#!/bin/bash

adduser hritwik
adduser hritwik sudo
# SSH using this
sudo apt update && sudo apt upgrade -y

# spacevim
curl -sLf https://spacevim.org/install.sh | bash

# Fish
sudo apt install fish bashtop -y


# # Install ZSH
#
# sudo apt install zsh git -y
#
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
# echo "autoload -U compinit" >> ~/.zshrc
#
#
# # Does not work, Do it manually
# sudo sed "s/plugins=\(git\)/plugins=\(zsh-syntax-highlighting zsh-autosuggestions zsh-completions git\)/g" ~/.zshrc
#
#
# # Powerlevel10K
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
# echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc



# Zellij
sudo apt install cargo -y && cargo install zellij -j$(nproc --all)
export PATH="$PATH:$HOME/.cargo/bin"
# run zellij

# AOSIP

sudo apt update && sudo apt upgrade -y && sudo apt install android-tools-adb android-tools-fastboot -y

mkdir -p ~/roms && cd ~/roms
# This will setup repo in /usr/bin
git clone https://github.com/akhilnarang/scripts.git
chmod +x ./scripts/setup/android_build_env.sh
./scripts/setup/android_build_env.sh

git config --global user.email "test@test.com"
git config --global user.name "testcom"


mkdir aosip && cd aosip
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
export CCACHE_EXEC=/usr/bin/ccache
export SKIP_ABI_CHECKS=true

chmod +x build/envsetup.sh
source build/envsetup.sh
lunch aosip_X2-userdebug

time m kronic -j$(nproc --all) | tee log.txt


# - [How to Mount Remote Linux Filesystem or Directory Using SSHFS Over SSH](https://www.tecmint.com/sshfs-mount-remote-linux-filesystem-directory-using-ssh/)
#     - All of below is done on local machine
#         - sudo apt-get install sshfs
#         - yay -S sshfs
#
#         - mkdir -p ~/mnt/linode
#         - sshfs hritwik@x.x.x.x:/home/hritwik/ ~/mnt/linode
#         - cd ~/mnt/linode
#
#         - exit
#         - umount ~/mnt/tecmint


