#!/bin/bash

if [ "$SHELL" != "/usr/bin/fish" ]; then
  echo "--- Changing default shell to fish ---"
  chsh -s /usr/bin/fish
fi

mkdir -p ~/.local/share/applications
cp /usr/share/applications/org.gnome.Nautilus.desktop ~/.local/share/applications/

sed -i 's/Exec=nautilus/Exec=nautilus --new-window/g' ~/.local/share/applications/org.gnome.Nautilus.desktop
