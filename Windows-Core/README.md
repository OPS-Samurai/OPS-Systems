# 💻 Windows Core Profile Control Module
## 🛠️ Prerequisites
- A PowerShell environment is required for script execution.
- **Git:** The `dashboard` function requires Git to be installed and accessible in the system's PATH.
- **Python:** The `netscan` function requires a Python installation.
- **Directory Structure:** The script expects a specific directory layout:
    - `C:\Git\` for the `dashboard` function to locate repositories.
    - `C:\Git\Python-Tools\Network-Scanner\netscan.py` must exist for the `netscan` function.

## ⚙️ Technical Details
This PowerShell profile script enhances the terminal experience by providing custom functions. It sets the console's output encoding to UTF-8 to ensure proper character and emoji rendering.

### Function: `netscan`
- **Purpose:** Acts as a wrapper to execute the `netscan.py` Python script.
- **Implementation:** It invokes the Python interpreter and passes all provided arguments (`@args`) directly to the specified script located at `C:\Git\Python-Tools\Network-Scanner\netscan.py`.

### Function: `dashboard`
- **Purpose:** Displays a status overview of all Git repositories located in the `C:\Git` directory.
- **Implementation:** The function iterates through each subdirectory of `C:\Git`. For each directory, it retrieves the current Git branch (`git branch --show-current`) and checks for uncommitted changes (`git status --porcelain`).
- **Output:** It prints a formatted list to the console:
    - **CLEAN (Green):** Indicates the repository has no pending changes.
    - **PENDING (Yellow):** Indicates the repository has uncommitted changes.

## 🚀 Usage Protocols
The functions are made available automatically when a new PowerShell session is started.

### `netscan`
- **Command:** `netscan [arguments]`
- **Description:** Executes the Python port scanner. Any arguments provided will be passed to the `netscan.py` script.

### `dashboard`
- **Command:** `dashboard`
- **Description:** Displays the status summary of all local Git repositories.
