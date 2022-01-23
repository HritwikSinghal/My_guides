#!/bin/bash

# To clone one SSD to another one
# https://www.pragmaticlinux.com/2020/08/move-the-raspberry-pi-root-file-system-to-a-usb-drive/
# in short, make sure fstab is updated and /boot/cmdline.txt has correct boot partition id (if using RPiOS)

touch /Volumes/boot/ssh

touch /Volumes/boot/wpa_supplicant.conf
'''
country=US
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
    ssid="NETWORK-NAME"
    psk="NETWORK-PASSWORD"
}
'''

# --------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------- #
# ------------------------------------ Rpi OS Install ----------------------------------------- #
# --------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------- #


# Also install python3-lgpio for kernel >= 5.11

sudo apt update && sudo apt upgrade -y
sudo apt install git fish cron gcc python3-pip htop bpytop neofetch curl wget -y
sudo apt install micro neovim -y
chsh -s /usr/bin/fish
sudo systemctl enable --now cron


# MS repo remove
sudo sed 's/^/#/g' /etc/apt/sources.list.d/vscode.list | sudo tee /etc/apt/sources.list.d/vscode.list
sudo rm -f /etc/apt/trusted.gpg.d/microsoft.gpg


# Make IP static

# edit /etc/dhcpcd.conf and add this to bottom
interface wlan0
static ip_address=192.168.11.13
static routers=192.168.11.1
static domain_name_servers=8.8.8.8


