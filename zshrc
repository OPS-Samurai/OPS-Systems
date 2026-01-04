# ==============================================
# JARVIS MODULAR LOADER (Linux)
# ==============================================

# 1. CORE SETTINGS (Bleibt hier)
autoload -Uz colors && colors
setopt PROMPT_SUBST
PROMPT='%F{cyan}┌──(%F{red}%n㉿%m%F{cyan})-[%F{yellow}%~%F{cyan}]
└─%f$ '

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt APPEND_HISTORY
setopt SHARE_HISTORY

# 2. MODUL-LADER (Die Magie)
# Lädt alle .sh Dateien aus dem bash/ Ordner
for config_file in ~/dotfiles/bash/**/*.sh; do
    source "$config_file"
done

# 3. PYTHON PATH ERWEITERN
# Damit Sie Ihre Python-Skripte überall ausführen können
export PATH="$HOME/dotfiles/python/general:$HOME/dotfiles/python/hacking:$PATH"

# 4. PLUGINS (Am Ende)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
