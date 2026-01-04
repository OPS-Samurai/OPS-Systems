# 🐧 Jarvis Installation Guide (Linux)

**Zielsysteme:** Kali Linux, Linux Mint, Ubuntu, Debian.

---

## 1. Voraussetzungen & Python
Wir installieren die Basis-Tools und Python, damit die Skripte laufen.

```bash
sudo apt update
sudo apt install git zsh tilix guake fonts-firacode python3 -y
2. Git Einrichten (SSH Methode)
Für Linux nutzen wir SSH-Keys, um Passwörter zu vermeiden.

A. Key generieren
Führen Sie diesen Befehl aus (nur falls Sie noch keinen Key haben):

Bash

ssh-keygen -t ed25519 -C "your-email@example.com"
B. Key anzeigen
Kopieren Sie die Ausgabe dieses Befehls:

Bash

cat ~/.ssh/id_ed25519.pub
(Fügen Sie den Key dann bei GitHub unter Settings -> SSH and GPG keys hinzu).

3. Installation & Verlinkung
Wir klonen das Repo und ersetzen die Standard-Config durch Jarvis.

A. Klonen
Bash

git clone git@github.com:Anonjk1ng7/dotfiles.git ~/dotfiles
B. Aktivieren (Symlink setzen)
Wir sichern die alte Config und setzen den Link neu.

Bash

# Backup
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.bak

# Symlink
ln -sf ~/dotfiles/zshrc ~/.zshrc
C. Berechtigungen setzen
Damit alle Skripte ausführbar sind:

Bash

chmod +x ~/dotfiles/bash/**/*.sh
chmod +x ~/dotfiles/python/**/*.py
D. Shell wechseln
Zsh als Standard setzen (Logout erforderlich):

Bash

chsh -s $(which zsh)
4. Workflow (Updates)
Updates holen (Pull)
Da wir Symlinks nutzen, reicht ein Git Pull:

Bash

cd ~/dotfiles && git pull
Änderungen hochladen (Push)
Nutze den Jarvis-Befehl:

Bash

dotsync "Beschreibung der Änderung"
