# ==============================================
# JARVIS SYSTEM CONFIGURATION (v2.0 UI+Core)
# ==============================================

# --- 1. INTERFACE & DESIGN (Das fehlte!) ---
autoload -Uz colors && colors

# Kali-Style Prompt (Zweizeilig, Farbig)
# Zeile 1: ┌──(user㉿hostname)-[pfad]
# Zeile 2: └─$
setopt PROMPT_SUBST
PROMPT='%F{cyan}┌──(%F{red}%n㉿%m%F{cyan})-[%F{yellow}%~%F{cyan}]
└─%f$ '

# Fenstertitel setzen
case "$TERM" in
xterm*|rxvt*)
    TERM_TITLE=$'\e]0;%n@%m: %~\a'
    ;;
*)
    TERM_TITLE=""
    ;;
esac
precmd() { print -nP "$TERM_TITLE"; }

# --- 2. CORE SETTINGS ---
# History Optimierung
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
# Navigation
setopt AUTO_CD           # "downloads" tippen wechselt ins Verzeichnis
setopt CORRECT           # Korrigiert kleine Tippfehler (cd dowload -> download)

# --- 3. SYSTEM TOOLS ---

# @doc: Zeigt "echte" User (UID >= 1000) und Root an.
logusr() {
    awk -F: '($3>=1000)||($1=="root"){print $1}' /etc/passwd
}

# @doc: Führt ein volles System-Update durch.
sysup() {
    echo "🚀 [Jarvis] System-Update..."
    if sudo apt update; then
        sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean
        echo "✅ [Jarvis] System aktuell."
    else
        echo "❌ [Jarvis] Update fehlgeschlagen."
    fi
}

# --- 4. NETWORK TOOLS ---

# @doc: Zeigt die öffentliche IP-Adresse an.
myip() {
    echo "🔍 [Jarvis] Ermittle Identität..."
    local ip=$(curl -s --connect-timeout 3 ifconfig.me)
    if [ -z "$ip" ]; then echo "❌ Offline."; else echo "🌐 Public IP: \033[1;32m$ip\033[0m"; fi
}

# --- 5. UTILITIES ---

# @doc: Navigation: Springt zwei Verzeichnisse nach oben.
up2() { cd ../..; }

# @doc: Universal-Entpacker.
extract() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.zip)       unzip $1       ;;
            *.7z)        7z x $1        ;;
            *)           echo "❌ Format unbekannt: '$1'" ;;
        esac
    else echo "❌ Datei nicht gefunden."; fi
}

# --- 6. DEPLOYMENT (Self-Healing) ---

# @doc: Smart-Sync v3.1: Commit-First Strategie.
dotsync() {
    if [ -f ~/dotfiles/gendocs.sh ]; then ~/dotfiles/gendocs.sh; fi
    git -C ~/dotfiles add .
    if git -C ~/dotfiles diff-index --quiet HEAD --; then echo "zzz Keine Änderungen."; return 0; fi

    local msg="${1:-Auto-Sync: $(date '+%Y-%m-%d %H:%M:%S')}"
    # Versuche Smart-Message zu generieren, falls kein Parameter da ist
    if [ -z "$1" ]; then
        local doc_msg=$(git -C ~/dotfiles diff --cached -U0 | grep "^\+# @doc:" | head -n 1 | sed 's/^\+# @doc: //')
        if [ -n "$doc_msg" ]; then msg="Feature: $doc_msg"; fi
    fi

    echo "📦 Commit: $msg"
    git -C ~/dotfiles commit -m "$msg"
    echo "🔄 Sync..."
    git -C ~/dotfiles pull --rebase && git -C ~/dotfiles push || echo "⚠️ Fehler."
}
# --- SPECIAL OPS TOOLS ---

# @doc: Erstellt ein Verzeichnis und wechselt SOFORT hinein (mkdir + cd).
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# @doc: Startet sofort einen Python-Webserver (Port 8000) für Dateitransfers/Payloads.
www() {
    local ip=$(hostname -I | awk '{print $1}')
    echo "🚀 [Jarvis] Webserver aktiv: http://$ip:8000"
    python3 -m http.server 8000
}

# @doc: 'Fast Find': Findet Dateien im aktuellen Ordner (case-insensitive) ohne kryptische Parameter.
ff() {
    find . -iname "*$1*"
}

# @doc: Zeigt sofort alle offenen Ports und lauschenden Dienste an (Netzwerk-Check).
ports() {
    echo "🔍 [Jarvis] Scanne offene Ports..."
    sudo lsof -i -P -n | grep LISTEN
}
# --- GIT ACCELERATION ---

# @doc: Git-Aliase: g=git, gs=status, ga=add, gc=commit, gp=push, gl=graph-log.
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gd='git diff'
# Ein wunderschöner, grafischer Log-Baum für die Konsole:
alias gl='git log --oneline --graph --decorate --all'
# --- 7. PLUGINS (MUST BE LAST) ---
source ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'

# --- WORKFLOW AUTOMATION ---

# @doc: Config-Editor: Öffnet .zshrc und lädt sie nach dem Speichern SOFORT automatisch neu.
conf() {
    echo "📝 [Jarvis] Öffne Konfiguration..."
    nano ~/.zshrc
    
    # Prüfen, ob nano erfolgreich beendet wurde (Exit Code 0)
    if [ $? -eq 0 ]; then
        echo "♻️ [Jarvis] Änderungen erkannt. Lade System neu..."
        source ~/.zshrc
        echo "✅ [Jarvis] Update aktiv."
    else
        echo "❌ [Jarvis] Editor abgebrochen."
    fi
}

# @doc: Smart-Sync v4.0: Inklusive Auto-Reload der Shell nach dem Sync.
dotsync() {
    if [ -f ~/dotfiles/gendocs.sh ]; then ~/dotfiles/gendocs.sh; fi
    git -C ~/dotfiles add .
    
    # Nur weitermachen, wenn es Änderungen gibt
    if ! git -C ~/dotfiles diff-index --quiet HEAD --; then
        local msg="${1:-Auto-Sync: $(date '+%Y-%m-%d %H:%M:%S')}"
        if [ -z "$1" ]; then
            local doc_msg=$(git -C ~/dotfiles diff --cached -U0 | grep "^\+# @doc:" | head -n 1 | sed 's/^\+# @doc: //')
            if [ -n "$doc_msg" ]; then msg="Feature: $doc_msg"; fi
        fi
        
        echo "📦 [Jarvis] Commit: $msg"
        git -C ~/dotfiles commit -m "$msg"
        
        echo "🔄 [Jarvis] Sync mit GitHub..."
        git -C ~/dotfiles pull --rebase && git -C ~/dotfiles push
    else
        echo "zzz [Jarvis] Keine Änderungen für Upload."
    fi
    
    # NEU: Immer neu laden (auch wenn nur gepullt wurde oder nichts passiert ist)
    # Damit ist sichergestellt, dass die Shell immer 'frisch' ist.
    source ~/.zshrc
    echo "♻️ [Jarvis] Umgebung re-initialisiert."
}
