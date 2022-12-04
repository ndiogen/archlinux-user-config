#!/bin/bash

function send_notification {
  icon="preferences-system-brightness-lock"
  brightness=$(light -G)
  dunstify -a "change_backlight" -i "$icon" -r 1000 -u normal -h int:value:${brightness%.*} "B"
}

case $1 in
  up)
    # increase the backlight by 5%
    light -A $2
    send_notification
    ;;
  down)
    # decrease the backlight by 5%
    light -U $2
    send_notification
    ;;
esac
