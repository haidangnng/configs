#!/bin/bash

update() {
  source "$CONFIG_DIR/colors.sh"
  COLOR=$(get_color RED 50)
  if [ "$SELECTED" = "true" ]; then
    COLOR=$(get_color RED)
  fi
  space_highlight=(
    icon.highlight=$SELECTED
    label.highlight=$SELECTED
  )
  sketchybar --set $NAME "${space_highlight[@]}" 
}

mouse_clicked() {
  if [ "$BUTTON" = "right" ]; then
    yabai -m space --destroy $SID
    sketchybar --trigger windows_on_spaces --trigger space_change
  else
    yabai -m space --focus $SID 2>/dev/null
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
