# 📝 OPS-SAMURAI Installer Script
This script automates the initial setup for an OPS-SAMURAI environment, focusing on Zsh, its plugins, and linking configuration files from the Git repository. It includes self-healing logic for plugin installation and intelligent backup handling for existing configuration files.

## 🛠️ Prerequisites
- A Debian/Ubuntu-based system with `apt` package manager installed.
- Internet connectivity for cloning Git repositories and downloading packages.

The script will attempt to install the following packages if `apt` is found:
- `zsh`
- `git`
- `curl`
- `unzip`

## ⚙️ Technical Details
The `setup.sh` script performs the following operations:
1.  **System Initialization & Package Check:**
    *   Checks for the presence of the `apt` package manager.
    *   If `apt` is available, it performs a system update (`sudo apt update`) and installs essential packages (`zsh`, `git`, `curl`, `unzip`). If `apt` is not found, this step is skipped.
2.  **Plugin Installation (Self-Healing):**
    *   Ensures the existence of the `~/.zsh_plugins` directory.
    *   Checks if `zsh-syntax-highlighting` is present in the plugin directory. If not, it clones the repository from `https://github.com/zsh-users/zsh-syntax-highlighting.git`.
    *   Checks if `zsh-autosuggestions` is present in the plugin directory. If not, it clones the repository from `https://github.com/zsh-users/zsh-autosuggestions.git`.
3.  **Configuration File Linking (Intelligent Backup):**
    *   Dynamically determines the script's directory to locate the source `zshrc` file within the repository.
    *   Sets the target for the symbolic link to `~/.zshrc`.
    *   Verifies that the source `zshrc` file exists; otherwise, the script exits with an error.
    *   If an existing `~/.zshrc` file is found and it is not already a symbolic link, a timestamped backup is created (e.g., `~/.zshrc.backup.<timestamp>`).
    *   A symbolic link is created (or updated, with force overwrite) from the repository's `zshrc` file to `~/.zshrc`.
4.  **Completion:**
    *   Informs the user that deployment is complete and prompts to restart the shell to apply changes.

## 🚀 Usage (Examples)
To execute the installer script, navigate to the `Setup` directory and run the script:

```bash
cd Setup/
bash setup.sh
```

After successful execution, restart your Zsh shell to load the new configuration and plugins:

```bash
zsh
```
