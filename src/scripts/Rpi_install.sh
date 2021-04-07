#!/bin/bash

# Brother printer driver install
sudo apt install qemu binfmt-support qemu-user-static cups a2ps -y
sudo dpkg --add-architecture i386
wget http://ftp.us.debian.org/debian/pool/main/g/glibc/libc6_2.28-10_i386.deb
dpkg -x libc6_2.28-10_i386.deb data
sudo cp -r data/lib/* /lib
sudo cp -r data/usr/* /usr
sudo cp -r data/etc/* /etc
EXTRA_OPTS="-L /lib/i386-linux-gnu"
echo "EXTRA_OPTS="-L /lib/i386-linux-gnu"" >> ~/.bashrc
wget https://download.brother.com/welcome/dlf101917/hll2360dcupswrapper-3.2.0-1.i386.deb
wget https://download.brother.com/welcome/dlf101916/hll2360dlpr-3.2.0-1.i386.deb
sudo sed 's/^/#/g' /etc/ld.so.preload | sudo tee /etc/ld.so.preload
sudo dpkg -i hll2360dcupswrapper-3.2.0-1.i386.deb
sudo dpkg -i hll2360dlpr-3.2.0-1.i386.deb

