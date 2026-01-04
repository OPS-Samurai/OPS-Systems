import os
REPO = os.path.dirname(os.path.abspath(__file__))
README = os.path.join(REPO, "README.md")
STRUCTURE = {
    "🐧 Linux (Bash/Zsh)": {"General": os.path.join(REPO, "bash", "general"), "Hacking": os.path.join(REPO, "bash", "hacking")},
    "🪟 Windows (PowerShell)": {"General": os.path.join(REPO, "powershell", "general"), "Hacking": os.path.join(REPO, "powershell", "hacking")},
    "🐍 Python (Cross-Platform)": {"General": os.path.join(REPO, "python", "general"), "Hacking": os.path.join(REPO, "python", "hacking")}
}
def parse_file(path, fname):
    try:
        with open(path, "r", errors="ignore") as f: lines = f.readlines()
        if fname.endswith(".py"):
            for line in lines[:15]:
                if "# @doc:" in line:
                    return [(f"**`{fname.replace('.py','')}`**", line.split("# @doc:",1)[1].strip(), fname)]
        for line in lines:
            if "# @doc:" in line: doc = line.split("# @doc:",1)[1].strip()
            elif "doc" in locals() and line and not line.startswith("#"):
                cmd = line.split("(")[0].strip() if "()" in line else (line.split()[1] if line.startswith("function") else None)
                if cmd: return [(f"**`{cmd}`**", doc, fname)]
    except: pass
    return []
def generate():
    c = ["# 🦅 Jarvis Dotfiles", "Modulare System-Konfiguration.\n### 📚 Setup\n| [🐧 Linux](INSTALL_LINUX.md) | [🪟 Windows](INSTALL_WINDOWS.md) |\n|:---:|:---:|\n\n---"]
    for m, s in STRUCTURE.items():
        c.append(f"\n## {m}")
        for n, p in s.items():
            if os.path.exists(p):
                cmds = []
                for f in sorted(os.listdir(p)):
                    if f.endswith((".sh", ".ps1", ".py")): cmds.extend(parse_file(os.path.join(p, f), f))
                if cmds:
                    c.extend([f"\n### 📂 {n}", "| Befehl | Beschreibung | Datei |", "|---|---|---|"] + [f"| {x} | {y} | `{z}` |" for x,y,z in cmds])
    with open(README, "w", encoding="utf-8") as f: f.write("\n".join(c))
    print("✅ README updated.")
if __name__ == "__main__": generate()
