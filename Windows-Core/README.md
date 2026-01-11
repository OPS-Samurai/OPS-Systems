# 💻 netscan Control Module
## 🛠️ Prerequisites
- Python installed and accessible in the system's PATH.
- The `netscan.py` script available at `C:\Git\Python-Tools\Network-Scanner\netscan.py`.

## ⚙️ Technical Details
This module executes the Python script `netscan.py` located in the `C:\Git\Python-Tools\Network-Scanner\` directory. It passes any provided arguments directly to the Python script.

## 🚀 Usage Protocols
To use the netscan module, execute:
```powershell
netscan [arguments]
```
Replace `[arguments]` with any parameters required by the `netscan.py` script.

---

# 💻 dashboard Control Module
## 🛠️ Prerequisites
- Git installed and configured on the system.
- PowerShell environment.
- The base directory `C:\Git` must exist and contain Git repositories.

## ⚙️ Technical Details
This module provides a summary dashboard for Git repositories located under `C:\Git`.
- Sets `[Console]::OutputEncoding` to `[System.Text.Encoding]::UTF8` for correct emoji display.
- Iterates through each subdirectory within `C:\Git`.
- For each directory, it performs the following Git operations:
    - `git status --porcelain`: Checks for uncommitted changes.
    - `git branch --show-current`: Retrieves the active branch name.
- Based on the Git status, it displays the repository name, current branch, and an indicator (`PENDING` or `CLEAN`) with color-coded feedback (Yellow for `PENDING`, Green for `CLEAN`).
- Utilizes `Push-Location` and `Pop-Location` to safely navigate into and out of each repository directory during the status check.

## 🚀 Usage Protocols
To display the JARVIS Repository Dashboard, execute:
```powershell
dashboard
```
This command will print a summary of all Git repositories found under `C:\Git`, showing their current branch and whether they have pending changes.
