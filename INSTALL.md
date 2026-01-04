
# 🦅 Jarvis Installation Guide



Ein modulares Setup für **Linux (Kali/Mint/Ubuntu)** und **Windows**.



---



## 🐧 Linux Installation



### 1. Voraussetzungen

```bash

sudo apt update

sudo apt install git zsh tilix guake fonts-firacode -y

2. Installation

Bash



# Repo klonen (SSH empfohlen)

git clone git@github.com:Anonjk1ng7/dotfiles.git ~/dotfiles



# Zsh-Config verlinken (Backup falls nötig)

[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.bak

ln -sf ~/dotfiles/zshrc ~/.zshrc



# Skripte ausführbar machen

chmod +x ~/dotfiles/bash/**/*.sh

chmod +x ~/dotfiles/python/**/*.py



# Shell wechseln

chsh -s $(which zsh)

Nach dem erneuten Login ist Jarvis aktiv.



🪟 Windows Installation

1. Voraussetzungen

Öffne PowerShell als Administrator:



PowerShell



winget install Git.Git Python.Python.3

(Starte PowerShell danach neu).



2. Klonen

Öffne PowerShell (als normaler User):



PowerShell



cd $HOME

git clone [https://github.com/Anonjk1ng7/dotfiles.git](https://github.com/Anonjk1ng7/dotfiles.git)

3. Aktivierung (Profil verbinden)

Kopiere diesen Block in deine PowerShell:



PowerShell



# 1. Profil-Ordner erstellen

if (!(Test-Path (Split-Path $PROFILE))) { New-Item -ItemType Directory -Force -Path (Split-Path $PROFILE) }



# 2. Skripte erlauben

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser



# 3. Loader einbinden

Add-Content -Path $PROFILE -Value ". $HOME\dotfiles\windows\profile.ps1"

Starten Sie PowerShell neu.



Tippe sysup für Updates.



Tippe Invoke-PortScan für Hacking-Tools.



🐍 Python Tools (Cross-Platform)

Die Tools in python/ funktionieren überall.



Linux: netscan.py 8.8.8.8



Windows: python $HOME\dotfiles\python\hacking\netscan.py 8.8.8.8

