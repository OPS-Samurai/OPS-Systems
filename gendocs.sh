#!/bin/bash

README="$HOME/dotfiles/README.md"
ZSHRC="$HOME/dotfiles/zshrc"

echo "⚙️ [Jarvis] Generiere Dokumentation..."

# Header schreiben
echo "# 🦅 Jarvis Dotfiles" > "$README"
echo "Automated System Configuration." >> "$README"
echo "" >> "$README"
echo "## 🛠 Verfügbare Befehle" >> "$README"
echo "| Befehl | Beschreibung |" >> "$README"
echo "|---|---|" >> "$README"

# Datei Zeile für Zeile lesen
CURRENT_DOC=""
while IFS= read -r line; do
    # 1. Wir finden eine Dokumentation (# @doc:)
    if [[ "$line" == "# @doc:"* ]]; then
        CURRENT_DOC="${line#*@doc: }"
    
    # 2. Wir haben eine Doku und finden jetzt den Befehl dazu
    elif [[ -n "$CURRENT_DOC" ]] && [[ "$line" != "" ]]; then
        # Versuchen, den Namen zu extrahieren
        # Zuerst alles ab der Klammer '(' wegwerfen (für Funktionen)
        CMD_NAME="${line%%(*}"
        
        # Falls es ein Alias ist (alias x=y), 'alias ' am Anfang entfernen und alles ab '=' wegwerfen
        if [[ "$CMD_NAME" == alias* ]]; then
            CMD_NAME="${CMD_NAME#alias }"
            CMD_NAME="${CMD_NAME%%=*}"
        fi
        
        # Leerzeichen entfernen
        CMD_NAME=$(echo "$CMD_NAME" | tr -d ' ')
        
        # Nur schreiben, wenn Name gültig und keine Kommentare/Klammern enthält
        if [[ -n "$CMD_NAME" ]] && [[ "$CMD_NAME" != \#* ]] && [[ "$CMD_NAME" != *\} ]]; then
            echo "| **\`$CMD_NAME\`** | $CURRENT_DOC |" >> "$README"
            CURRENT_DOC="" # Reset
        fi
    fi
done < "$ZSHRC"

echo "✅ [Jarvis] README.md wurde erfolgreich befüllt."
