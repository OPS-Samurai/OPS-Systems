# 🛠️ SysAdmin Dotfiles

Persönliche Konfigurationsdateien und Shell-Erweiterungen für Linux (Kali/Debian), optimiert für Systemadministration und Security-Audits.

## 🚀 Installation (Automated)

Dieses Repository enthält ein Installations-Skript, das automatisch Backups der bestehenden Konfiguration erstellt und die neuen Dotfiles verlinkt (`symlink`).

```bash
# 1. Repository klonen
git clone [https://github.com/Anonjk1ng7/dotfiles.git](https://github.com/Anonjk1ng7/dotfiles.git) ~/dotfiles

# 2. In das Verzeichnis wechseln
cd ~/dotfiles

# 3. Installer ausführen
chmod +x install.sh
./install.sh

# 4. Shell neu laden
source ~/.zshrc
📦 Features
Custom Functions
logusr
Filtert die /etc/passwd und zeigt nur "echte" Benutzer (UID >= 1000) sowie root an. System-Accounts (wie daemon, www-data) werden ausgeblendet.

Nutzung:

Bash

$ logusr
root
samurai
...
Safety Features
Das install.sh Skript überschreibt keine vorhandenen Dateien blind.

Backup: Existierende Konfigs werden automatisch nach ~/.dotfiles_backup_<TIMESTAMP>/ verschoben.

Symlinks: Es werden symbolische Verknüpfungen genutzt (via ln -s), sodass Änderungen im dotfiles-Ordner sofort aktiv sind.

📂 Struktur
zshrc: Hauptkonfiguration für Zsh.

install.sh: Deployment-Skript mit Backup-Funktion.

Status: Active / Maintainer: Anonjk1ng7 EOF
