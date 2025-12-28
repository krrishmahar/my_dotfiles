#!/usr/bin/env bash
# Robust Wayland clipboard watcher for cliphist

set -euo pipefail

while true; do
  wl-paste --watch bash -c '
    # If clipboard contains image → store only image
    if wl-paste -l | grep -q "^image/"; then
      wl-paste --type image | cliphist store
      exit 0
    fi

    # Otherwise store text, strip HTML/meta noise
    wl-paste --type text \
      | sed "/<meta http-equiv=/d" \
      | sed "/^<img src=/d" \
      | cliphist store
  '
done

