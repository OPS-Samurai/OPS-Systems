#!/bin/bash

DOTFILES_DIR=~/dotfiles
README=$DOTFILES_DIR/README.md
HEADER=$DOTFILES_DIR/README_HEADER.md
ZSHRC=$DOTFILES_DIR/zshrc

# 1. Header schreiben
cat "$HEADER" > "$README"

# 2. Funktionen parsen und als Markdown-Tabelle anhängen
echo "" >> "$README"
grep -B 1 "^# @doc:" "$ZSHRC" | grep -v "\-\-" | while read line; do
    if [[ $line == "# @doc:"* ]]; then
        # Beschreibung extrahieren
        DESC=${line#*@doc: }
    else
        # Funktionsname extrahieren
        CMD=$(echo $line | cut -d'(' -f1)
        echo "| **\`$CMD\`** | $DESC |" >> "$README"
    fi
done

echo "📄 [Jarvis] README.md wurde aktualisiert."
