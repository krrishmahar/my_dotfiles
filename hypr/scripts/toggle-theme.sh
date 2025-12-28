#!/usr/bin/env bash

STATE_FILE="$HOME/.cache/theme_state"
LIGHT_WALL="$HOME/Pictures/wallpapers/light.png"
DARK_WALL="$HOME/Pictures/wallpapers/dark.png"

mkdir -p "$(dirname "$STATE_FILE")"

CURRENT=$(cat "$STATE_FILE" 2>/dev/null || echo "dark")

COMMON_OPTS=(
  --transition-type wave
  --transition-fps 90
  --transition-step 2
  --transition-duration 1.2
  --transition-bezier .54,0,.34,.99
)

if [[ "$CURRENT" == "dark" ]]; then
  echo "light" > "$STATE_FILE"

  gsettings set org.gnome.desktop.interface color-scheme prefer-light
  gsettings set org.gnome.desktop.interface gtk-theme Adwaita

  awww img "$LIGHT_WALL"  "${COMMON_OPTS[@]}" --transition-angle 45
else
  echo "dark" > "$STATE_FILE"

  gsettings set org.gnome.desktop.interface color-scheme prefer-dark
  gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark

  awww img "$DARK_WALL" "${COMMON_OPTS[@]}"  --transition-angle 135

fi

