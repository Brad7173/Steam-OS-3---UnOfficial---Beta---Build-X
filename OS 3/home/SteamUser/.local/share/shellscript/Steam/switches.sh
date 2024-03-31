#!/bin/bash
#Created by Katie M. Nelson
#A shellscript to intercept shutdown command and switches,
#to execute custom script then process the shutdown command and switches
Switch=""
while getopts akrhPHfFncqQt: name
do
    case $name in
    a)    aflag=1;;	#use /etc/shutdown.allow
    k)    kflag=1;; #don't really shutdown, only warn.
    r)    rflag=1;; #reboot after shutdown
    h)    hflag=1;; #halt after shutdown
    P)    Pflag=1;; #halt action is to turn off power..can only be used along with -h flag.
    H)    Hflag=1;; #halt action is to just halt. 
    f)    fflag=1;; #do a 'fast' reboot (skip fsck).
    F)    Fflag=1;; #Force fsck on reboot.
    n)    nflag=1;; #do not go through "init" but go down real fast.
    c)    cflag=1;; #cancel a running shutdown.
    q)    qflag=1;; #quiet mode - display fewer shutdown warnings.
    Q)    Qflag=1;; #full quiet mode - display only final shutdown warning.
    t)    tflag=1   #secs: delay between warning and kill signal..the "time" argument is mandatory!
    	  tval="$OPTARG";;
    ?)    printf "Usage: %s: [-a] [-t value] args\n" $0
          exit 2;;
    esac
done
if [ ! -z "$aflag" ]; then
	Switch=$(echo "$Switch""-a ")
fi
if [ ! -z "$kflag" ]; then
	Switch=$(echo "$Switch""-k ")
fi
if [ ! -z "$rflag" ]; then
	Switch=$(echo "$Switch""-r ")
fi
if [ ! -z "$hflag" ]; then
	Switch=$(echo "$Switch""-h ")
fi
if [ ! -z "$Pflag" ]; then
	Switch=$(echo "$Switch""-P ")
fi
if [ ! -z "$Hflag" ]; then
	Switch=$(echo "$Switch""-H ")
fi
if [ ! -z "$fflag" ]; then
	Switch=$(echo "$Switch""-f ")
fi
if [ ! -z "$Fflag" ]; then
	Switch=$(echo "$Switch""-F ")
fi
if [ ! -z "$nflag" ]; then
	Switch=$(echo "$Switch""-n ")
fi
if [ ! -z "$cflag" ]; then
	Switch=$(echo "$Switch""-c ")
fi
if [ ! -z "$qflag" ]; then
	Switch=$(echo "$Switch""-q ")
fi
if [ ! -z "$Qflag" ]; then
	Switch=$(echo "$Switch""-Q ")
fi
if [ ! -z "$tflag" ]; then
	Switch=$(echo "$Switch""-t "$tval)
fi
shift $(($OPTIND - 1))
echo "switches used=" $Switch
#/sbin/ shutdown $Switch
exit
