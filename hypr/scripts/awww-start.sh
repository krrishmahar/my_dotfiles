#!/usr/bin/env bash
set -e

# Kill any stale daemon
killall  awww-daemon 2>/dev/null || true

# Wait until Hyprland is really ready
# for i in {1..50}; do
#   if hyprctl monitors >/dev/null 2>&1; then
#     break
#   fi
#   sleep 0.1
# done

# Extra safety: ensure at least one monitor exists
until hyprctl monitors | grep -q "Monitor"; do
   sleep 0.1
done

# Start daemon
exec awww-daemon
