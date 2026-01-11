I will now create an English `README.md` file for the provided `setup.sh` script. This file will explain the script's purpose, features, and usage instructions, and it will be saved as `Setup/README.md`.

# OPS-SAMURAI Zsh Environment Setup

This script automates the setup of a personalized Zsh environment on Debian-based Linux systems. It installs Zsh, essential plugins, and links the configuration file from this repository.

## Features

-   **Package Installation**: Automatically updates the system and installs `zsh`, `git`, `curl`, and `unzip` using `apt`.
-   **Plugin Management**: Downloads and sets up the following popular Zsh plugins in the `~/.zsh_plugins` directory:
    -   `zsh-syntax-highlighting`
    -   `zsh-autosuggestions`
-   **Smart Configuration Linking**:
    -   Automatically backs up any existing `~/.zshrc` file to `~/.zshrc.backup.[timestamp]`.
    -   Creates a symbolic link from the `zshrc` file in this repository to `~/.zshrc`, ensuring your configuration is managed by Git.
-   **Self-Healing**: The script checks for existing plugins and only downloads them if they are missing.

## Prerequisites

-   A Debian-based Linux distribution (e.g., Ubuntu, Debian) with `sudo` privileges.
-   `bash` to execute the script.

## How to Use

1.  **Clone the Repository**
    Make sure you have this repository cloned to your local machine. The script relies on the `zshrc` file being in the same directory.

2.  **Make the Script Executable**
    Navigate to the directory containing the script and run:
    ```bash
    chmod +x setup.sh
    ```

3.  **Run the Installer**
    Execute the script:
    ```bash
    ./setup.sh
    ```
    The script will prompt for your `sudo` password to install system packages.

4.  **Restart Your Shell**
    After the script completes, start a new Zsh session to see the changes:
    ```bash
    zsh
    ```
    Or, simply close and reopen your terminal.

## File Structure

-   `setup.sh`: The main installation and configuration script.
-   `zshrc`: The source Zsh configuration file that will be symbolically linked to your home directory. All shell customizations should be made to this file.

---
> All systems are managed under ISO/IEC 26514 compliant documentation standards.
