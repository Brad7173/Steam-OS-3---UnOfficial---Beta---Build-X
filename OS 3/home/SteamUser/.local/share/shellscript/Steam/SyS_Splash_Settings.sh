#!/bin/bash
#created by Katie M. Nelson 3/30/24
UserPath=$(echo "/home/""$USER")
System_Start=$(sed -n '1p' < $UserPath/.local/share/shellscript/Steam/Steam_Splash_Screens.conf)
Log_out=$(sed -n '2p' <  $UserPath/.local/share/shellscript/Steam/Steam_Splash_Screens.conf)
Rebooting=$(sed -n '3p' <  $UserPath/.local/share/shellscript/Steam/Steam_Splash_Screens.conf)
Shutting_Down=$(sed -n '4p' <  $UserPath/.local/share/shellscript/Steam/Steam_Splash_Screens.conf)
Switch_Users=$(sed -n '5p' <  $UserPath/.local/share/shellscript/Steam/Steam_Splash_Screens.conf)
Hibernating=$(sed -n '6p' <  $UserPath/.local/share/shellscript/Steam/Steam_Splash_Screens.conf)
Loading_Steam=$(sed -n '7p' <  $UserPath/.local/share/shellscript/Steam/Steam_Splash_Screens.conf)
input=$(yad \
	--form \
	--skip-taskbar \
	--single-click \
	--center \
	--on-top \
	--fixed \
	--hscroll-policy=never \
	--vscroll-policy=never \
	--title="Splash Screens" \
	--width=189 \
	--height=170\
	--window-icon=$UserPath/.local/share/icons/Steam/icons/steam114.png \
	--field="System_Start":CHK "$System_Start" \
	--field="Log_out":CHK "$Log_out" \
	--field="Rebooting":CHK "$Rebooting" \
	--field="Shutting_Down":CHK "$Shutting_Down" \
	--field="Switch_Users":CHK "$Switch_Users" \
	--field="Hibernating":CHK "$Hibernating" \
	--field="Loading_Steam":CHK "$Loading_Steam" \
--button="            UPDATE             :2"  \
2>/dev/null
);return_code=$?
Var1=$(printf '%s\n' "$label" "${input[@]}")
echo $Var1  | tr '|' '\n' | sed -r '/^\s*$/d' > $UserPath/.local/share/shellscript/Steam/Steam_Splash_Screens.conf
