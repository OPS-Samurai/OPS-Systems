import os

REPO = os.path.dirname(os.path.abspath(__file__))
README = os.path.join(REPO, "README.md")

# Die Struktur Ihrer Module
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
    entries = [] # Wir sammeln hier alle Befehle der Datei
    try:
        with open(filepath, "r", encoding="utf-8", errors="ignore") as f:
            lines = f.readlines()
    except:
        return []

    doc_buffer = None
    
    # 🐍 Spezialfall: Python Skripte (Endung entfernen)
    if filename.endswith(".py"):
        for line in lines[:15]: 
            if "# @doc:" in line:
                desc = line.split("# @doc:", 1)[1].strip()
                cmd_name = filename.replace(".py", "")
                # Python Files haben meist nur eine Hauptfunktion, daher return okay
                return [(f"**`{cmd_name}`**", desc, filename)]

    # 🐚 Parser für Bash/PowerShell Funktionen
    for line in lines:
        line = line.strip()
        # 1. Doku-Zeile finden
        if "# @doc:" in line:
            doc_buffer = line.split("# @doc:", 1)[1].strip()
        # 2. Funktions-Zeile finden (nur wenn Doku da ist)
        elif doc_buffer and line and not line.startswith("#"):
            cmd = None
            if "()" in line: cmd = line.split("(")[0].strip()
            elif line.startswith("alias "): cmd = line.split("=")[0].replace("alias ", "").strip()
            elif line.lower().startswith("function "): cmd = line.split()[1].split("{")[0].strip()
            
            if cmd:
                # WICHTIG: Hinzufügen, nicht return!
                entries.append((f"**`{cmd}`**", doc_buffer, filename))
                doc_buffer = None # Buffer resetten für den nächsten Befehl
    return entries

def generate():
    content = [
        "# 🦅 Jarvis Dotfiles",
        "Modulare System-Konfiguration für Cybersec & Sysadmin.\n",
        "### 📚 Installation & Setup",
        "| [🐧 Linux Guide](INSTALL_LINUX.md) | [🪟 Windows Guide](INSTALL_WINDOWS.md) |",
        "|:---:|:---:|",
        "\n---"
    ]
    
    for main_cat, sub_cats in STRUCTURE.items():
        content.append(f"\n## {main_cat}")
        for sub_name, sub_path in sub_cats.items():
            if not os.path.exists(sub_path): continue
            
            cmds = []
            for f in sorted(os.listdir(sub_path)):
                if f.endswith((".sh", ".ps1", ".py")):
                    cmds.extend(parse_file(os.path.join(sub_path, f), f))
            
            if cmds:
                content.append(f"\n### 📂 {sub_name}")
                content.append("| Befehl | Beschreibung | Datei |")
                content.append("|---|---|---|")
                for c, d, f in cmds:
                    content.append(f"| {c} | {d} | `{f}` |")

    with open(README, "w", encoding="utf-8") as f:
        f.write("\n".join(content))
    print("✅ README.md updated correctly (all commands parsed).")

if __name__ == "__main__":
    generate()
