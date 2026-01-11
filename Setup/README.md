# 💻 OPS-SAMURAI Installer Control Module
## 🛠️ Prerequisites
- `bash` shell environment.
- `sudo` privileges for package installation.
- `apt` package manager (for Debian-based systems) if system updates and dependencies are to be installed.
- `git` for cloning Zsh plugins.
- `curl` and `unzip` (installed via `apt` if available).
- The `zshrc` configuration file must be present in the same directory as the `setup.sh` script.

## ⚙️ Technical Details
This script automates the setup of a Zsh environment, including plugin installation and configuration file linking.

1.  **Color Definitions**: Defines ANSI escape codes for colored output in the terminal (`GREEN`, `BLUE`, `RED`, `NC`).
2.  **System Initialization Message**: Displays a blue "Starting System Initialization..." message.
3.  **Base Package Check & Installation**:
    *   Checks for the presence of the `apt` command.
    *   If `apt` is found, it executes `sudo apt update && sudo apt install -y zsh git curl unzip` to update package lists and install necessary packages (zsh, git, curl, unzip).
    *   If `apt` is not found, a warning message is displayed, and package installation is skipped.
4.  **Plugin Directory Creation**: Creates the `$HOME/.zsh_plugins` directory if it does not already exist.
5.  **Zsh Plugin Installation**:
    *   **Zsh Syntax Highlighting**: Clones the `zsh-users/zsh-syntax-highlighting` repository into `$HOME/.zsh_plugins/zsh-syntax-highlighting` if the directory does not exist.
    *   **Zsh Autosuggestions**: Clones the `zsh-users/zsh-autosuggestions` repository into `$HOME/.zsh_plugins/zsh-autosuggestions` if the directory does not exist.
6.  **Configuration File Linking**:
    *   Defines `TARGET` as `$HOME/.zshrc`.
    *   Dynamically determines `SCRIPT_DIR` as the absolute path to the directory containing `setup.sh`.
    *   Defines `SOURCE` as `$SCRIPT_DIR/zshrc`.
    *   **Source File Validation**: Checks if the `SOURCE` file exists; if not, an error is displayed, and the script exits.
    *   **Backup Existing `.zshrc`**: If a file named `.zshrc` exists in the home directory and is not already a symbolic link, it is moved to a timestamped backup file (e.g., `.zshrc.backup.<timestamp>`).
    *   **Create Symlink**: Creates a symbolic link from the `SOURCE` configuration file (`$SCRIPT_DIR/zshrc`) to the `TARGET` location (`$HOME/.zshrc`), using the `-sf` flags to force (overwrite existing symlinks) and create a symbolic link.
7.  **Deployment Completion**: Displays a success message and instructs the user to restart their shell for changes to take effect.

## 🚀 Usage Protocols
To deploy the Zsh configuration and plugins:

1.  Navigate to the directory containing the `setup.sh` script and the `zshrc` configuration file.
2.  Execute the script from the terminal:
    ```bash
    ./setup.sh
    ```
3.  After the script completes, restart your shell by typing:
    ```bash
    zsh
    ```
    or by opening a new terminal session to load the new Zsh configuration.
