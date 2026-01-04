#!/bin/bash

# @doc: Port Scanner (Python Wrapper)
netscan() {
    python3 "$HOME/dotfiles/python/hacking/netscan.py" "$@"
}

# @doc: System Update (Linux Version)
sysup() {
    echo "🚀 [Jarvis] System Update..."
    sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y
}

# @doc: Öffentliche IP anzeigen
myip() {
    echo "🌐 Public IP: $(curl -s https://ifconfig.me/ip)"
}

# @doc: List List (Shortcut)
ll() {
    ls -la --color=auto "$@"
}

# @doc: Zsh-Config bearbeiten (Smart: Code oder Nano)
conf() {
    local file="$HOME/.zshrc"
    if command -v code >/dev/null 2>&1; then
        echo "📝 Öffne VS Code..."
        code "$file"
    else
        echo "📝 Öffne Nano..."
        nano "$file"
    fi
}

# @doc: Universal-Entpacker
extract() {
    if [ -f "$1" ] ; then
      case "$1" in
        *.tar.bz2)   tar xjf "$1"     ;;
        *.tar.gz)    tar xzf "$1"     ;;
        *.bz2)       bunzip2 "$1"     ;;
        *.rar)       unrar e "$1"     ;;
        *.gz)        gunzip "$1"      ;;
        *.tar)       tar xf "$1"      ;;
        *.tbz2)      tar xjf "$1"     ;;
        *.tgz)       tar xzf "$1"     ;;
        *.zip)       unzip "$1"       ;;
        *.Z)         uncompress "$1"  ;;
        *.7z)        7z x "$1"        ;;
        *)           echo "❌ '$1' kann nicht entpackt werden." ;;
      esac
    else
      echo "❌ '$1' ist keine gültige Datei."
    fi
}

# @doc: Dotfiles Sync (Linux Version)
dotsync() {
    msg="${1:-Auto-Sync via Linux}"
    repo="$HOME/dotfiles"
    
    # Doku generieren
    if [ -f "$repo/gendocs.py" ]; then python3 "$repo/gendocs.py"; fi
    
    echo "⚙️ [Jarvis] Syncing..."
    git -C "$repo" add .
    git -C "$repo" commit -m "$msg"
    git -C "$repo" pull --rebase
    git -C "$repo" push
}
