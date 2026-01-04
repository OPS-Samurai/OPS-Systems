import os
import platform

HOME = os.path.expanduser("~")
REPO = os.path.join(HOME, "dotfiles")
README = os.path.join(REPO, "README.md")
SYSTEM = platform.system()

# Welche Ordner scannen wir?
FOLDERS = {
    "🐧 Linux/Bash": [os.path.join(REPO, "bash", "general"), os.path.join(REPO, "bash", "hacking")],
    "🪟 Windows":    [os.path.join(REPO, "powershell", "general"), os.path.join(REPO, "powershell", "hacking")],
    "🐍 Python":     [os.path.join(REPO, "python", "general"), os.path.join(REPO, "python", "hacking")]
}

def scan_files():
    docs = []
    
    # Durch alle Kategorien iterieren
    for category, paths in FOLDERS.items():
        docs.append(f"\n### {category}")
        docs.append("| Befehl | Beschreibung | Herkunft |")
        docs.append("|---|---|---|")
        
        for folder in paths:
            if not os.path.exists(folder): continue
            
            # Alle Dateien im Ordner
            for filename in os.listdir(folder):
                if not filename.endswith((".sh", ".ps1", ".py")): continue
                
                filepath = os.path.join(folder, filename)
                shortname = filename
                
                with open(filepath, "r", encoding="utf-8", errors="ignore") as f:
                    doc_buffer = ""
                    for line in f:
                        line = line.strip()
                        
                        # Doku finden (# @doc:)
                        if "# @doc:" in line:
                            doc_buffer = line.split("# @doc:", 1)[1].strip()
                        
                        # Code finden (Funktion/Alias)
                        elif doc_buffer and line and not line.startswith("#"):
                            cmd_name = line.split()[0].split('(')[0].split('=')[0].replace("function", "").replace("alias", "").strip()
                            # Cleaning für Alias
                            if "'" in cmd_name: cmd_name = cmd_name.replace("'", "")
                            
                            if cmd_name:
                                docs.append(f"| **`{cmd_name}`** | {doc_buffer} | {shortname} |")
                                doc_buffer = "" # Reset

    return docs

def write_readme(content):
    with open(README, "w", encoding="utf-8") as f:
        f.write("# 🦅 Jarvis Dotfiles (Modular)\n")
        f.write("Automated System Configuration.\n")
        f.write("\n## 🛠 Modul-Übersicht\n")
        for line in content:
            f.write(line + "\n")
    print("✅ [Jarvis] Modular documentation generated.")

if __name__ == "__main__":
    data = scan_files()
    write_readme(data)
