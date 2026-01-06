#!/bin/bash

# ==========================================
# JARVIS DOTFILES INSTALLER (v2.0)
# ==========================================

# Farben für Output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 [Jarvis] Starte Deployment-Protokoll...${NC}"

# 1. System-Updates & Abhängigkeiten
echo -e "${BLUE}⬇️  [Jarvis] Installiere Basis-Pakete (zsh, git, curl, unzip)...${NC}"
sudo apt update && sudo apt install -y zsh git curl unzip

# 2. Plugins installieren (Self-Healing)
PLUGIN_DIR="$HOME/.zsh_plugins"
mkdir -p "$PLUGIN_DIR"

echo -e "${BLUE}🧩 [Jarvis] Prüfe Plugins...${NC}"

# Syntax Highlighting
if [ ! -d "$PLUGIN_DIR/zsh-syntax-highlighting" ]; then
    echo "    -> Klone zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$PLUGIN_DIR/zsh-syntax-highlighting"
else
    echo -e "${GREEN}    -> zsh-syntax-highlighting vorhanden.${NC}"
fi

# Auto Suggestions
if [ ! -d "$PLUGIN_DIR/zsh-autosuggestions" ]; then
    echo "    -> Klone zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$PLUGIN_DIR/zsh-autosuggestions"
else
    echo -e "${GREEN}    -> zsh-autosuggestions vorhanden.${NC}"
fi

# 3. Backup & Symlinks
echo -e "${BLUE}🔗 [Jarvis] Verlinke Konfigurationsdateien...${NC}"

# Backup Funktion
backup_file() {
    if [ -f "$1" ] && [ ! -L "$1" ]; then
        BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%s)"
        mkdir -p "$BACKUP_DIR"
        mv "$1" "$BACKUP_DIR/"
        echo "    -> Backup von $1 erstellt in $BACKUP_DIR"
    fi
}

# .zshrc verlinken
TARGET="$HOME/.zshrc"
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
SOURCE="$SCRIPT_DIR/../Linux/zshrc"

backup_file "$TARGET"
ln -sf "$SOURCE" "$TARGET"
echo -e "${GREEN}✅ .zshrc verlinkt.${NC}"

# 4. Abschluss
echo -e "${BLUE}✨ [Jarvis] Deployment erfolgreich abgeschlossen.${NC}"
echo "Bitte starten Sie die Shell neu oder tippen Sie: zsh"
