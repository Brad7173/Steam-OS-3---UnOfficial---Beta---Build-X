#!/bin/bash
#created by Katie M. Nelson 3/31/24
UserPath=$(echo "/home/""$USER")
yad --icons \
	--title="Settings" \
	--window-icon=$UserPath/.local/share/icons/Steam/icons/steam114.png \
	--skip-taskbar \
	--on-top \
	--no-buttons \
	--single-click \
	--center \
	--fixed \
	--hscroll-policy=never \
	--vscroll-policy=never \
	--read-dir=$UserPath/.local/share/shellscript/Steam/System_Settings \
	--width=300 --height=210 --item-width=60 --generic
