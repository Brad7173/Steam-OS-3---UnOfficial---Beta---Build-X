#!/bin/bash
#Script by Katie M. Nelson 3/27/24
UserPath=$(echo "/home/""$USER")
xinput --list > ~/xinput.txt
cat ~/xinput.txt | cut -d "=" -f2 | cut -d "[" -f1 > ~/xinputlist.txt
rm ~/xinput.txt
cat ~/xinputlist.txt | while read line
do
xinput disable $line
done
rm ~/xinputlist.txt
echo "osd-level=0" >> ~/.config/mpv/mpv.conf
echo "fs=yes" >> ~/.config/mpv/mpv.conf
echo "osc=no" >> ~/.config/mpv/mpv.conf
mpv --fs $UserPath/.local/share/Steam_Movies/System_Default/Default_Logging_Out_White_FFFFFF.webm
rm ~/.config/mpv/mpv.conf
exit
