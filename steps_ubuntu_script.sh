#!/bin/sh
set -e

# add repositories
echo "Adding Repositories."
echo "Timeshift Repo........"
sudo apt-add-repository -y ppa:teejee2008/ppa



echo "Insatlling Apps."
echo "Insatlling Timeshift........"
sudo apt install timeshift
echo "Insatlling ........"
sudo apt install network-manager



echo "Other Tweaks."
echo "Adding to '/etc/environment'"
(echo "" ; echo "DRI_PRIME=1" ; echo "" ) >> /etc/environment
(echo "" ; echo "MOZ_ENABLE_WAYLAND=1" ; echo "" ) >> /etc/environment
