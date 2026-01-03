# ==============================================
# JARVIS SYSTEM CONFIGURATION
# ==============================================

# @doc: Zeigt "echte" User (UID >= 1000) und Root an.
logusr() {
    awk -F: '($3>=1000)||($1=="root"){print $1}' /etc/passwd
}

# @doc: Führt ein volles System-Update (Update, Full-Upgrade, Autoremove) durch.
sysup() {
    echo "🚀 [Jarvis] Initialisiere System-Update-Protokoll..."
    sudo apt update
    if [ $? -eq 0 ]; then
        echo "⬇️  [Jarvis] Starte Installation..."
        sudo apt full-upgrade -y
        sudo apt autoremove -y
        sudo apt autoclean
        echo "✅ [Jarvis] System aktuell."
    else
        echo "❌ [Jarvis] Update fehlgeschlagen."
    fi
}

# @doc: Synchronisiert Dotfiles mit GitHub (Auto-Commit & Push). Usage: dotsync "Message"
dotsync() {
    # 1. Dokumentation generieren (Der neue Schritt!)
    if [ -f ~/dotfiles/gendocs.sh ]; then
        ~/dotfiles/gendocs.sh
    fi

    local msg="${1:-Auto-Sync: $(date '+%Y-%m-%d %H:%M:%S')}"
    
    echo "🔄 [Jarvis] Prüfe auf Remote-Änderungen..."
    if git -C ~/dotfiles pull --rebase; then
        echo "✅ [Jarvis] Remote-Stand integriert."
    else
        echo "⚠️ [Jarvis] Konflikt! Bitte manuell prüfen."
        return 1
    fi

    echo "☁️ [Jarvis] Upload..."
    git -C ~/dotfiles add .
    if ! git -C ~/dotfiles diff-index --quiet HEAD --; then
        git -C ~/dotfiles commit -m "$msg"
        git -C ~/dotfiles push
        echo "✅ [Jarvis] Sync und Doku-Update erfolgreich."
    else
        echo "zzz [Jarvis] Keine Änderungen."
    fi
}

# @doc: Smart-Sync: Nutzt automatisch neue @doc-Einträge als Commit-Message, falls kein Text angegeben wird.
dotsync() {
    # 1. Dokumentation generieren
    if [ -f ~/dotfiles/gendocs.sh ]; then
        ~/dotfiles/gendocs.sh
    fi

    echo "🔄 [Jarvis] Prüfe auf Remote-Änderungen..."
    if ! git -C ~/dotfiles pull --rebase; then
        echo "⚠️ [Jarvis] Konflikt erkannt! Abbruch."
        return 1
    fi

    echo "☁️ [Jarvis] Bereite Upload vor..."
    git -C ~/dotfiles add .
    
    # --- INTELLIGENTE NACHRICHTEN-LOGIK ---
    local msg=""
    
    # Fall A: User hat einen Parameter übergeben
    if [ -n "$1" ]; then
        msg="$1"
        
    # Fall B: Wir suchen nach neuen @doc Einträgen in den Änderungen
    else
        # Wir greppen im "staged area" nach Zeilen, die hinzugefügt wurden (+) und das Tag enthalten
        # sed entfernt das führende '+# @doc: '
        local doc_msg=$(git -C ~/dotfiles diff --cached -U0 | grep "^\+# @doc:" | head -n 1 | sed 's/^\+# @doc: //')
        
        if [ -n "$doc_msg" ]; then
            msg="Feature: $doc_msg"
            echo "🧠 [Jarvis] Automatische Nachricht generiert: '$msg'"
        else
            msg="Auto-Sync: $(date '+%Y-%m-%d %H:%M:%S')"
        fi
    fi
    # --------------------------------------

    if ! git -C ~/dotfiles diff-index --quiet HEAD --; then
        git -C ~/dotfiles commit -m "$msg"
        
        if git -C ~/dotfiles push; then
             echo "✅ [Jarvis] Synchronisation erfolgreich."
        else
             echo "❌ [Jarvis] Upload fehlgeschlagen."
        fi
    else
        echo "zzz [Jarvis] Keine Änderungen erkannt."
    fi
}

