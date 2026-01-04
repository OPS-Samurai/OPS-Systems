# 🐧 Installation Guide (Linux)

**Zielsysteme:** Kali Linux, Linux Mint, Ubuntu, Debian.

---

## 1. Voraussetzungen & Python
Wir installieren die Basis-Tools und Python.

```bash
sudo apt update
sudo apt install git zsh tilix guake fonts-firacode python3 -y
```

## 2. Git Einrichten (SSH)

### A. Key generieren

```bash
ssh-keygen -t ed25519 -C "your-email@example.com"
```

### B. Key anzeigen

```bash
cat ~/.ssh/id_ed25519.pub
```
(Diesen Key bei GitHub unter Settings -> SSH keys hinterlegen).

## 3. Installation

### A. Repo klonen

```bash
git clone git@github.com:Anonjk1ng7/dotfiles.git ~/dotfiles
```

### B. Aktivieren

```bash
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.bak
ln -sf ~/dotfiles/zshrc ~/.zshrc
chmod +x ~/dotfiles/bash/**/*.sh
chmod +x ~/dotfiles/python/**/*.py
chsh -s $(which zsh)
```
## 4. Updates

### A. Holen

```bash
cd ~/dotfiles && git pull
```

### B. Senden

```bash
dotsync "Update: Commit Message"
```
