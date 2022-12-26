#!/usr/bin/env bash

lock="  Lock"
logout="  Log Out"
shutdown="  Shut Down"
reboot="  Reboot"
sleep="  Sleep"
hibernate="  Hibernate"
# Get answer from user via rofi
selected_option=$(echo "$lock
$logout
$sleep
$hibernate
$reboot
$shutdown" | rofi -dmenu\
                  -i\
                  -p "Power")
# Do something based on selected option
if [ "$selected_option" == "$lock" ]
then
    swaylock
elif [ "$selected_option" == "$logout" ]
then
    loginctl terminate-user "$(whoami)"
elif [ "$selected_option" == "$shutdown" ]
then
    systemctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
    systemctl reboot
elif [ "$selected_option" == "$sleep" ]
then
    systemctl suspend
elif [ "$selected_option" == "$hibernate" ]
then
    systemctl hibernate
else
    echo "No match"
fi
