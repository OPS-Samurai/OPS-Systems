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
