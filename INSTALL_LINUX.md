🐧 Installationsanleitung für Linux (Bash & Zsh)
Diese Anleitung beschreibt die Integration der SysAdmin-Aliase, Funktionen und Python-Skripte in eine Linux-Umgebung.
📋 Voraussetzungen
Bevor Sie beginnen, stellen Sie sicher, dass die folgenden Pakete installiert sind:
Git: Zum Klonen des Repositories.
Python 3.8+: Für die Skripte.
Pip & Venv: Python Paket-Manager und Virtual Environment Modul.
Debian/Ubuntu/Kali:
sudo apt update && sudo apt install git python3 python3-pip python3-venv -y


Fedora/RHEL/CentOS:
sudo dnf install git python3 python3-pip


🚀 Schritt 1: Repository klonen
Wir empfehlen, das Repository in einem versteckten Ordner im Home-Verzeichnis oder unter ~/git/ abzulegen.
# In das Home-Verzeichnis wechseln
cd ~

# Repository klonen (Ordnername anpassbar, hier: .sysadmin-toolbox)
# Ersetzen Sie IHR-USERNAME durch Ihren tatsächlichen GitHub-Usernamen
git clone [https://github.com/IHR-USERNAME/sysadmin-toolbox.git](https://github.com/IHR-USERNAME/sysadmin-toolbox.git) .sysadmin-toolbox

# In das Verzeichnis wechseln
cd .sysadmin-toolbox


🐍 Schritt 2: Python Umgebung einrichten
Um Systemkonflikte zu vermeiden, nutzen wir eine virtuelle Umgebung (venv). Dies isoliert die Abhängigkeiten unserer Toolbox vom Rest des Systems.
# Virtuelle Umgebung erstellen
python3 -m venv venv

# Umgebung aktivieren
source venv/bin/activate

# Abhängigkeiten installieren
pip install -r requirements.txt

# Umgebung wieder verlassen (optional für den Moment)
deactivate


Hinweis: Die mitgelieferten Aliase sind so konfiguriert, dass sie automatisch das Python aus dieser virtuellen Umgebung nutzen. Sie müssen das venv nicht jedes Mal manuell aktivieren.
🐚 Schritt 3: Shell Integration (Bash & Zsh)
Damit die Befehle (Aliase und Funktionen) bei jedem Terminal-Start verfügbar sind, müssen sie in Ihre Shell-Konfigurationsdatei (.bashrc oder .zshrc) geladen ("gesourced") werden.
Option A: Automatische Installation (Empfohlen)
Führen Sie das mitgelieferte Setup-Skript aus (falls vorhanden) oder nutzen Sie diesen Einzeiler, der die Pfade automatisch anpasst:
Für Bash Benutzer:
echo "source $HOME/.sysadmin-toolbox/linux/aliases.sh" >> ~/.bashrc
echo "source $HOME/.sysadmin-toolbox/linux/functions.sh" >> ~/.bashrc
source ~/.bashrc


Für Zsh Benutzer (z.B. Oh My Zsh):
echo "source $HOME/.sysadmin-toolbox/linux/aliases.sh" >> ~/.zshrc
echo "source $HOME/.sysadmin-toolbox/linux/functions.sh" >> ~/.zshrc
source ~/.zshrc


Option B: Manuelle Installation
Öffnen Sie Ihre Konfigurationsdatei (z.B. nano ~/.bashrc oder nano ~/.zshrc).
Fügen Sie am Ende folgende Zeilen hinzu:
# SysAdmin Toolbox
export TOOLBOX_DIR="$HOME/.sysadmin-toolbox"
source "$TOOLBOX_DIR/linux/aliases.sh"
source "$TOOLBOX_DIR/linux/functions.sh"


✅ Schritt 4: Verifizierung
Starten Sie Ihr Terminal neu oder führen Sie source ~/.bashrc (bzw. ~/.zshrc) aus. Testen Sie dann, ob die Installation erfolgreich war:
Test Alias: Geben Sie einen der definierten Aliase ein (z.B. update-sys oder wie definiert).
Test Python: Prüfen Sie, ob die Python-Tools laufen.
# Beispiel (abhängig von Ihren definierten Aliasen)
sysinfo


🔄 Updates
Um die Toolbox auf den neuesten Stand zu bringen:
cd ~/.sysadmin-toolbox
git pull
source venv/bin/activate
pip install -r requirements.txt --upgrade
deactivate


