#!/bin/bash

wofi_cmd="wofi --dmenu --allow-images --insensitive --width 400 --hide-scroll"

if pgrep -x "wofi" >/dev/null; then
    pkill -x "wofi"
    exit 0
fi

if [ -z "$1" ]; then
    declare -A menu
    menu=(
        ["󰀻  Applications"]="apps"
        ["󱓞  Commands"]="run"
        ["󹑑  Clipboard"]="clip"
        ["󰐥  Power Menu"]="power"
    )

    choice=$(printf "%s\n" "${!menu[@]}" | $wofi_cmd --prompt "Mode Selection")
    mode=${menu[$choice]}
else
    mode="$1"
fi

case "$mode" in
    apps) wofi --show drun ;;
    run)  wofi --show run ;;
    clip)
        item=$(cliphist list | $wofi_cmd --prompt "Clipboard")
        [ -n "$item" ] && echo "$item" | cliphist decode | wl-copy
        ;;
    power)
        pwr=$(printf "Log out\nReboot\nShutdown" | $wofi_cmd --prompt "Power")
        case "$pwr" in
            "Log out") hyprctl dispatch exit ;;
            "Reboot") systemctl reboot ;;
            "Shutdown") systemctl poweroff ;;
        esac
        ;;
esac
