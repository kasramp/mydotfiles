#!/bin/bash

# This script install the Monaco font for the logged in user
# and updates Urxvt terminal font to Monaco.
# This happens by updating .Xresources file.
# So user doesn't need to restart the system.

`mkdir -p ~/.fonts/`
`cp font/Monaco-Linux.ttf ~/.fonts`
`fc-cache -fv`
`echo '! Change the font to Monaco' >> ~/.Xresources`
`echo 'URxvt*font: xft:monaco:size=11' >> ~/.Xresources`
`xrdb ~/.Xresources`

echo -e "\n"
echo -e "\n"
echo -e "Monaco font installation has finished\n"
echo -e "Close your terminal and open again to see the effect\n"
echo "Enjoy using Monaco font!!!"
