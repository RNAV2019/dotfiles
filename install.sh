#!/usr/bin/env bash

# Check if gum is installed
if ! command -v gum &> /dev/null; then
    echo "Gum is not installed. Please install it first (e.g., 'pacman -S gum')."
    exit 1
fi

# Configuration
DOTFILES_DIR=$(pwd)
PACKAGES=("bash" "fum" "ghostty" "helix" "hypr" "matugen" "music" "omarchy" "swayosd" "swww" "waybar")

# Welcome Screen
clear
gum style \
	--foreground 212 --border-foreground 212 --border double \
	--align center --width 50 --margin "1 2" --padding "2 4" \
	"📦 DOTFILES INSTALLER" "Managed with GNU Stow"

# Ask for installation type
CHOICE=$(gum choose "Install All Packages" "Select Specific Packages" "Exit")

if [ "$CHOICE" == "Exit" ]; then
    echo "Installation cancelled."
    exit 0
fi

# Determine which packages to install
if [ "$CHOICE" == "Install All Packages" ]; then
    TO_INSTALL=("${PACKAGES[@]}")
else
    TO_INSTALL=$(gum choose --no-limit "${PACKAGES[@]}")
fi

# Confirm Action
if [ -z "$TO_INSTALL" ]; then
    gum style --foreground 196 "No packages selected. Exiting."
    exit 0
fi

gum confirm "Ready to symlink $(echo $TO_INSTALL | wc -w) packages. Proceed?" || exit 0

# Execution Loop
echo ""
for pkg in $TO_INSTALL; do
    gum spin --spinner dot --title "Stowing $pkg..." -- sleep 0.5
    if stow "$pkg"; then
        gum style --foreground 46 "  ✔ $pkg"
    else
        gum style --foreground 196 "  ✖ $pkg (Failed or already exists)"
    fi
done

gum style \
	--foreground 212 --border-foreground 212 --border rounded \
	--align center --width 50 --margin "1 2" --padding "1 2" \
	"✨ Deployment Complete!"
