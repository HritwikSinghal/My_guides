#!/bin/sh
set -e

# this is update script for .deb packages that are downloaded from github
# and extensions from official gnome Exnensions website

# Todo: Flameshot


# FOR DEB this is general template
# https://smarterco.de/download-latest-version-from-github-with-curl/

DOWNLOAD_URL=$(curl -s https://api.github.com/repos/flameshot-org/flameshot/releases/latest \
        | grep browser_download_url \
        | grep ubuntu -i \
        | cut -d '"' -f 4)
curl -s -L --create-dirs -o ~/downloadDir "$DOWNLOAD_URL"


# flameshot
https://api.github.com/repos/flameshot-org/flameshot/releases/latest





# For Extensions
# https://askubuntu.com/questions/937284/how-can-i-update-gnome-shell-extensions-from-the-command-line
