#!/usr/bin/env bash

lock="  Lock"
logout="  Log Out"
shutdown="  Shut Down"
reboot="  Reboot"
sleep="  Sleep"
# Get answer from user via rofi
selected_option=$(echo "$lock
$logout
$sleep
$reboot
$shutdown" | rofi -dmenu\
                  -i\
                  -p " Power")
# Do something based on selected option
if [ "$selected_option" == "$lock" ]
then
    swaylock
elif [ "$selected_option" == "$logout" ]
then
    loginctl terminate-user $(whoami)
elif [ "$selected_option" == "$shutdown" ]
then
    sudo systemctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
    sudo systemctl reboot
elif [ "$selected_option" == "$sleep" ]
then
    sudo systemctl suspend
else
    echo "No match"
fi
