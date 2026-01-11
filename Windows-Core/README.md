## PowerShell Profile (`profile.ps1`)

### 1. Overview

This PowerShell script serves as a profile script, executed automatically at the start of each PowerShell session. It enhances the terminal experience with custom functions and settings.

The primary features include:
-   **UTF-8 Support**: Configures the console to correctly display UTF-8 characters, which is essential for modern multilingual text and emojis.
-   **Python Tool Integration**: Provides a convenient alias (`netscan`) to execute a Python-based network scanning tool.
-   **Git Repository Dashboard**: Introduces a `dashboard` function that provides a quick, at-a-glance overview of the status of all Git repositories located in a specified directory (`C:\Git`).

### 2. Prerequisites

Before using this script, ensure the following requirements are met:

-   **Operating System**: Windows with PowerShell.
-   **Git**: Git must be installed and accessible from the command line for the `dashboard` function to work correctly.
-   **Python**: A Python installation is required to use the `netscan` function.
-   **Repository Directory**: The `dashboard` function expects a root directory at `C:\Git` containing multiple Git repositories.
-   **Python Script**: The `netscan` function requires the existence of the script at `C:\Git\Python-Tools\Network-Scanner\netscan.py`.

### 3. Usage

Since this is a profile script, the functions defined within it are automatically available in your PowerShell session.

#### **`dashboard` Function**

This function scans all Git repositories located under `C:\Git` and reports their current status.

**Command:**
```powershell
dashboard
```

**Output:**
The command lists each repository, its current branch, and its status:
-   **CLEAN** (Green): The working directory is clean; there are no uncommitted changes.
-   **PENDING** (Yellow): There are uncommitted changes in the working directory.

Example:
```
--- 🦅 JARVIS REPOSITORY DASHBOARD ---
[OPS-Systems                ] (main      ) -> CLEAN
[My-Project                 ] (develop   ) -> PENDING
---------------------------------------
```

#### **`netscan` Function**

This function acts as a shortcut to run the `netscan.py` Python script. It passes any arguments directly to the Python script.

**Command:**
```powershell
netscan [arguments]
```

**Example:**
To scan a specific IP range, you might use:
```powershell
netscan 192.168.1.1/24
```
*(Note: The exact arguments depend on the implementation of `netscan.py`)*
