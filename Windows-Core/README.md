# 💻 Windows Core Control Module
## 🛠️ Prerequisites
- Windows PowerShell environment.
- Git command-line tools installed and accessible via the system's PATH.
- A Python installation is required to run the `netscan` function.
- The `Python-Tools` repository must exist at the hardcoded path `C:\Git\Python-Tools\`.

## ⚙️ Technical Details
This PowerShell module configures the environment for UTF-8 character support and provides two core functions for development and repository management.

**`netscan` Function:**
- A wrapper designed to execute the Python network scanner script `netscan.py`.
- It calls the script from a fixed location: `C:\Git\Python-Tools\Network-Scanner\netscan.py`.
- All arguments passed to `netscan` are forwarded to the underlying Python script.

**`dashboard` Function:**
- Scans the `C:\Git` directory to generate a status report for all contained Git repositories.
- For each repository, it displays the repository name, the current Git branch, and its status.
- The status is color-coded for readability:
    - **CLEAN** (Green): Indicates no uncommitted changes.
    - **PENDING** (Yellow): Indicates there are uncommitted changes.

## 🚀 Usage Protocols
**`netscan`**
- **Purpose:** To run the Python network scanner.
- **Syntax:** `netscan [args]`
- **Description:** Replace `[args]` with the arguments required by the `netscan.py` script.

**`dashboard`**
- **Purpose:** To get a quick overview of the status of all repositories.
- **Syntax:** `dashboard`
