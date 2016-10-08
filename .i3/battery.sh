#!/bin/bash
#upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to\ full|percentage"
DISCHARGING="discharging"
PASSWORD=$1
PERCENTAGE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "percentage")
STATE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state")
STATE=`echo $STATE | sed s/'state: '//`
set -- $PERCENTAGE
VALUE=$2
VALUE=${VALUE%\%*}
VALUE=${VALUE%.*}
if [ $VALUE -le 5 ] && [ "$STATE" == "$DISCHARGING" ]
then
exec gnome-screensaver-command -l &
echo $PASSWORD | sudo -S pm-suspend
fi
if [ $VALUE -le 10 ] && [ "$STATE" == "$DISCHARGING" ]
then
VARS=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|time|percentage")
set -- $VARS
zenity --warning --title="Low Power" --text=$1" "$2"\nremaining: "$6" mins\n"$8" "$9 --display=:0.0
fi
