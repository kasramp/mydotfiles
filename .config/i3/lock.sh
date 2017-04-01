#!/bin/bash
PIC_PATH="/home/kixz/Pictures/Wallpapers/`ls /home/kixz/Pictures/Wallpapers/| sort -R | tail -1`"
`convert -resize 1366x1366 $PIC_PATH /tmp/lock.png`
`i3lock -fti /tmp/lock.png`

