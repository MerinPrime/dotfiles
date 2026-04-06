#!/bin/bash
set -e

echo "Checking package list..."

if [ "$EUID" -eq 0 ]; then
  echo "Error: Do not run this script as root."
  exit 1
fi

if ! command -v paru &>/dev/null; then
  echo "Installing paru..."
  sudo pacman -Sy --needed --noconfirm paru
fi

PACKAGE_FILE="{{ .chezmoi.sourceDir }}/packages.txt"
PACKAGES=$(grep -vE "^\s*#|^\s*$" "$PACKAGE_FILE" | tr '\n' ' ')

MISSING_PACKAGES=$(pacman -T $PACKAGES || true)

if [ -z "$MISSING_PACKAGES" ]; then
  echo "All packages are already installed. Skipping."
  exit 0
fi

echo "Updating pacman databases..."
sudo pacman -Sy

echo "Installing missing packages: $MISSING_PACKAGES"
paru -S --noconfirm $MISSING_PACKAGES

echo "Package installation complete."
