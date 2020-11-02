#!/bin/sh
set -e

echo "------------------------------------------------------"
echo "Backuping up Extensions"
mkdir ~/Backups
cd ~/.local/share/gnome-shell
zip -r ~/Backups/extensions_bak.zip ./extensions
