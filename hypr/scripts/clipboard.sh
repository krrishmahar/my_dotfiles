#!/usr/bin/env bash

cliphist list \
  | rofi -dmenu -i -p "Clipboard" -selected-row 0 \
  | cliphist decode \
  | wl-copy

