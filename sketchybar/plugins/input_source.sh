#!/bin/sh
ENGLISH="U.S."
TELEX="com.apple.inputmethod.VietnameseSimpleTelex"

WESTERN_LANGUAGE=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep 'KeyboardLayout Name' | sed -E 's/^.+ = \"?([^\"]+)\"?;$/\1/')

# If the current language is not western one, then check a different variable
EASTERN_LANGUAGE=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep -w 'Input Mode' | head -1 | sed -E 's/^.+ = \"?([^\"]+)\"?;$/\1/')


if [$WESTERN_LANGUAGE = $ENGLISH]; then
  LABEL="US"
elif [$EASTERN_LANGUAGE = $TELEX]; then
  LABEL="VN"
fi

sketchybar --set $NAME icon=􀇳 label="$LABEL"
