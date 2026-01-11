# 📝 profile.ps1
This PowerShell script provides utility functions designed to integrate external tools and display repository statuses.

## 🛠️ Prerequisites
- PowerShell environment.
- Git command-line tools must be installed and accessible in the system's PATH.
- Python runtime must be installed for Python-based tools.

---

## ⚙️ Technical Details

### `netscan` Function
A wrapper function to execute the Python-based port scanner `netscan.py`.

- **Alias:** `netscan`
- **Functionality:** It forwards all provided arguments (`@args`) directly to the Python script.
- **Dependency:** Requires the script to be located at `C:\Git\Python-Tools\Network-Scanner\netscan.py`.

### `dashboard` Function
Displays a summary of the Git status for all repositories located in a specified directory.

- **Alias:** `dashboard`
- **Functionality:**
    - Iterates through each subdirectory within `C:\Git`.
    - For each directory, it retrieves the current Git branch and status.
    - It prints a formatted line showing the repository name, current branch, and status.
- **Status Indicators:**
    - **CLEAN** (Green): The repository has no pending changes.
    - **PENDING** (Yellow): The repository has unstaged or uncommitted changes.

## 🚀 Usage

### Example 1: Using `netscan`
To scan a specific IP address and port range, pass them as arguments.

```powershell
netscan 192.168.1.1 -p 22,80,443
```

### Example 2: Displaying the Dashboard
To view the status of all repositories:

```powershell
dashboard
```

**Example Output:**

```
--- 🦅 JARVIS REPOSITORY DASHBOARD ---
[OPS-Systems                ] (main      ) -> CLEAN
[Project-X                  ] (develop   ) -> PENDING
[API-Service                ] (feature/auth) -> CLEAN
---------------------------------------
```
