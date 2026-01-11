# Linux Module

## Overview
This README provides an overview of the customizations made to the zsh shell configuration. The configuration is designed to provide a robust and efficient environment for system administration and development.

### Core Settings
The core settings section includes:

* Auto-loading colors
* Setting prompt substitution on
* Customizing the prompt with a blue cyan background, red and yellow text, and a green cursor

### History Settings (Optimized for Kali)
This section optimizes zsh history settings for use on a Kali Linux system:

* Exporting HISTFILE to $HOME/.zsh_history
* Setting HISTSIZE and SAVEHIST to 1,000,000
* Enabling append history and sharing history between shells

### Modules & Plugins (Relative & Robust)
This section loads .sh files from the bash subdirectory of ~/Git/OPS-Systems:

* Loading .sh files using `source`
* Unsetting nullglob option after loading files

### Python Path & Tools
This section adds Python tools to the PATH environment variable:

* Adding paths from $HOME/Git/OPS-Systems/python/general and $HOME/Git/OPS-Systems/python/hacking
* Updating the PATH environment variable with the new paths

### Plugins Loaded (Not Installed, Setup Script Handles Installation)
This section loads plugins for zsh:

* Loading fzf.zsh if present
* Loading zsh-autosuggestions and zsh-syntax-highlighting plugins if present

### OPS-SAMURAI SYNC ENGINE
The sync engine script is designed to synchronize the local repository with GitHub & GitLab:

* Checking if the current working directory matches ~/Git/OPS-Systems/Git
* If true, performing a manual sync and pushing changes to origin/main
* If false, displaying an error message

---
> All systems are managed under ISO/IEC 26514 compliant documentation standards via Local AI.
