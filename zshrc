# ==============================================
# JARVIS SYSTEM CONFIGURATION (v1.0 Clean)
# ==============================================

# --- SYSTEM TOOLS ---

# @doc: Zeigt "echte" User (UID >= 1000) und Root an.
logusr() {
    awk -F: '($3>=1000)||($1=="root"){print $1}' /etc/passwd
}

# @doc: Führt ein volles System-Update (Update, Full-Upgrade, Autoremove) durch.
sysup() {
    echo "🚀 [Jarvis] Initialisiere System-Update-Protokoll..."
    if sudo apt update; then
        echo "⬇️  [Jarvis] Starte Installation..."
        sudo apt full-upgrade -y
        sudo apt autoremove -y
        sudo apt autoclean
        echo "✅ [Jarvis] System aktuell."
    else
        echo "❌ [Jarvis] Update fehlgeschlagen."
    fi
}

# --- NETWORK TOOLS ---

# @doc: Zeigt die öffentliche IP-Adresse an (VPN-Check via ifconfig.me).
myip() {
    echo "🔍 [Jarvis] Ermittle öffentliche Identität..."
    local ip=$(curl -s --connect-timeout 3 ifconfig.me)
    if [ -z "$ip" ]; then
        echo "❌ [Jarvis] Keine Verbindung zum Identitäts-Server."
    else
        echo "🌐 Public IP: \033[1;32m$ip\033[0m"
    fi
}

# --- UTILITIES ---

# @doc: Navigation: Springt zwei Verzeichnisse nach oben.
up2() {
    cd ../..
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

# --- CORE SETTINGS ---

# @doc: History-Optimierung: Unendliches Gedächtnis, keine Duplikate, Sofort-Sync.
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# --- DEPLOYMENT ---

# @doc: Smart-Sync v3.1: Commit-First Strategie zur Vermeidung von Rebase-Konflikten.
dotsync() {
    if [ -f ~/dotfiles/gendocs.sh ]; then ~/dotfiles/gendocs.sh; fi
    git -C ~/dotfiles add .
    
    if git -C ~/dotfiles diff-index --quiet HEAD --; then
        echo "zzz [Jarvis] Keine Änderungen erkannt."
        return 0
    fi

    local msg=""
    if [ -n "$1" ]; then
        msg="$1"
    else
        local doc_msg=$(git -C ~/dotfiles diff --cached -U0 | grep "^\+# @doc:" | head -n 1 | sed 's/^\+# @doc: //')
        if [ -n "$doc_msg" ]; then
            msg="Feature: $doc_msg"
        else
            msg="Auto-Sync: $(date '+%Y-%m-%d %H:%M:%S')"
        fi
    fi

    echo "📦 [Jarvis] Sichere lokalen Stand..."
    git -C ~/dotfiles commit -m "$msg"

    echo "🔄 [Jarvis] Rebase..."
    if git -C ~/dotfiles pull --rebase; then
        echo "⬆️ [Jarvis] Upload..."
        git -C ~/dotfiles push
    else
        echo "⚠️ [Jarvis] Konflikt! Bitte prüfen."
        return 1
    fi
}

# --- VISUAL INTERFACE (HUD) ---

# @doc: Lädt Plugins für Syntax-Highlighting und Auto-Vorschläge.
# Plugins laden
source ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Konfiguration: Vorschläge sollen dunkelgrau und dezent sein
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
