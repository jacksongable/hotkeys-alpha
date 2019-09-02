#!/bin/bash

KEYCODE_KP_UP=80
KEYCODE_KP_DOWN=88

KEYCODE_KP_LEFT=83
KEYCODE_KP_RIGHT=85

ACTION_INCR_VOL=XF86AudioRaiseVolume
ACTION_DECR_VOL=XF86AudioLowerVolume

ACTION_INCR_MON_BRIGHT=XF86MonBrightnessUp
ACTION_DECR_MON_BRIGHT=XF86MonBrightnessDown

ACTION_KP_8=KP_8
ACTION_KP_2=KP_2
ACTION_KP_4=KP_4
ACTION_KP_6=KP_6

function hot() {
	xmodmap -e "keycode $KEYCODE_KP_UP = $ACTION_INCR_VOL"
	xmodmap -e "keycode $KEYCODE_KP_DOWN = $ACTION_DECR_VOL"
	xmodmap -e "keycode $KEYCODE_KP_LEFT = $ACTION_DECR_MON_BRIGHT"
	xmodmap -e "keycode $KEYCODE_KP_RIGHT = $ACTION_INCR_MON_BRIGHT"
	
}

function cold() {
	xmodmap -e "keycode $KEYCODE_KP_UP = $ACTION_KP_8"
	xmodmap -e "keycode $KEYCODE_KP_DOWN = $ACTION_KP_2"
	xmodmap -e "keycode $KEYCODE_KP_LEFT = $ACTION_KP_4"
	xmodmap -e "keycode $KEYCODE_KP_RIGHT = $ACTION_KP_6"
	
}

if [ $# -eq 0 ]
then
	printf "Usage:\n\tkpctl hot\tActivates keypad hotkeys\n\tkpctl cold\tDeactivates keypad hotkeys\n"
	exit 1
elif [ $1 == 'hot' ]
then
	hot
elif [ $1 == 'cold' ]
then
	cold
else
	printf "Invalid option. Please use hot or cold.\n"
	exit
fi

printf "Keypad hotkeys updated.\n"
exit 0