# @doc: Navigation: Springt zwei Verzeichnisse nach oben.
up2() {
    cd ../..
}

# @doc: Smart-Sync v3.1: Commit-First Strategie zur Vermeidung von Rebase-Konflikten.
dotsync() {
    # 1. Dokumentation generieren
    if [ -f ~/dotfiles/gendocs.sh ]; then
        ~/dotfiles/gendocs.sh
    fi

    # 2. Alles stagen (Vorbereitung)
    git -C ~/dotfiles add .

    # 3. Prüfen ob es überhaupt Änderungen gibt
    if git -C ~/dotfiles diff-index --quiet HEAD --; then
        echo "zzz [Jarvis] Keine Änderungen erkannt. Upload nicht nötig."
        return 0
    fi

    # 4. Nachricht generieren (BEVOR wir committen, solange es noch im Stage ist)
    local msg=""
    if [ -n "$1" ]; then
        msg="$1"
    else
        # Smart-Detection: Suche nach neuen @doc Zeilen
        local doc_msg=$(git -C ~/dotfiles diff --cached -U0 | grep "^\+# @doc:" | head -n 1 | sed 's/^\+# @doc: //')
        if [ -n "$doc_msg" ]; then
            msg="Feature: $doc_msg"
            echo "🧠 [Jarvis] Automatische Nachricht: '$msg'"
        else
            msg="Auto-Sync: $(date '+%Y-%m-%d %H:%M:%S')"
        fi
    fi

    # 5. Lokaler Commit (Sichert den Stand)
    echo "📦 [Jarvis] Sichere lokalen Stand..."
    git -C ~/dotfiles commit -m "$msg"

    # 6. Pull & Rebase (Jetzt sicher, da committed)
    echo "🔄 [Jarvis] Prüfe auf Remote-Änderungen (Rebase)..."
    if git -C ~/dotfiles pull --rebase; then
        # 7. Push
        echo "⬆️ [Jarvis] Lade Daten zu GitHub..."
        if git -C ~/dotfiles push; then
             echo "✅ [Jarvis] Synchronisation erfolgreich."
        else
             echo "❌ [Jarvis] Upload fehlgeschlagen."
        fi
    else
        echo "⚠️ [Jarvis] Rebase-Konflikt! Bitte 'git status' prüfen."
        return 1
    fi
}

# @doc: Universal-Entpacker: Extrahiert Archive (tar, zip, rar, 7z, bz2) automatisch.
extract() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "❌ [Jarvis] Unbekanntes Format: '$1'" ;;
        esac
    else
        echo "❌ [Jarvis] Datei '$1' nicht gefunden."
    fi
}

# ==============================================
# JARVIS MEMORY CORE (History Config)
# ==============================================
# @doc: History-Optimierung: Unendliches Gedächtnis, keine Duplikate, Sofort-Sync.

# 1. Kapazität erhöhen (1 Million Einträge)
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000
export SAVEHIST=1000000

# 2. Intelligente Filter
setopt EXTENDED_HISTORY          # Speichert Zeitstempel zu jedem Befehl
setopt SHARE_HISTORY             # Sofortiger Sync zwischen allen offenen Tabs
setopt HIST_EXPIRE_DUPS_FIRST    # Löscht bei Platzmangel zuerst Duplikate
setopt HIST_IGNORE_DUPS          # Ignoriert direkte Wiederholung (ls, ls, ls -> 1x ls)
setopt HIST_IGNORE_ALL_DUPS      # Entfernt ältere Einträge, wenn ein Befehl neu getippt wird
setopt HIST_FIND_NO_DUPS         # Zeigt bei der Suche (Strg+R) keine Doppelten an
setopt HIST_SAVE_NO_DUPS         # Schreibt keine Duplikate in die Datei
