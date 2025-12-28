#!/usr/bin/env bash
cliphist decode <<<"$1" | wl-copy
eww close clipboard

