#!/bin/bash
alias mp3-download='youtube-dl -x --audio-format mp3  --audio-quality  0'

(youtube-dl --output "$QUTE_DOWNLOAD_DIR/%(title)s.%(ext)s" -x --audio-format mp3  --audio-quality  0 $QUTE_URL && 
    notify-send "YouTube mp3 download completed!" "$QUTE_TITLE") || exit 0
