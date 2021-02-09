#!/bin/sh

sleep 8s
killall conky || echo "conky was not running." &&

conky -c "$HOME/.conky/Titus.conkyrc" &
