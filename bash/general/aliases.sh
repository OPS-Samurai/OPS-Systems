# @doc: Git-Aliase
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'

# @doc: System-Update
sysup() {
    echo "🚀 [Jarvis] System-Update..."
    sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y
}

# @doc: Config-Editor
conf() { nano ~/dotfiles/zshrc && source ~/.zshrc; }

# @doc: Automatischer Git-Sync
dotsync() {
    local msg="${1:-Auto-Sync}"
    local repo="$HOME/dotfiles"
    
    # Doku generieren
    if [ -f "$repo/gendocs.py" ]; then
        python3 "$repo/gendocs.py"
    fi
    
    # Git Push
    echo "⚙️ [Jarvis] Syncing..."
    git -C "$repo" add .
    git -C "$repo" commit -m "$msg"
    git -C "$repo" pull --rebase
    git -C "$repo" push
}
