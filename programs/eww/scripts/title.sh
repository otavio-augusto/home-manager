#!/bin/bash

socat -u UNIX-CONNECT:/$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
    hyprctl activewindow -j | jq .title | sed -E 's/^(.{77}).*$/\1.../; t; s/.*/&/'
done
