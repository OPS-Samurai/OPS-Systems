#!/bin/bash

# Pfade definieren
DOTFILES_DIR="$HOME/dotfiles"
README="$DOTFILES_DIR/README.md"
HEADER="$DOTFILES_DIR/README_HEADER.md"
ZSHRC="$DOTFILES_DIR/zshrc"

echo "⚙️ [Jarvis] Generiere Dokumentation..."

# 1. Header schreiben (oder Standard erstellen, falls fehlt)
if [ -f "$HEADER" ]; then
    cat "$HEADER" > "$README"
else
    echo "# 🦅 Jarvis Dotfiles" > "$README"
    echo "Automated System Configuration for Kali Linux." >> "$README"
fi

# Tabelle starten
echo "" >> "$README"
echo "## 🛠 Verfügbare Befehle" >> "$README"
echo "| Befehl | Beschreibung |" >> "$README"
echo "|---|---|" >> "$README"

# 2. Funktionen parsen
# Wir suchen nach Zeilen mit "# @doc:" und der darauffolgenden Zeile (Funktionsname)
grep -A 1 "^# @doc:" "$ZSHRC" | grep -v "^--$" | while read -r line; do
    # Fall A: Es ist eine Doku-Zeile
    if [[ "$line" == "# @doc:"* ]]; then
        # Schneidet "# @doc: " am Anfang weg
        CURRENT_DOC="${line#*@doc: }"
    
    # Fall B: Es ist die Funktion (Zeile danach)
    elif [[ "$line" != "" ]] && [[ -n "$CURRENT_DOC" ]]; then
        # Funktionsnamen extrahieren (alles vor der Klammer '(' )
        CMD_NAME=$(echo "$line" | cut -d'(' -f1 | tr -d ' ')
        
        # Nur schreiben, wenn wir einen Namen haben
        if [ -n "$CMD_NAME" ]; then
            echo "| **\`$CMD_NAME\`** | $CURRENT_DOC |" >> "$README"
            CURRENT_DOC="" # Reset für den nächsten Durchlauf
        fi
    fi
done

echo "📄 [Jarvis] README.md wurde bereinigt und aktualisiert."
