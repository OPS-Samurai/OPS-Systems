# 🐧 Jarvis Installation Guide (Linux)

Zielsysteme: Kali Linux, Linux Mint, Ubuntu, Debian.

## 1. Voraussetzungen & Python
Wir installieren die Basis-Tools und Python (für die Cross-Platform Skripte).

```bash
sudo apt update
sudo apt install git zsh tilix guake fonts-firacode python3 -y
2. Git Einrichten (SSH Methode)
Für Linux nutzen wir SSH-Keys, um Passwörter zu vermeiden.

Key generieren (falls noch keiner existiert):

Bash

ssh-keygen -t ed25519 -C "your-email@example.com"
Key anzeigen:

Bash

cat ~/.ssh/id_ed25519.pub
Kopiere diesen Output und füge ihn bei GitHub unter Settings -> SSH and GPG keys hinzu.

3. Installation & Pull
Wir klonen das Repo und verlinken die Config.

Bash

# Klonen
git clone git@github.com:Anonjk1ng7/dotfiles.git ~/dotfiles

# Backup der alten Config
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.bak

# Symlink setzen (Der "Loader")
ln -sf ~/dotfiles/zshrc ~/.zshrc

# Berechtigungen setzen
chmod +x ~/dotfiles/bash/**/*.sh
chmod +x ~/dotfiles/python/**/*.py

# Shell wechseln
chsh -s $(which zsh)
Bitte einmal abmelden und neu anmelden.

4. Workflow (Push & Pull)
Updates holen (Pull): Da wir Symlinks nutzen, reicht oft ein git pull im Ordner ~/dotfiles.

Änderungen hochladen (Push): Nutze den Jarvis-Befehl:

Bash

dotsync "Beschreibung der Änderung"
