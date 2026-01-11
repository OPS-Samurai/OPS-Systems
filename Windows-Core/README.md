```markdown
# PowerShell Profile

This repository contains a `profile.ps1` script designed to enhance your PowerShell environment with custom functions and configurations, specifically tailored for managing Git repositories and integrating Python tools.

## Features

### UTF-8 Support

Ensures proper display of emojis and special characters in the console output by setting the console's output encoding to UTF-8.

```powershell
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
```

### Python Tools Integration: Network Scanner (`netscan`)

Integrates a Python-based network port scanner (`netscan.py`) as a callable function within your PowerShell session. This allows you to execute the Python script directly from PowerShell using the `netscan` command.

**Usage:**

```powershell
netscan <python_script_arguments>
```

**Example:**

```powershell
netscan --target 192.168.1.1 --ports 80,443
```

### Daily Dashboard (`dashboard`)

Provides a quick overview of your local Git repositories. It scans a specified directory (`C:\Git` by default), checks the Git status of each repository, and displays the current branch and its status (CLEAN or PENDING changes).

**Usage:**

Simply type `dashboard` in your PowerShell console:

```powershell
dashboard
```

**Example Output:**

```
--- 🦅 JARVIS REPOSITORY DASHBOARD ---
[RepoNameOne              ] (main      ) -> CLEAN
[AnotherProject           ] (dev       ) -> PENDING
---------------------------------------
```

**Configuration:**

The `dashboard` function is configured to look for repositories in `C:\Git`. You can modify the `$repoPath` variable within the `profile.ps1` script to point to your desired parent directory containing your Git repositories.

```powershell
$repoPath = "C:\Git" # Change this path to your repository root
```
```

---
> All systems are managed under ISO/IEC 26514 compliant documentation standards.
