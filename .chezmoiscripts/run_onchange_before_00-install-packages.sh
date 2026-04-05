#!/bin/bash
set -e

echo "--- Update repositories ---"
sudo pacman -Syu

if ! command -v paru &>/dev/null; then
  echo "--- Install Paru (from CachyOS repo) ---"
  sudo pacman -S --needed --noconfirm paru
fi

PKGS=()

# --- [CORE] ---
PKGS+=(fish starship fastfetch eza bat fd ripgrep btop ddcutil lm_sensors)
PKGS+=(git lazygit github-cli)
PKGS+=(unzip zip p7zip unrar tar gzip bzip2 xz)
PKGS+=(ffmpegthumbnailer gst-libav libheif resvg)
PKGS+=(libldac libfreeaptx)
PKGS+=(snapper snap-pac grub-btrfs)
PKGS+=(tree-sitter neovim)

# --- [DEV] ---
PKGS+=(nodejs npm pnpm bun python uv ruff wget)

# --- [SYSTEM SERVICES] ---
PKGS+=(networkmanager linux-cachyos-nvidia-open pipewire pipewire-pulse wireplumber bluez bluez-utils zram-generator)

# --- [FONTS] ---
PKGS+=(ttf-jetbrains-mono ttf-jetbrains-mono-nerd noto-fonts-emoji ttf-sarasa-gothic)

# --- [DESKTOP] ---
PKGS+=(catppuccin-gtk-theme-git papirus-icon-theme bibata-cursor-theme-bin)
PKGS+=(hyprland waybar swaybg mako wofi wl-clipboard cliphist mate-polkit hyprpicker grimblast greetd greetd-tuigreet)

# --- [APPS] ---
PKGS+=(
  kitty
  nautilus sushi gvfs gvfs-mtp gvfs-google
  loupe
  overskride-bin
  pwvucontrol
  showtime
  fragments
)

# --- [EXTRA APPS] ---
PKGS+=(zen-browser-bin amneziavpn-bin spotify discord telegram-desktop gdlauncher-carbon-bin)
PKGS+=(steam proton-cachyos-slr)
PKGS+=(ollama openai-codex gemini-cli)

echo "--- Installing all packages ---"
paru -S --needed --noconfirm "${PKGS[@]}"

