# 🛠️ SysAdmin Dotfiles (Jarvis Powered)

Automatisiertes Setup für Kali Linux / Debian.

## 🚀 Quick Install
```bash
git clone [https://github.com/Anonjk1ng7/dotfiles.git](https://github.com/Anonjk1ng7/dotfiles.git) ~/dotfiles
chmod +x ~/dotfiles/install.sh
~/dotfiles/install.sh
📦 Features & Befehle(Diese Liste wird automatisch aus dem Quellcode generiert)BefehlBeschreibungEOF
### Schritt 3: Den Generator bauen (`gendocs.sh`)

Hier passiert die Magie. Dieses Skript nimmt den Header, sucht alle Zeilen mit `# @doc:` in der `zshrc` und klebt sie als Tabelle darunter.

```bash
cat << 'EOF' > ~/dotfiles/gendocs.sh
#!/bin/bash

DOTFILES_DIR=~/dotfiles
README=$DOTFILES_DIR/README.md
HEADER=$DOTFILES_DIR/README_HEADER.md
ZSHRC=$DOTFILES_DIR/zshrc

# 1. Header schreiben
cat "$HEADER" > "$README"

# 2. Funktionen parsen und als Markdown-Tabelle anhängen
# Wir suchen nach dem Muster: # @doc: BESCHREIBUNG
# und nehmen an, die Zeile DARUNTER ist der Funktionsname (funktionsname() {)

grep -B 1 "^# @doc:" "$ZSHRC" | grep -v "\-\-" | while read line; do
    if [[ $line == "# @doc:"* ]]; then
        # Beschreibung extrahieren (alles nach @doc:)
        DESC=${line#*@doc: }
    else
        # Funktionsname extrahieren (alles vor ())
        CMD=$(echo $line | cut -d'(' -f1)
        
        # In README schreiben
        echo "| **\`$CMD\`** | $DESC |" >> "$README"
    fi
done

echo "📄 [Jarvis] README.md wurde aktualisiert."
