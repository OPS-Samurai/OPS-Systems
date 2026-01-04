# ==============================================
# JARVIS MODULAR LOADER (v2 - Bulletproof)
# ==============================================

# 1. CORE SETTINGS
autoload -Uz colors && colors
setopt PROMPT_SUBST
PROMPT='%F{cyan}┌──(%F{red}%n㉿%m%F{cyan})-[%F{yellow}%~%F{cyan}]
└─%f$ '

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt APPEND_HISTORY
setopt SHARE_HISTORY

# 2. MODUL-LADER (Mit Fehler-Schutz)
# Aktiviert nullglob, damit leere Ordner keinen Fehler werfen
setopt nullglob

# Lade Bash-Aliase und Tools (nur wenn lesbar)
for config_file in ~/dotfiles/bash/**/*.sh; do
    if [ -r "$config_file" ]; then
        source "$config_file"
    fi
done

# Deaktiviert nullglob wieder (für Standard-Verhalten)
unsetopt nullglob

# 3. PYTHON PATH & TOOLS
export PATH="$HOME/dotfiles/python/general:$HOME/dotfiles/python/hacking:$PATH"

# 4. PLUGINS
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
