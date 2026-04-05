#!/bin/sh

class=$(playerctl metadata --player=spotify --format '{{lc(status)}}')
info=$(playerctl metadata --player=spotify --format '{{artist}} - {{title}}')
icon=" "
pause_icon=" "

if [[ $class == "playing" ]]; then
  if [[ ${#info} > 40 ]]; then
    info=$(echo $info | cut -c1-40)"..."
  fi
  text=$icon$info
elif [[ $class == "paused" ]]; then
  text=$pause_icon$info
elif [[ $class == "stopped" ]]; then
  text="wtf stopped?"
fi

echo -e "{\"text\":\""$text"\", \"class\":\""$class"\"}"
