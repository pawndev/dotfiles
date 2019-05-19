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
xbindkeys
setxkbmap us -option compose:ralt
