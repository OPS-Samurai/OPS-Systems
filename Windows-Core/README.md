# 💻 netscan Control Module
## 🛠️ Prerequisites
- Python environment installed and configured.
- `netscan.py` script available at `C:\Git\Python-Tools\Network-Scanner\netscan.py`.

## ⚙️ Technical Details
This module provides a convenient wrapper to execute the `netscan.py` Python script. It facilitates the execution of a Python-based port scanner by passing any provided arguments directly to the underlying Python script. The `Console::OutputEncoding` is set to UTF-8 to ensure proper character display.

## 🚀 Usage Protocols
To initiate the network scan, invoke the `netscan` command, optionally followed by arguments intended for the `netscan.py` Python script.

`netscan <python_script_arguments>`

# 💻 dashboard Control Module
## 🛠️ Prerequisites
- Git version control system installed and configured.
- Git repositories are expected to reside within the `C:\Git` directory.

## ⚙️ Technical Details
The `dashboard` module provides an overview of the status of local Git repositories. It iterates through each subdirectory within `C:\Git`, treating them as Git repositories. For each repository, it retrieves the current branch and checks for pending changes using `git status --porcelain`. The output presents each repository's name, its active branch, and an indicator ("CLEAN" for no pending changes, "PENDING" for uncommitted modifications), color-coded for quick visual assessment. The `Console::OutputEncoding` is set to UTF-8 to ensure proper character display.

## 🚀 Usage Protocols
Execute the `dashboard` command to display the status of all configured Git repositories. No arguments are required.

`dashboard`
