# 💻 OPS-SAMURAI INSTALLER Control Module
## 🛠️ Prerequisites
- A Debian-based Linux distribution with `apt` package manager for automatic dependency installation.
- `sudo` privileges may be required for package installation.
- Internet connectivity to clone Git repositories for Zsh plugins.

## ⚙️ Technical Details
This script, `setup.sh`, automates the initial setup for a Zsh environment, including system updates, package installation, Zsh plugin deployment, and configuration file management.

1.  **System Initialization**:
    *   Initiates the setup process with a system initialization message.
2.  **Package Verification & Installation**:
    *   Checks for the presence of the `apt` package manager.
    *   If `apt` is available, it performs a system update (`sudo apt update`) and installs essential packages: `zsh`, `git`, `curl`, and `unzip`.
    *   If `apt` is not found, a warning is issued, and package installation is skipped.
3.  **Zsh Plugin Deployment**:
    *   Ensures the existence of the `$HOME/.zsh_plugins` directory.
    *   Clones `zsh-syntax-highlighting` from `https://github.com/zsh-users/zsh-syntax-highlighting.git` into `$HOME/.zsh_plugins/zsh-syntax-highlighting` if not already present.
    *   Clones `zsh-autosuggestions` from `https://github.com/zsh-users/zsh-autosuggestions.git` into `$HOME/.zsh_plugins/zsh-autosuggestions` if not already present.
4.  **Configuration Symlink Management**:
    *   Identifies the target Zsh configuration file as `$HOME/.zshrc`.
    *   Determines the source `zshrc` configuration file relative to the script's location.
    *   Verifies that the source configuration file exists; otherwise, the script terminates with an error.
    *   **Backup Procedure**: If an existing non-symlinked `$HOME/.zshrc` file is found, a timestamped backup is created (e.g., `$HOME/.zshrc.backup.<timestamp>`).
    *   **Symlink Creation**: Creates or updates a symbolic link from the source `zshrc` to `$HOME/.zshrc`, ensuring the user's Zsh configuration is managed from the Git repository.

## 🚀 Usage Protocols
1.  **Execution**: Navigate to the directory containing `setup.sh` and execute the script from a bash-compatible shell:
    ```bash
    ./setup.sh
    ```
2.  **Post-Installation**: After the script completes, restart your shell session to apply the new Zsh configuration and loaded plugins. This can typically be done by running:
    ```bash
    zsh
    ```