# Brother printer driver install
sudo apt install qemu binfmt-support qemu-user-static cups a2ps -y
sudo dpkg --add-architecture i386
wget http://ftp.us.debian.org/debian/pool/main/g/glibc/libc6_2.31-13+deb11u2_i386.deb
dpkg -x libc6*.deb data
sudo cp -r data/lib/* /lib
sudo cp -r data/usr/* /usr
sudo cp -r data/etc/* /etc
EXTRA_OPTS="-L /lib/i386-linux-gnu"
echo "EXTRA_OPTS="-L /lib/i386-linux-gnu"" >> ~/.bashrc
wget https://download.brother.com/welcome/dlf101917/hll2360dcupswrapper-3.2.0-1.i386.deb
wget https://download.brother.com/welcome/dlf101916/hll2360dlpr-3.2.0-1.i386.deb
sudo sed 's/^/#/g' /etc/ld.so.preload | sudo tee -a /etc/ld.so.preload
sudo dpkg -i hll2360dcupswrapper-3.2.0-1.i386.deb
sudo dpkg -i hll2360dlpr-3.2.0-1.i386.deb


# Cups printing
sudo usermod -a -G lpadmin pi
sudo sed -i 's/Browsing Off/Browsing On/g' /etc/cups/cupsd.conf
sudo sed -i 's/Listen localhost:631/Port 631/g' /etc/cups/cupsd.conf
sudo sed -i 's/<Location \/>\n  Order allow,deny/Browsing On/g' /etc/cups/cupsd.conf

# To access cups interface over wifi on other devices
# see https://www.techrepublic.com/article/how-to-configure-a-print-server-with-ubuntu-server-cups-and-bonjour/


# pihole
curl -sSL https://install.pi-hole.net | sudo bash


# Room control service
curl -sSL https://raw.githubusercontent.com/HritwikSinghal/room_control_server/master/install.sh | bash

# set custom resolution, this should work but dont know it it would
echo "# force a specific HDMI mode (this will force VGA)" | sudo tee -a /boot/config.txt
echo "hdmi_group=2" | sudo tee -a /boot/config.txt
echo "hdmi_mode=82" | sudo tee -a /boot/config.txt



# --------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------- #

# ------------------------------------ MANJARO Install ---------------------------------------- #
# --------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------- #


# GUIDE FOR CHROOTING IN MANJARO RPI INSTALL FROM PC


yay -S --noconfirm --needed qemu-user-static-bin
sudo mount /dev/sdc2 -o rw /mnt
cd /mnt
sudo mount --bind /dev /mnt/dev/
sudo mount --bind /sys /mnt/sys/
sudo mount --bind /proc /mnt/proc/
sudo mount --bind /dev/pts /mnt/dev/pts

sudo cp $(which qemu-arm-static) /mnt/usr/bin
sudo systemctl restart systemd-binfmt.service

# for enabling networking
sudo cp /etc/resolv.conf /mnt/etc/resolv.conf
sudo chroot /mnt qemu-arm-static /bin/bash
# or try - sudo chroot /mnt



pacman -Syyu --noconfirm --needed yay
yay -S --noconfirm --needed python-raspberry-gpio gpio-utils
yay -S --noconfirm --needed git htop neofetch fish python3 python-pip cronie curl neovim
yay -S --noconfirm --needed micro wl-clipboard net-tools exa bat wget zellij
chsh -s /usr/bin/fish

pip3 install pipenv lgpio

systemctl enable cronie
systemctl enable fstrim.timer
systemctl enable sshd
systemctl enable systemd-timesyncd
timedatectl set-ntp true
pacman-mirrors -c Global


# install spacevim
# modify pacman.conf, makepkg.conf
# add aliases, see bottom of this file

mkdir -p /var/lib/iwd
touch /var/lib/iwd/Singhals.psk                                         # (Enter the wifi name, not Singhals)
echo "[Security]" | sudo tee -a /var/lib/iwd/Singhals.psk               # (Enter the wifi name, not Singhals)
echo "Passphrase=123123123" | sudo tee -a /var/lib/iwd/Singhals.psk     # (Enter the actual password, not 123123123)


# finally
sudo umount /mnt/dev/ -l
sudo umount /mnt/sys/ -l
sudo umount /mnt/proc/ -l
sudo umount /mnt/dev/pts -l
sudo umount /mnt/ -l

# installing latest kernel https://forum.manjaro.org/t/raspberry-pi-kernels-2-0/84885

# room control server should be run as root on manjaro
# CFLAGS="-fcommon" pip install rpi.gpio


# https://raspberrypi.stackexchange.com/questions/40105/access-gpio-pins-without-root-no-access-to-dev-mem-try-running-as-root

sudo groupadd gpio
sudo usermod -a -G gpio user_name
sudo grep gpio /etc/group
sudo chown root.gpio /dev/gpiomem
sudo chmod g+rw /dev/gpiomem


# --------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------- #




# BELOW ARE ALIASES

#### get fastest mirrors
alias mirror="sudo pacman-mirrors --fasttrack 5  && sudo pacman -Syyu"
alias mirrorreset="sudo pacman-mirrors --country all --api --protocols all --set-branch stable && sudo pacman -Syyu"


#### Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#### git
alias gaa='git add .'
alias glog='git log --graph --decorate --oneline' # this one is just pure terminal beauty
alias gs='git status'  # 'status' is protected
alias gst='git stash'
alias gitu='git add . && git commit && git push'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull'
alias push='git push'
alias pushf='git push --force'
alias pushall='git remote | xargs -L1 git push --all' 	# push to all remotes, or "git config --global alias.pushall '!git remote | xargs -L1 git push --all'" and then run "git pushall"
alias remote='git remote'
alias remotev='git remote -vv'
alias tag='git tag'
alias newtag='git tag -a'

#### youtube-dl
alias ytdl="yt-dlp -o '%(episode_number)s - %(title)s.%(ext)s' -f bestvideo+bestaudio "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-m4a="yt-dlp --extract-audio --audio-format m4a "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytv-best="yt-dlp -f bestvideo+bestaudio"

#### rsync & rclone
alias rsync='rsync --info=progress2' ## Copy things with progress bar
alias rclone='rclone --stats-one-line -P -v --stats 1s'
#### nmap
alias ipscan='nmap -sP 192.168.1.0/24'

alias tarr='tar -cvf'
