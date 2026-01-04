import os
import platform

# Konfiguration
HOME = os.path.expanduser("~")
DOTFILES = os.path.join(HOME, "dotfiles")
README_PATH = os.path.join(DOTFILES, "README.md")

# Welches System sind wir? Welche Datei müssen wir scannen?
SYSTEM = platform.system()
if SYSTEM == "Windows":
    TARGET_FILE = os.path.join(DOTFILES, "windows", "profile.ps1")
    ICON = "🪟"
else: # Linux / MacOS
    TARGET_FILE = os.path.join(DOTFILES, "zshrc")
    ICON = "🐧"

def generate_docs():
    print(f"⚙️ [Jarvis] Generiere Dokumentation für {SYSTEM} {ICON}...")
    
    commands = []

    if os.path.exists(TARGET_FILE):
        with open(TARGET_FILE, "r", encoding="utf-8") as f:
            doc_buffer = ""
            for line in f:
                line = line.strip()
                
                # 1. Doku finden (# @doc:)
                if line.startswith("# @doc:"):
                    doc_buffer = line.split("# @doc:", 1)[1].strip()
                
                # 2. Befehl finden (Funktion oder Alias)
                elif doc_buffer and line and not line.startswith("#"):
                    cmd_name = ""
                    
                    # PowerShell Function: "function myip {"
                    if line.lower().startswith("function "):
                        parts = line.split()
                        if len(parts) > 1:
                            cmd_name = parts[1].split("{")[0].strip()
                    
                    # PowerShell Alias: "Set-Alias -Name ll ..."
                    elif line.lower().startswith("set-alias"):
                        # Einfaches Parsing für Alias
                        parts = line.split("-Name")
                        if len(parts) > 1:
                            cmd_name = parts[1].split()[0].strip()

                    # Bash Function: "myip() {"
                    elif "()" in line:
                        cmd_name = line.split("(")[0].strip()
                    
                    # Bash Alias: "alias g='git'"
                    elif line.startswith("alias "):
                        cmd_name = line.split("=")[0].replace("alias ", "").strip()

                    if cmd_name:
                        commands.append(f"| **`{cmd_name}`** | {doc_buffer} |")
                        doc_buffer = "" # Reset

    # README schreiben
    with open(README_PATH, "w", encoding="utf-8") as f:
        f.write("# 🦅 Jarvis Dotfiles\n")
        f.write("Automated System Configuration (Cross-Platform).\n\n")
        f.write(f"## 🛠 Verfügbare Befehle ({SYSTEM}-Ansicht)\n")
        f.write("| Befehl | Beschreibung |\n")
        f.write("|---|---|\n")
        for cmd in commands:
            f.write(cmd + "\n")
            
    print("✅ [Jarvis] README.md aktualisiert.")

if __name__ == "__main__":
    generate_docs()
