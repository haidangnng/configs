#!/bin/bash
# ==========================
# GENERATED FROM GPT - 27/08/2025
# ==========================

# ==========================
# Logging functions
# ==========================
log() {
  echo -e "\033[1;34m[INFO]\033[0m $1"
}

error() {
  echo -e "\033[1;31m[ERROR]\033[0m $1"
}

# ==========================
# Track failures
# ==========================
failed_installs=()

# ==========================
# Parse packages.sh
# ==========================
log "Processing packages.sh..."

# Collapse backslash-continued lines into full commands
collapsed_commands=()
current_line=""

while IFS= read -r line || [ -n "$line" ]; do
  # Remove leading/trailing whitespace
  line="$(echo "$line" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"

  # Skip comments or empty lines
  [[ "$line" =~ ^#.*$ || -z "$line" ]] && continue

  if [[ "$line" == *\\ ]]; then
    # Line ends with backslash – append without it
    current_line+="${line%\\} "
  else
    # Final line of the command
    current_line+="$line"
    collapsed_commands+=("$current_line")
    current_line=""
  fi
done < packages.sh

# ==========================
# Process each command
# ==========================
for full_cmd in "${collapsed_commands[@]}"; do
  if [[ "$full_cmd" =~ ^brew\ install\ --cask ]]; then
    current_mode="cask"
    packages="${full_cmd//brew install --cask/}"
  elif [[ "$full_cmd" =~ ^brew\ install ]]; then
    current_mode="regular"
    packages="${full_cmd//brew install/}"
  else
    continue
  fi

  for pkg in $packages; do
    if [[ "$current_mode" == "regular" ]]; then
      log "Installing $pkg..."
      if brew list "$pkg" &>/dev/null; then
        log "$pkg already installed. Skipping."
      else
        if ! brew install "$pkg"; then
          error "Failed to install $pkg"
          failed_installs+=("$pkg")
        fi
      fi
    elif [[ "$current_mode" == "cask" ]]; then
      log "Installing cask $pkg..."
      if brew list --cask "$pkg" &>/dev/null; then
        log "$pkg already installed. Skipping."
      else
        if ! brew install --cask "$pkg"; then
          error "Failed to install cask $pkg"
          failed_installs+=("$pkg (cask)")
        fi
      fi
    fi
  done
done

# ==========================
# Apply macOS defaults
# ==========================
log "Applying macOS defaults..."

apply_default() {
  description="$1"
  shift
  if ! "$@"; then
    error "Failed: $description"
    failed_installs+=("macOS: $description")
  fi
}

apply_default "set screenshot format to jpg" defaults write com.apple.screencapture type jpg
apply_default "disable Preview restore" defaults write com.apple.Preview ApplePersistenceIgnoreState YES
apply_default "show ~/Library folder" chflags nohidden ~/Library
apply_default "show hidden files" defaults write com.apple.finder AppleShowAllFiles YES
apply_default "show path bar in Finder" defaults write com.apple.finder ShowPathbar -bool true
apply_default "show status bar in Finder" defaults write com.apple.finder ShowStatusBar -bool true
apply_default "hide desktop icons" defaults write com.apple.finder CreateDesktop false
apply_default "remove dock icons" defaults write com.apple.dock persistent-apps -array
apply_default "restart Finder" killall Finder
apply_default "restart Dock" killall Dock


# ==========================
# Summary
# ==========================
echo
if [ ${#failed_installs[@]} -ne 0 ]; then
  echo -e "\033[1;31m[SUMMARY] The following items failed to install or configure:\033[0m"
  for item in "${failed_installs[@]}"; do
    echo "- $item"
  done
else
  echo -e "\033[1;32m[SUCCESS] All packages and settings applied successfully.\033[0m"
fi

