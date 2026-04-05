#!/bin/bash

cliphist list | wofi --dmenu --prompt "Clip History" | cliphist decode | wl-copy
