#!/bin/bash
# ==========================================
# OPS-SAMURAI INSTALLER (v3.0 - Hybrid)
# ==========================================
# Installiert Zsh, Plugins und verlinkt die Config aus dem Git-Repo.

# Farben
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}🗡️  [Jarvis] Starte System-Initialisierung...${NC}"

# 1. System-Updates & Abhängigkeiten (Aus Screenshot übernommen - Besser!)
echo -e "${BLUE}📦 [Jarvis] Prüfe Basis-Pakete...${NC}"
# Wir nutzen sudo nur wenn nötig
if command -v apt &> /dev/null; then
    sudo apt update && sudo apt install -y zsh git curl unzip
else
    echo -e "${RED}[!] Kein apt gefunden. Überspringe Paketinstallation.${NC}"
fi

# 2. Plugins installieren (Self-Healing Logic aus Screenshot)
PLUGIN_DIR="$HOME/.zsh_plugins"
mkdir -p "$PLUGIN_DIR"

echo -e "${BLUE}🧩 [Jarvis] Prüfe Plugins...${NC}"

# Syntax Highlighting
if [ ! -d "$PLUGIN_DIR/zsh-syntax-highlighting" ]; then
    echo "   -> Klone zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$PLUGIN_DIR/zsh-syntax-highlighting"
fi

# Auto Suggestions
if [ ! -d "$PLUGIN_DIR/zsh-autosuggestions" ]; then
    echo "   -> Klone zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$PLUGIN_DIR/zsh-autosuggestions"
fi

# 3. Backup & Symlinks (Der intelligente Part)
echo -e "${BLUE}🔗 [Jarvis] Verlinke Konfigurationsdateien...${NC}"

TARGET="$HOME/.zshrc"
# Wir ermitteln den Pfad dynamisch relativ zum Skript, 
# aber wir erzwingen den neuen Dateinamen 'zshrc' (ohne Punkt) im Repo.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE="$SCRIPT_DIR/zshrc"

# Prüfen ob die Source-Datei existiert
if [ ! -f "$SOURCE" ]; then
    echo -e "${RED}[ERROR] Konfigurationsdatei $SOURCE nicht gefunden!${NC}"
    exit 1
fi

# Backup Funktion (Aus Screenshot)
if [ -f "$TARGET" ] && [ ! -L "$TARGET" ]; then
    BACKUP_NAME="$TARGET.backup.$(date +%s)"
    echo "   -> Erstelle Backup von existierender .zshrc nach $BACKUP_NAME"
    mv "$TARGET" "$BACKUP_NAME"
fi

# Symlink neu setzen (Force overwrite für sauberen Stand)
ln -sf "$SOURCE" "$TARGET"
echo -e "${GREEN}✅ .zshrc erfolgreich verlinkt auf: $SOURCE${NC}"

# 4. Abschluss
echo -e "${GREEN}✨ [Jarvis] Deployment abgeschlossen.${NC}"
echo "Bitte starten Sie die Shell neu:  zsh"
