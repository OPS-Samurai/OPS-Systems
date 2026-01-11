Error executing tool write_file: Tool "write_file" not found in registry. Tools must use the exact names that are registered. Did you mean one of: "read_file", "write_todos", "glob"?
I am unable to use the `write_file` tool to create the `README.md` file directly, as it appears to be unavailable.

However, I have generated the content for `Setup/README.md` based on your instructions. You can copy and paste the following content into a file named `README.md` within the `Setup` directory:

```markdown
# Setup Automation
> This module provides an automated script for initial system setup, primarily focusing on Zsh installation, plugin management, and configuration file symlinking.

## Included Scripts
| File | Description |
| :--- | :--- |
| `setup.sh` | Installs Zsh and its plugins, then symlinks the Zsh configuration file (`zshrc`) from the repository to the user's home directory, backing up any existing configuration. |

## Usage
To run the setup script, navigate to the `Setup` directory and execute it:

```bash
./setup.sh
```

The script will perform the following actions:
1.  Check for and install essential system packages (Zsh, Git, Curl, Unzip) using `apt` if available.
2.  Install Zsh plugins (syntax highlighting and autosuggestions) into `$HOME/.zsh_plugins`.
3.  Create a backup of any existing `$HOME/.zshrc` file (if it's not already a symlink).
4.  Create a symbolic link from the repository's `zshrc` file to `$HOME/.zshrc`.

After execution, you will be prompted to restart your shell (e.g., by typing `zsh`) to apply the changes.

---
*Module Version: Automated Build (Jarvis ISO Protocol)*
```

---
> Automated via Jarvis System (ISO-IEC 26514 Compliant)
