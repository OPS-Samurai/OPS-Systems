# OPS-Systems

Dieses Repository bündelt eine Sammlung von Konfigurationen, Skripten und Tools, die darauf abzielen, die Systemeinrichtung, Sicherheitsprotokolle und täglichen Betriebsabläufe auf verschiedenen Betriebssystemen (insbesondere Linux und Windows) zu optimieren und zu automatisieren. Es umfasst plattformübergreifende Einstellungen, Dotfiles für Linux (Zsh), PowerShell-Profile für Windows und Skripte zur Dokumentationsgenerierung.

## Installation

Die Installation hängt vom jeweiligen Betriebssystem und den gewünschten Komponenten ab.

### Linux

Für Linux-Systeme bieten die `setup.sh` und `install.sh` Skripte im `Linux/` und `Setup/` Verzeichnis eine automatisierte Einrichtung von Zsh, zugehörigen Plugins und der Verknüpfung von Konfigurationsdateien.

1.  **Voraussetzungen:** `git`, `zsh`, `python` (für Dokumentationsgenerierung).
2.  **Installation:**
    ```bash
    # Beispiel für die Ausführung des Setup-Skripts
    ./Linux/setup.sh
    # Oder das allgemeine Installer-Skript
    ./Setup/install.sh
    ```

### Windows

Das PowerShell-Profil `Windows-Core/profile.ps1` integriert verschiedene Funktionen und Tools, einschließlich einer Anbindung an Python-basierte Netzwerkscanner.

1.  **Voraussetzungen:** `Python` (für `netscan.py` im `Python-Tools` Repository).
2.  **Einrichtung:** Kopieren Sie den Inhalt von `profile.ps1` in Ihr PowerShell-Profil oder verlinken Sie es entsprechend.

### VS Code

Die Datei `Cross-Platform/VS-Code/settings.json` enthält empfohlene Einstellungen für Visual Studio Code zur Optimierung der Entwicklungsumgebung.

## Skripte & Funktionen

| Dateiname                   | Funktion                                           | Beschreibung                                                                                              |
| :-------------------------- | :------------------------------------------------- | :-------------------------------------------------------------------------------------------------------- |
| `Linux/setup.sh`            | System-Initialisierung für Linux                   | Installiert Zsh, Zsh-Plugins und verlinkt Konfigurationsdateien aus dem Git-Repository.                 |
| `Linux/zshrc`               | Zsh-Konfigurationsdatei                            | Hauptkonfigurationsdatei für die Zsh-Shell, beinhaltet Aliase, Funktionen und Plugin-Einstellungen.      |
| `Setup/gendocs.py`          | Dokumentation generieren (Python)                  | Ein Python-Skript zur automatisierten Generierung von README-Dokumentationen basierend auf der Projektstruktur und Dateiinhalten. |
| `Setup/gendocs.sh`          | Dokumentation generieren (Bash)                    | Ein Bash-Skript, das README-Dokumentation aus Zsh-Konfigurationsdateien extrahiert und generiert.         |
| `Setup/install.sh`          | Zsh Dotfiles und Plugins installieren (Linux)      | Umfassendes Installationsskript zur Einrichtung der Zsh-Dotfiles und zugehöriger Plugins auf Linux-Systemen. |
| `Windows-Core/profile.ps1`  | PowerShell-Profil & Python-Tools-Integration       | Konfiguriert das PowerShell-Profil für Windows, inklusive Integration von Python-basierten Tools wie `netscan.py`. |

## Ordnerstruktur

```
.
├── Cross-Platform
│   ├── Git
│   │   └── .gitignore_global
│   └── VS-Code
│       └── settings.json
├── Linux
│   ├── setup.sh
│   └── zshrc
├── Setup
│   ├── gendocs.py
│   ├── gendocs.sh
│   ├── INSTALL_LINUX.md
│   ├── INSTALL_WINDOWS.md
│   └── install.sh
├── Windows-Core
│   └── profile.ps1
├── alias_export.csv
├── GEMINI_TASK.txt
├── README.md
├── system_manifest.json
└── system_profile.yaml
```
