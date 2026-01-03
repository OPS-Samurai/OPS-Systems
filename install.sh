#!/bin/bash

# --- Konfiguration ---
DOTFILES_DIR=~/dotfiles
BACKUP_DIR=~/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)

# Liste der Dateien, die verlinkt werden sollen (Namen im Repo ohne Punkt)
# Wenn wir später .bashrc oder .vimrc hinzufügen, einfach hier ergänzen:
FILES="zshrc"

# --- Start ---
echo "🤖 Initialisiere Jarvis-Setup..."

# Backup-Ordner erstellen, falls nötig
mkdir -p "$BACKUP_DIR"
echo "📂 Backup-Verzeichnis erstellt: $BACKUP_DIR"

# Loop durch alle Dateien
for file in $FILES; do
    SOURCE="$DOTFILES_DIR/$file"
    TARGET="$HOME/.$file"

    if [ -f "$TARGET" ] || [ -L "$TARGET" ]; then
        echo "   ⚠️  $TARGET existiert bereits. Verschiebe nach Backup..."
        mv "$TARGET" "$BACKUP_DIR/"
    fi

    echo "   🔗 Verlinke $SOURCE nach $TARGET"
    ln -s "$SOURCE" "$TARGET"
done

echo "✅ Setup abgeschlossen! Bitte führen Sie 'source ~/.zshrc' aus oder starten Sie das Terminal neu."
