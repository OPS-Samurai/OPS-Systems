# 🖥️ OPS-Systems | Central Environment Configuration

Zentrale "Source of Truth" für plattformübergreifende Systemkonfigurationen (Infrastructure-as-Code Prinzip).

## 📊 Architektur & Struktur
Dieses Repository folgt dem Prinzip der **Separation of Concerns**. Konfigurationen (Environment) sind strikt von funktionalen Werkzeugen (Toolkits) getrennt.

* **[🐧 Linux/](./Linux/)**: Dotfiles & Shell-Konfigurationen (`.zshrc`, `.bashrc`, `.aliases`).
* **[🪟 Windows-Core/](./Windows-Core/)**: PowerShell-Kernkonfigurationen (`profile.ps1`) und Registry-Härtung.
* **[🔄 Setup/](./Setup/)**: Automatisierte Deployment-Skripte für Greenfield-Installationen.

## 🛠️ Technische Voraussetzungen (Prerequisites)
Um diese Konfigurationen vollumfänglich zu nutzen, werden folgende Basiskomponenten empfohlen:
* **Shells**: PowerShell 7.x+ (Windows), ZSH (Linux/Unix).
* **Tools**: Git, SSH-Client (OpenSSH), Curl/Wget.
* **Terminal**: Windows Terminal oder Oh-My-Zsh Integration.

## 🚀 Installation & Deployment
### Windows (PowerShell)
```powershell
# Beispiel zur Einbindung des Profils
. "$HOME\OPS-Systems\Windows-Core\profile.ps1"