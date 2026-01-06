# 🦅 Jarvis Dotfiles

**Status:** Operational 🟢  
**Standard:** ISO/IEC 26514 compliant documentation.  
**Architecture:** Modular Configuration Management for SysAdmins & Cybersec Analysts.

---

## 🛠️ Repository-Struktur
Gemäß dem Masterplan für eine saubere Trennung von Betriebssystemen und Tools:

* **`Linux/`**: Konfigurationen für Bash und ZSH (Aliase, Functions).
* **`Windows-Core/`**: Das Herzstück der PowerShell-Umgebung (`profile.ps1`).
* **`Cross-Platform/`**: Globale Settings für VS Code und Git-Ignors.
* **`Setup/`**: Automatisierte Bootstrapping-Skripte für Neuinstallationen.

---

## 🚀 Installation & Deployment

### 🪟 Windows (PowerShell)
Um Jarvis in Ihr lokales System einzubinden, nutzen wir den zentralen Workspace unter `C:\Git`.

1.  **Skripte erlauben:**
    ```powershell
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
    ```

2.  **Profil verbinden (Loader):**
    Führen Sie diesen Befehl aus, um die Konfiguration permanent zu verknüpfen:
    ```powershell
    Add-Content -Path $PROFILE -Value ". 'C:\Git\OPS-Systems\Windows-Core\profile.ps1'"
    ```

### 🐧 Linux (Bash/Zsh)
Verknüpfen Sie die zentrale Konfiguration mit Ihrem Home-Verzeichnis:
```bash
ln -s /path/to/OPS-Systems/Linux/.zshrc ~/.zshrc