# 💻 setup.sh Control Module
> This script automates the installation and configuration of Zsh, including essential plugins, and links the Zsh configuration file from the Git repository to the user's home directory.

## 🛠️ Prerequisites
-   **Operating System**: Debian/Ubuntu-based Linux distribution (due to `apt` package manager usage).
-   **Tools**: `sudo`, `apt` (for package installation), `git`, `curl`, `unzip`.
-   **User Permissions**: The script utilizes `sudo` for system package installations, requiring appropriate user privileges.

## ⚙️ Technical Details
The script performs the following operations:

1.  **System Initialization**:
    *   Checks for the presence of the `apt` package manager.
    *   If `apt` is found, it updates the package list (`sudo apt update`) and installs `zsh`, `git`, `curl`, and `unzip` if they are not already present (`sudo apt install -y ...`).
    *   If `apt` is not found, a warning message is displayed, and package installation is skipped.
2.  **Plugin Installation**:
    *   Creates a directory `$HOME/.zsh_plugins` if it does not exist.
    *   **Zsh Syntax Highlighting**: Clones the `zsh-users/zsh-syntax-highlighting` repository into `$HOME/.zsh_plugins/zsh-syntax-highlighting` if the directory does not exist.
    *   **Zsh Autosuggestions**: Clones the `zsh-users/zsh-autosuggestions` repository into `$HOME/.zsh_plugins/zsh-autosuggestions` if the directory does not exist.
3.  **Configuration File Linking**:
    *   Determines the absolute path of the `zshrc` configuration file within the current script's directory.
    *   Verifies that the source `zshrc` file exists; otherwise, it exits with an error.
    *   **Backup**: If a file named `$HOME/.zshrc` exists and is not already a symbolic link, it creates a backup of the existing file, appending `.backup.` and a Unix timestamp to its name.
    *   **Symlink Creation**: Creates a symbolic link from the repository's `zshrc` file to `$HOME/.zshrc`, overwriting any existing link or file with the `-sf` flag.

## 🚀 Usage Protocols
To execute the script:

1.  Navigate to the directory containing `setup.sh` (e.g., `cd Setup`).
2.  Make the script executable if necessary:
    ```bash
    chmod +x setup.sh
    ```
3.  Run the script from the terminal:
    ```bash
    ./setup.sh
    ```
4.  After the script completes, restart your shell for the changes to take effect:
    ```bash
    zsh
    ```
