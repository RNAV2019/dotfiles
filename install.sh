#!/bin/zsh

# Define source and target directories
SOURCE_DIR="config"
TARGET_DIR="$HOME/.config"

# Ensure the target directory exists
mkdir -p "$TARGET_DIR"

# Copy the helix and ghostty directories
for DIR in "helix" "ghostty"; do
  if cp -r "$SOURCE_DIR/$DIR" "$TARGET_DIR"; then
    echo "Successfully copied $DIR to $TARGET_DIR."
  else
    echo "Failed to copy $DIR." >&2
    exit 1
  fi
done

# Add a line to the end of ~/.zshrc to notify or include something if needed
LINE_TO_ADD='alias hx="hx -c ~/dotfiles/config/helix/config.toml"'
if ! grep -Fxq "$LINE_TO_ADD" "$HOME/.zshrc"; then
  echo "$LINE_TO_ADD" >> "$HOME/.zshrc"
  echo "Added hx config alias to ~/.zshrc."
else
  echo "hx config already present in ~/.zshrc."
fi

# Confirm installation completion
echo "Installation completed successfully. Your config files are now in $TARGET_DIR."
