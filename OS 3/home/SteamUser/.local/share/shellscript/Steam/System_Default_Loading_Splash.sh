#!/bin/bash
#Script by Katie M. Nelson 3/27/24
UserPath=$(echo "/home/""$USER")
echo "osd-level=0" >> ~/.config/mpv/mpv.conf
echo "fs=yes" >> ~/.config/mpv/mpv.conf
echo "osc=no" >> ~/.config/mpv/mpv.conf
mpv --fs $UserPath/.local/share/Steam_Movies/System_Default/Default_Loading_White_FFFFFF.webm
rm ~/.config/mpv/mpv.conf
exit
