#!/bin/bash

if pgrep -x "wofi" >/dev/null; then
  pkill -x "wofi"
else
  cliphist list | wofi --dmenu --prompt "Clip History" | cliphist decode | wl-copy
fi
