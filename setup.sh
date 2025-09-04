#!/bin/bash

# ==========================
# GENERATED FROM GPT - 28/08/2025
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
# Install prerequisites
# ==========================
log "Checking for Homebrew..."

if ! command -v brew &>/dev/null; then
  log "Homebrew not found. Installing Homebrew..."
  if ! /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
    error "Failed to install Homebrew"
    failed_installs+=("Homebrew")
  fi
else
  log "Homebrew already installed. Skipping."
fi

log "Checking for Oh My Zsh..."

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  log "Installing Oh My Zsh..."
  if ! sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; then
    error "Failed to install Oh My Zsh"
    failed_installs+=("Oh My Zsh")
  fi
else
  log "Oh My Zsh already installed. Skipping."
fi

# ==========================
# Embedded Brew Package List
# ==========================
read -r -d '' PACKAGE_LIST <<'EOF'
brew install \
  yazi \
  nvm \
  pnpm \
  neovim \
  ripgrep \
  eza \
  atuin \
  zoxide \
  jandedobbeleer/oh-my-posh/oh-my-posh

brew install --cask \
  raycast \
  bitwarden \
  google-chrome  \
  firefox \
  wezterm \
  visual-studio-code \
  docker \
  discord \
  keycastr \
  notunes \
  mos \
  spotify \
  nikitabobko/tab/aerospace
EOF

# ==========================
# Parse and Collapse Commands
# ==========================
log "Processing embedded package list..."

collapsed_commands=()
current_line=""

while IFS= read -r line || [ -n "$line" ]; do
  line="$(echo "$line" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"
  [[ "$line" =~ ^#.*$ || -z "$line" ]] && continue

  if [[ "$line" == *\\ ]]; then
    current_line+="${line%\\} "
  else
    current_line+="$line"
    collapsed_commands+=("$current_line")
    current_line=""
  fi
done <<< "$PACKAGE_LIST"

# ==========================
# Process Each Command
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
