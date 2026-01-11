# OPS-Samurai Zsh Environment Setup

This repository contains a setup script to configure a Zsh environment with useful plugins and settings. The script is designed to automate the installation and configuration process on Debian-based Linux systems.

## Overview

The `setup.sh` script automates the following tasks:
- **System Update & Dependencies**: Updates the package list and installs `zsh`, `git`, `curl`, and `unzip`.
- **Plugin Installation**: Clones essential Zsh plugins (`zsh-syntax-highlighting` and `zsh-autosuggestions`) into the `~/.zsh_plugins` directory.
- **Configuration Symlinking**: Backs up any existing `~/.zshrc` file and creates a symbolic link to the `zshrc` file included in this repository.

## Prerequisites

- A Debian-based Linux distribution (e.g., Ubuntu, Debian) with `apt` package manager.
- `sudo` privileges to install system packages.

## Usage

1.  Clone this repository to your local machine.
2.  Navigate to the directory containing the script.
3.  Make the script executable:
    ```bash
    chmod +x setup.sh
    ```
4.  Run the installer:
    ```bash
    ./setup.sh
    ```

## How It Works

1.  **System Initialization**: The script begins by checking for and installing necessary packages (`zsh`, `git`, `curl`, `unzip`) using `apt`. If `apt` is not found, this step is skipped.

2.  **Plugin Management**: It ensures the plugin directory `~/.zsh_plugins` exists. It then checks for `zsh-syntax-highlighting` and `zsh-autosuggestions` and clones them from their GitHub repositories if they are not already present.

3.  **Configuration Linking**:
    - The script identifies the location of the repository's `zshrc` file.
    - It checks if you have an existing `~/.zshrc` file.
    - If a regular file (not a symlink) exists at `~/.zshrc`, it is backed up with a timestamp (e.g., `~/.zshrc.backup.1672531200`).
    - Finally, it creates a symbolic link from `~/.zshrc` to the `zshrc` file in this project, ensuring your shell uses the repository's configuration.

## Post-Installation

After the script completes, you must restart your shell for the changes to take effect. You can do this by closing and reopening your terminal or by running:

```bash
zsh
```

---
> All systems are managed under ISO/IEC 26514 compliant documentation standards.
