#!/usr/bin/env bash

function run {
    if ! pgrep $1 > /dev/null ;
    then
        $@&
    fi
}

run mopidy
run nm-applet
run compton -b --config ~/.config/compton/compton.conf
run dunst --config ~/.config/dunst/dunstrc &
run blueman-applet
run indicator-sound-switcher
xbindkeys
setxkbmap us -option compose:ralt
easystroke enable &

wacom_id=$( xsetwacom list | grep 'Wacom Intuos BT S Pad pad' | grep -Eo '[0-9]{1,2}')

if [[ -v wacom_id ]]; then
  echo "Wacom ID: ${wacom_id}"

  xsetwacom set $wacom_id Button 1 8
  xsetwacom set $wacom_id Button 2 9
  xsetwacom set $wacom_id Button 3 11
  xsetwacom set $wacom_id Button 8 10
fi

