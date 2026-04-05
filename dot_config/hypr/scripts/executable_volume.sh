#!/bin/bash

get_vol() {
  pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -1
}

get_mute() {
  pactl get-sink-mute @DEFAULT_SINK@ | grep -Po 'Mute: \Kyes|no'
}

CUR_VOL=$(get_vol)

case $1 in
raise)
  if [ "$CUR_VOL" -ge 100 ]; then
    pactl set-sink-volume @DEFAULT_SINK@ 100%
  else
    pactl set-sink-volume @DEFAULT_SINK@ +5%
  fi
  ;;
lower)
  if [ "$CUR_VOL" -le 5 ]; then
    pactl set-sink-volume @DEFAULT_SINK@ 0%
  else
    pactl set-sink-volume @DEFAULT_SINK@ -5%
  fi
  ;;
mute)
  pactl set-sink-mute @DEFAULT_SINK@ toggle
  ;;
esac

NEW_VOL=$(get_vol)
IS_MUTE=$(get_mute)

if [ "$IS_MUTE" = "yes" ]; then
  notify-send -e -h string:x-canonical-private-synchronous:volume "Volume: Muted"
else
  notify-send -e -h int:value:"$NEW_VOL" -h string:x-canonical-private-synchronous:volume "Volume: $NEW_VOL%"
fi
