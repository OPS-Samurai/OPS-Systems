# 💻 OPS-SAMURAI Installer Control Module
## 🛠️ Prerequisites
This script requires a Linux-based operating system with `apt` package manager for automatic dependency installation. Manual installation of `zsh`, `git`, `curl`, and `unzip` may be necessary on systems without `apt` or if `apt` is not configured.

## ⚙️ Technical Details
This script automates the setup of a Zsh environment by performing the following actions:

1.  **Package Installation**:
    *   Checks for the presence of the `apt` package manager.
    *   If `apt` is found, it updates the package lists and installs `zsh`, `git`, `curl`, and `unzip`.
    *   If `apt` is not found, it skips this step and proceeds with the rest of the installation.

2.  **Zsh Plugin Management**:
    *   Ensures the existence of the `~/.zsh_plugins` directory.
    *   Clones `zsh-syntax-highlighting` from `https://github.com/zsh-users/zsh-syntax-highlighting.git` into `~/.zsh_plugins/zsh-syntax-highlighting` if it doesn't already exist.
    *   Clones `zsh-autosuggestions` from `https://github.com/zsh-users/zsh-autosuggestions.git` into `~/.zsh_plugins/zsh-autosuggestions` if it doesn't already exist.

3.  **Configuration File Symlinking**:
    *   Determines the absolute path of the `zshrc` configuration file located in the same directory as the script.
    *   Verifies that the source `zshrc` file exists; otherwise, it exits with an error.
    *   If a file named `.zshrc` exists in the user's home directory and is not already a symbolic link, it creates a backup of the existing file (e.g., `~/.zshrc.backup.<timestamp>`).
    *   Creates a symbolic link from the script's `zshrc` file to `~/.zshrc`, overwriting any existing link or file at that location.

## 🚀 Usage Protocols
To use this script, navigate to its directory within the `Setup` folder and execute it using a BASH-compatible shell.

```bash
./setup.sh
```

After the script completes, restart your shell session for the changes to take effect:

```bash
zsh
```
