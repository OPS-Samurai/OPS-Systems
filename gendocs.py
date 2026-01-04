import os

# Pfade relativ zum Skript ermitteln (Bulletproof)
REPO = os.path.dirname(os.path.abspath(__file__))
README = os.path.join(REPO, "README.md")

# Die gewünschte 3x2 Struktur
STRUCTURE = {
    "🐧 Linux (Bash/Zsh)": {
        "General": os.path.join(REPO, "bash", "general"),
        "Hacking": os.path.join(REPO, "bash", "hacking")
    },
    "🪟 Windows (PowerShell)": {
        "General": os.path.join(REPO, "powershell", "general"),
        "Hacking": os.path.join(REPO, "powershell", "hacking")
    },
    "🐍 Python (Cross-Platform)": {
        "General": os.path.join(REPO, "python", "general"),
        "Hacking": os.path.join(REPO, "python", "hacking")
    }
}

def parse_file(filepath, filename):
    entries = []
    with open(filepath, "r", encoding="utf-8", errors="ignore") as f:
        lines = f.readlines()

    doc_buffer = None
    
    # Spezialfall: Python-Skripte sind oft selbst der Befehl
    if filename.endswith(".py"):
        # Suche nach File-Level Docstring in den ersten Zeilen
        for line in lines[:10]:
            if "# @doc:" in line:
                desc = line.split("# @doc:", 1)[1].strip()
                return [(f"**`{filename}`**", desc, filename)]

    # Parser für Bash/PowerShell Funktionen
    for i, line in enumerate(lines):
        line = line.strip()
        
        # 1. Doku finden
        if "# @doc:" in line:
            doc_buffer = line.split("# @doc:", 1)[1].strip()
        
        # 2. Befehl zuordnen (ignoriert Leerzeilen und Kommentare)
        elif doc_buffer and line and not line.startswith("#"):
            cmd_name = None
            
            # Bash/Zsh Muster
            if "()" in line: 
                cmd_name = line.split("(")[0].strip()
            elif line.startswith("alias "):
                cmd_name = line.split("=")[0].replace("alias ", "").strip()
            
            # PowerShell Muster
            elif line.lower().startswith("function "):
                cmd_name = line.split()[1].split("{")[0].strip()
            elif line.lower().startswith("set-alias"):
                parts = line.split("-Name")
                if len(parts) > 1: cmd_name = parts[1].split()[0].strip()

            if cmd_name:
                entries.append((f"**`{cmd_name}`**", doc_buffer, filename))
                doc_buffer = None # Reset
            
    return entries

def generate():
    content = ["# 🦅 Jarvis Dotfiles", "Modulare Konfiguration für Linux & Windows.\n"]
    
    for main_cat, sub_cats in STRUCTURE.items():
        content.append(f"\n## {main_cat}")
        
        for sub_name, sub_path in sub_cats.items():
            if not os.path.exists(sub_path): continue
            
            folder_entries = []
            for file in sorted(os.listdir(sub_path)):
                if file.endswith((".sh", ".ps1", ".py")):
                    folder_entries.extend(parse_file(os.path.join(sub_path, file), file))
            
            if folder_entries:
                content.append(f"\n### 📂 {sub_name}")
                content.append("| Befehl | Beschreibung | Datei |")
                content.append("|---|---|---|")
                for cmd, desc, fsource in folder_entries:
                    content.append(f"| {cmd} | {desc} | `{fsource}` |")
            else:
                content.append(f"\n> *{sub_name}: Keine Befehle gefunden.*")

    with open(README, "w", encoding="utf-8") as f:
        f.write("\n".join(content))
    print("✅ README.md erfolgreich generiert.")

if __name__ == "__main__":
    generate()
