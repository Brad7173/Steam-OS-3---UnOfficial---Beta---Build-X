#!/bin/bash
#created by Katie M. Nelson 3/29/24
UserPath=$(echo "/home/""$USER")
yad --icons \
	--title="Steam OS 3 System Control" \
	--window-icon=$UserPath/.local/share/icons/Steam/icons/steam114.png \
	--skip-taskbar \
	--on-top \
	--no-buttons \
	--single-click \
	--center \
	--fixed \
	--hscroll-policy=never \
	--vscroll-policy=never \
	--read-dir=$UserPath/.local/share/shellscript/Steam/System_Controls \
	--width=300 --height=210 --item-width=60 --generic
