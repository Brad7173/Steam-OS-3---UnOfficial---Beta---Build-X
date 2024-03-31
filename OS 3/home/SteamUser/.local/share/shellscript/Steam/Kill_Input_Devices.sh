#!/bin/bash
#Created by Katie M. Nelson 3/29/24
xinput --list > ~/xinput.txt
cat ~/xinput.txt | cut -d "=" -f2 | cut -d "[" -f1 > ~/xinputlist.txt
rm ~/xinput.txt
cat ~/xinputlist.txt | while read line
do
xinput disable $line
done
rm ~/xinputlist.txt
exit
