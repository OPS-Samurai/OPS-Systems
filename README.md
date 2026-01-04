# 🦅 Jarvis Dotfiles
Modulare System-Konfiguration für Cybersec & Sysadmin.

### 📚 Installation & Setup
| [🐧 Linux Guide](INSTALL_LINUX.md) | [🪟 Windows Guide](INSTALL_WINDOWS.md) |
|:---:|:---:|

---

## 🐧 Linux (Bash/Zsh)

### 📂 General
| Befehl | Beschreibung | Datei |
|---|---|---|
| **`g`** | Git-Aliase | `aliases.sh` |
| **`sysup`** | System-Update | `aliases.sh` |
| **`conf`** | Config-Editor | `aliases.sh` |
| **`dotsync`** | Automatischer Git-Sync | `aliases.sh` |

### 📂 Hacking
| Befehl | Beschreibung | Datei |
|---|---|---|
| **`myip`** | Zeigt öffentliche IP | `tools.sh` |
| **`extract`** | Universal-Entpacker | `tools.sh` |

## 🪟 Windows (PowerShell)

### 📂 General
| Befehl | Beschreibung | Datei |
|---|---|---|
| **`sysup`** | System-Update (Winget) | `tools.ps1` |
| **`myip`** | Öffentliche IP anzeigen | `tools.ps1` |
| **`ll`** | List List (wie ls -la) | `tools.ps1` |
| **`conf`** | Config bearbeiten (Smart: Code oder Notepad) | `tools.ps1` |
| **`dotsync`** | Dotfiles Sync (Windows Version) | `tools.ps1` |
| **`netscan`** | Port Scanner (Python) | `tools.ps1` |

### 📂 Hacking
| Befehl | Beschreibung | Datei |
|---|---|---|
| **`Invoke-PortScan`** | Schneller TCP-Portscanner (Native PowerShell) | `portscan.ps1` |

## 🐍 Python (Cross-Platform)

### 📂 Hacking
| Befehl | Beschreibung | Datei |
|---|---|---|
| **`netscan.py`** | Einfacher TCP Port-Scanner (Python) | `netscan.py` |