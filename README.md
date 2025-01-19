# Dotfiles

This repository contains my custom configuration files for various tools and environments. The `install.sh` script automates the setup process, ensuring everything is correctly configured and ready to use.

## Features

- **Helix Editor**: Includes a custom configuration for Helix stored in `config/helix`.
- **Ghostty**: Custom terminal themes or configurations stored in `config/ghostty`.
- **Alias Setup**: Automatically adds an alias for Helix to use the custom configuration file.

## Installation

### Prerequisites

Ensure you have the following installed:
- **zsh**: The script is designed for `zsh` as the default shell.
- **Helix Editor**: Required to use the `hx` alias.
- **Git**: To clone the repository.

### Steps

1. Clone this repository:
   ```bash
   git clone https://github.com/RNAV2019/dotfiles.git ~/dotfiles
   ```

2. Navigate to the repository:
   ```bash
   cd ~/dotfiles
   ```

3. Run the installation script:
   ```bash
   ./install.sh
   ```

### What the Script Does

- **Copies Configurations**:
  - Copies `config/helix` and `config/ghostty` directories into `$HOME/.config`.
- **Updates `~/.zshrc`**:
  - Adds the following alias to your `~/.zshrc`:
    ```bash
    alias hx="hx -c ~/dotfiles/config/helix/config.toml"
    ```

## Usage

### Helix Editor
After installation, you can launch Helix with your custom configuration using the `hx` alias:
```bash
hx <filename>
```

### Custom Configurations
- **Helix**: The configuration file is located at `~/dotfiles/config/helix/config.toml`.
- **Ghostty**: Terminal themes or other settings are located in `~/dotfiles/config/ghostty`.

## Troubleshooting

- **Duplicate Alias in `~/.zshrc`**: The script checks for the alias before adding it to avoid duplicates. If the alias doesn’t work as expected, ensure the line is correctly added to your `~/.zshrc`.
- **Permission Issues**: If you encounter permission errors, ensure the script is executable:
  ```bash
  chmod +x install.sh
  ```

## Customization

Feel free to modify the `install.sh` script or the configuration files to suit your preferences. This repository is designed to be a starting point for managing and sharing your dotfiles.
