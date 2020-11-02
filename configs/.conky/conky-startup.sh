#!/bin/sh

sleep 2s
killall conky || echo "conky was not running." &&

conky -c "$HOME/.conky/Titus.conkyrc" &
