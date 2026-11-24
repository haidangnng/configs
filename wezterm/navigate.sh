#!/usr/bin/env bash

# Navigate between Wezterm panes and fall back to Aerospace
# Usage: navigate.sh <pane_id> <direction>

pane_id=$1
direction=$2

# Debug log
LOG="/tmp/wezterm_nav.log"
echo "$(date): Called with pane_id=$pane_id direction=$direction" >> "$LOG"

# Map direction to wezterm/aerospace format
case $direction in
  h) cmd_dir="left" ;;
  j) cmd_dir="down" ;;
  k) cmd_dir="up" ;;
  l) cmd_dir="right" ;;
  *) 
    echo "$(date): Invalid direction" >> "$LOG"
    exit 1 
    ;;
esac

echo "$(date): Mapped to cmd_dir=$cmd_dir" >> "$LOG"

# Use full path to wezterm
WEZTERM_BIN="/opt/homebrew/bin/wezterm"

# The current pane ID is what we're starting from
current_pane="$pane_id"
echo "$(date): Starting from pane: $current_pane" >> "$LOG"

# Check if the starting pane is currently active (should be, since we're running from it)
is_active_before=$($WEZTERM_BIN cli list --format json | jq -r ".[] | select(.pane_id == $current_pane) | .is_active")
echo "$(date): Pane $current_pane is_active before: $is_active_before" >> "$LOG"

# Try to move in wezterm from the specified pane
$WEZTERM_BIN cli activate-pane-direction --pane-id "$pane_id" "$cmd_dir" 2>&1 >> "$LOG"

# Check if our starting pane is still active after trying to move
is_active_after=$($WEZTERM_BIN cli list --format json | jq -r ".[] | select(.pane_id == $current_pane) | .is_active")
echo "$(date): Pane $current_pane is_active after: $is_active_after" >> "$LOG"

# If the pane is still active, we didn't move (at the edge)
if [ "$is_active_before" = "true" ] && [ "$is_active_after" = "true" ]; then
  # Didn't move, we're at the edge - try aerospace
  echo "$(date): No pane in direction, calling aerospace focus $cmd_dir" >> "$LOG"
  /opt/homebrew/bin/aerospace focus "$cmd_dir" 2>/dev/null
  echo "$(date): Aerospace called" >> "$LOG"
else
  # Get which pane is now active
  new_active=$($WEZTERM_BIN cli list --format json | jq -r '[.[] | select(.is_active == true)] | .[0].pane_id')
  echo "$(date): Wezterm pane activated successfully (moved from $current_pane to $new_active)" >> "$LOG"
fi
