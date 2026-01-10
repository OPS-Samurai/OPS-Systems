# 🚀 OPS-Systems

### Executive Summary

This repository centralizes a collection of configurations, scripts, and tools designed to optimize and automate system setup, security protocols, and daily operations across various operating systems, primarily Linux and Windows. It encompasses cross-platform settings, Dotfiles for Linux (Zsh), PowerShell profiles for Windows, and documentation generation scripts, all managed under ISO/IEC 26514 compliant documentation standards.

### Installation/Setup

Installation procedures are dependent on the specific operating system and desired components. Virtual environments are highly recommended for Python-based tools.

#### Linux

For Linux systems, the `setup.sh` and `install.sh` scripts located in the `Linux/` and `Setup/` directories, respectively, provide automated setup for Zsh, its plugins, and configuration file linking.

1.  **Prerequisites:** `git`, `zsh`, `python` (for documentation generation).
2.  **Installation Commands:**
    ```bash
    # Example for running the setup script
    ./Linux/setup.sh
    # Or the general installer script
    ./Setup/install.sh
    ```

#### Windows

The PowerShell profile `Windows-Core/profile.ps1` integrates various functionalities and tools, including an interface to Python-based network scanners.

1.  **Prerequisites:** `Python` (for `netscan.py` from the `Python-Tools` repository).
2.  **Setup:** Copy the content of `profile.ps1` into your PowerShell profile or link it accordingly.

#### VS Code

The `Cross-Platform/VS-Code/settings.json` file contains recommended settings for Visual Studio Code to optimize the development environment.

### Usage

#### Linux Scripts

*   `Linux/setup.sh`: Initiates system setup, installing Zsh, plugins, and linking configuration from the Git repo. Also handles system updates and dependencies.
*   `Linux/zshrc`: The primary configuration file for the Zsh shell, including aliases, functions, and plugin settings.

#### Setup Scripts

*   `Setup/gendocs.py`: A Python script for automated README documentation generation based on project structure and file contents. It defines the repository structure and points to relevant repos for documentation.
*   `Setup/gendocs.sh`: A Bash script that extracts and generates README documentation from Zsh configuration files.
*   `Setup/install.sh`: A comprehensive installation script for setting up Zsh dotfiles and associated plugins on Linux systems, handling system updates and dependencies.

#### Windows Scripts

*   `Windows-Core/profile.ps1`: Configures the PowerShell profile for Windows, including UTF-8 support and integration for Python tools like `netscan.py`.

### Inventory

| File                      | Description                                                                                                                                                                                             |
| :------------------------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `Linux/setup.sh`          | Installs Zsh, plugins, and links configuration from the Git repo. Also handles system updates and dependencies.                                                                                       |
| `Linux/zshrc`             | Main Zsh configuration file, including aliases, functions, and plugin settings.                                                                                                                         |
| `Setup/gendocs.py`        | Python script for automated README documentation generation based on project structure and file contents. It defines the repository structure and points to relevant repos for documentation. |
| `Setup/gendocs.sh`        | Bash script that extracts and generates README documentation from Zsh configuration files.                                                                                                                |
| `Setup/install.sh`        | Comprehensive installer for Zsh dotfiles and plugins on Linux systems, handling system updates and dependencies.                                                                                          |
| `Windows-Core/profile.ps1`| PowerShell profile for Windows, including UTF-8 support and integration for Python tools like `netscan.py`.                                                                                             |

### Ordnerstruktur

```
.
├── Cross-Platform
│   ├── Git
│   │   └── .gitignore_global
│   └── VS-Code
│       └── settings.json
├── Linux
│   ├── setup.sh
│   └── zshrc
├── Setup
│   ├── gendocs.py
│   ├── gendocs.sh
│   ├── INSTALL_LINUX.md
│   ├── INSTALL_WINDOWS.md
│   └── install.sh
├── Windows-Core
│   └── profile.ps1
├── alias_export.csv
├── GEMINI_TASK.txt
├── README.md
├── system_manifest.json
└── system_profile.yaml
```

---
All systems are managed under ISO/IEC 26514 compliant documentation standards.
