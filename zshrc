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
