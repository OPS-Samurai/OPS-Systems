# Setup Module

## Overview
OPS-SAMURAI INSTALLER (v3.0 - Hybrid)
=========================================

This script installs Zsh, plugins, and links the config from a Git repository.

## Setup
The setup process consists of four steps:

### 1. System Updates & Dependencies
Prune basis packages using `apt` or report an error if `apt` is not found.
Install required packages: zsh, git, curl, unzip (using `sudo apt install -y` if necessary).

### 2. Plugins Installation
Check for plugins and clone them from Git repositories:
	* zsh-syntax-highlighting
	* zsh-autosuggestions

### 3. Backup & Symlinks
Create symlinks to config files:
	* Verlinkt die Konfigurationsdateien...
Backup existing `.zshrc` file (if it exists) and rename it.

### 4. Conclusion
The deployment is complete.
Please restart the shell: `zsh`

## Notes

- The script uses Bash as its scripting language.
- It utilizes Git to clone plugins from repositories.
- It creates symlinks to config files, overwriting existing ones (if necessary).
- The script reports errors and warnings using colors.

**Run with caution!**

Please note that this README.md file is a generated translation of the original setup script. For any issues or questions, please refer to the original code or contact the author.

---
> All systems are managed under ISO/IEC 26514 compliant documentation standards via Local AI.
