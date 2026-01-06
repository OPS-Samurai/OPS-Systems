# ==============================================
# JARVIS SYSTEM CONFIGURATION (v3.1 Docs-Fix)
# ==============================================

# --- 1. INTERFACE & DESIGN ---
autoload -Uz colors && colors
setopt PROMPT_SUBST
PROMPT='%F{cyan}┌──(%F{red}%n㉿%m%F{cyan})-[%F{yellow}%~%F{cyan}]
└─%f$ '

# Fenstertitel
case "$TERM" in
xterm*|rxvt*) TERM_TITLE=$'\e]0;%n@%m: %~\a' ;;
*) TERM_TITLE="" ;;
esac
precmd() { print -nP "$TERM_TITLE"; }

# --- 2. CORE SETTINGS ---
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
setopt AUTO_CD
setopt CORRECT

# --- 3. ALIASES & GIT ---
# @doc: Git-Aliase (g=git, gs=status, ga=add, gc=commit, etc.)
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate --all'
alias cdd='cd ~/dotfiles'

# --- 4. TOOLS ---

# @doc: Zeigt "echte" User (UID >= 1000) und Root an.
logusr() { awk -F: '($3>=1000)||($1=="root"){print $1}' /etc/passwd; }

# @doc: Führt ein volles System-Update durch.
sysup() {
    echo "🚀 [Jarvis] System-Update..."
    sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean
}

# @doc: Zeigt die öffentliche IP-Adresse an.
myip() {
    echo "🔍 [Jarvis] Ermittle Identität..."
    local ip=$(curl -s --connect-timeout 3 ifconfig.me)
    [ -z "$ip" ] && echo "❌ Offline" || echo "🌐 IP: \033[1;32m$ip\033[0m"
}

# @doc: Erstellt Verzeichnis und wechselt hinein.
mkcd() { mkdir -p "$1" && cd "$1"; }

# @doc: Startet einen Webserver auf Port 8000.
www() { echo "🚀 Server: 8000"; python3 -m http.server 8000; }

# @doc: Findet Dateien im aktuellen Ordner (Fuzzy-Search).
ff() { find . -iname "*$1*"; }

# @doc: Zeigt offene Ports und lauschende Dienste.
ports() { sudo lsof -i -P -n | grep LISTEN; }

# @doc: Universal-Entpacker für alle Formate.
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
            *)           echo "❌ Format unbekannt." ;;
        esac
    else echo "❌ Datei fehlt."; fi
}

# --- 5. AUTOMATION (Conf & Sync) ---

# @doc: Config-Editor mit Auto-Reload.
conf() {
    nano ~/dotfiles/zshrc
    if [ $? -eq 0 ]; then
        source ~/.zshrc
        echo "✅ Reloaded."
    fi
}

# @doc: Sync mit GitHub + Auto-Doku + Reload.
dotsync() {
    # 1. Doku generieren
    if [ -f ~/dotfiles/gendocs.sh ]; then ~/dotfiles/gendocs.sh; fi
    
    # 2. Git Sync
    git -C ~/dotfiles add .
    if ! git -C ~/dotfiles diff-index --quiet HEAD --; then
        local msg="${1:-Auto-Sync: $(date '+%Y-%m-%d %H:%M:%S')}"
        if [ -z "$1" ]; then
            local doc_msg=$(git -C ~/dotfiles diff --cached -U0 | grep "^\+# @doc:" | head -n 1 | sed 's/^\+# @doc: //')
            [ -n "$doc_msg" ] && msg="Feature: $doc_msg"
        fi
        git -C ~/dotfiles commit -m "$msg"
        git -C ~/dotfiles pull --rebase && git -C ~/dotfiles push
    else
        echo "zzz Keine Änderungen."
    fi
    
    # 3. Reload
    source ~/.zshrc
}

# --- 6. PLUGINS & FZF (Must be last) ---
# @doc: Fuzzy Finder Integration.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

source ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
