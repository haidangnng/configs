#!/bin/bash

input=(
  script="$PLUGIN_DIR/input.sh"
  icon.font="$FONT:Regular:19.0"
  padding_right=5
  padding_left=0
  label.drawing=off
  update_freq=120
  updates=on
)

sketchybar --add item input right      
           # --set input "${input[@]}" \
           # --subscribe input power_source_change system_woke
