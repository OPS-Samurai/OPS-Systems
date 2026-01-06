# 🪟 Installation Guide (Windows)

**Zielsysteme:** Windows 10, Windows 11 (PowerShell).

---

## 1. Voraussetzungen & Python
Öffnen Sie PowerShell als **Administrator** und installieren Sie die Basispakete.

```powershell
winget install Git.Git Python.Python.3
```
Hinweis: Starten Sie PowerShell nach der Installation einmal komplett neu.

## 2. Git Einrichten & Klonen

Wir nutzen HTTPS für den schnellen Start ohne SSH-Keys.

### A. In das Home-Verzeichnis wechseln

```powershell
cd $HOME
```
### B. Repository klonen

```powershell
git clone [https://github.com/Anonjk1ng7/dotfiles.git](https://github.com/Anonjk1ng7/dotfiles.git)
```

## 3. Installation (Profil verbinden)

Wir binden Jarvis in Ihr Windows-Benutzerprofil ein.

### A. Profil-Pfad prüfen

Stellt sicher, dass der Ordner existiert.

```powershell
if (!(Test-Path (Split-Path $PROFILE))) {
    New-Item -ItemType Directory -Force -Path (Split-Path $PROFILE)
}
```

### B. Skripte erlauben

Windows blockiert standardmäßig eigene Skripte. Wir erlauben lokale Skripte:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```
(Bestätigen Sie die Abfrage mit "J" oder "A").

### C. Loader einbinden

Dieser Befehl verknüpft Ihr Profil mit dem Repository.

```powershell
Add-Content -Path $PROFILE -Value ". $HOME\dotfiles\windows\profile.ps1"
```

## 4. Abschluss & Test

Starten Sie PowerShell neu. Jarvis sollte Sie begrüßen.

### Testen der Tools


# System-Update
```powershell
sysup
```
# Hacking-Tool Test
```powershell
Invoke-PortScan -Target 8.8.8.8
```

## 5. Workflow (Updates)

### Updates holen (Pull)

Um Ihr Windows-System auf den Stand von Kali zu bringen:

```powershell
cd $HOME\dotfiles
git pull
. $PROFILE
```

### Änderungen hochladen (Push)

Auch von Windows aus können Sie Code hochladen:

```powershell
dotsync "Beschreibung der Änderung"
```
