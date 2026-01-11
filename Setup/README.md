## **ISO Documentation: `setup.sh` - Zsh Environment Installer**

---

#### **1. Overview**

The `setup.sh` script is a hybrid installer designed to automate the configuration of a Zsh (Z Shell) environment on a Linux-based system. Its primary function is to prepare the system by installing necessary dependencies, deploying essential Zsh plugins, and linking a custom `zshrc` configuration file from this repository to the user's home directory.

The script is designed with safety and idempotency in mind:
*   **Dependency Management**: It attempts to install required packages (`zsh`, `git`, `curl`, `unzip`) using the `apt` package manager.
*   **Idempotent Plugin Installation**: It checks for the existence of plugins before attempting to download them, preventing redundant operations.
*   **Safe Configuration Linking**: It automatically backs up any existing `.zshrc` file before creating a symbolic link, preventing accidental data loss.
*   **Dynamic Path Resolution**: It intelligently locates the source configuration file relative to its own position, ensuring it works regardless of where the repository is cloned.

---

#### **2. Prerequisites**

To ensure the script runs successfully, the following conditions must be met:

*   **Operating System**: A Debian-based Linux distribution (e.g., Ubuntu, Debian) with the `apt` package manager is recommended. The script contains a fallback for other systems, but the automatic installation of dependencies will be skipped.
*   **User Permissions**: The user must have `sudo` privileges, as the script requires administrative rights to update the system and install packages.
*   **Required Tools**: `git` must be installed or installable on the system for cloning Zsh plugins.
*   **Repository Structure**: The script requires the source `zshrc` configuration file to be present in the same directory (`/Setup`) from which the script is executed.

---

#### **3. Usage**

Follow these steps to execute the installer script:

1.  **Navigate to the Script Directory**:
    Open a terminal and change to the directory containing the script.
    ```bash
    cd Setup/
    ```

2.  **Make the Script Executable**:
    Grant execution permissions to the script file.
    ```bash
    chmod +x setup.sh
    ```

3.  **Run the Installer**:
    Execute the script. You will be prompted for your `sudo` password to proceed with package installation.
    ```bash
    ./setup.sh
    ```
    The script will display its progress as it updates packages, clones plugins, and links the configuration file.

4.  **Reload Shell**:
    After the script completes successfully, you must restart your terminal or run the following command to load the new Zsh configuration:
    ```bash
    zsh
    ```
