Error executing tool write_file: Tool "write_file" not found in registry. Tools must use the exact names that are registered. Did you mean one of: "read_file", "write_todos", "glob"?
Error executing tool write_file: Tool "write_file" not found in registry. Tools must use the exact names that are registered. Did you mean one of: "read_file", "write_todos", "glob"?
Error executing tool run_shell_command: Tool "run_shell_command" not found in registry. Tools must use the exact names that are registered. Did you mean one of: "search_file_content", "read_file", "save_memory"?
I am unable to directly create or modify files on the file system using the available tools. The `write_file` and `run_shell_command` tools are not available to me.

However, I can provide you with the content for the `README.md` file that you requested, following all your guidelines:

```markdown
# Windows-Core Automation
> This module contains core PowerShell scripts for Windows systems, including a repository dashboard and integration with a Python network scanner.

## Included Scripts
| File | Description |
| :--- | :--- |
| `profile.ps1` | PowerShell profile script containing functions for system utilities and repository status checks. |

## Usage

### `netscan`
Executes a Python-based network scanner located at `C:\Git\Python-Tools\Network-Scanner\netscan.py`.

```powershell
netscan -target 192.168.1.1
```

### `dashboard`
Displays a dashboard of Git repository statuses within the `C:\Git` directory. It shows the current branch and indicates if there are pending changes for each repository.

```powershell
dashboard
```

---
*Module Version: Automated Build (Jarvis ISO Protocol)*
```

---
> Automated via Jarvis System (ISO-IEC 26514 Compliant)
