#!/usr/bin/env python3
import socket
import sys
from datetime import datetime

# @doc: Einfacher TCP Port-Scanner (Python)
# Verwendung: netscan.py <IP>

def scan_target(target):
    # Hostnamen auflösen
    try:
        target_ip = socket.gethostbyname(target)
    except socket.gaierror:
        print(f"❌ Fehler: Hostname '{target}' konnte nicht aufgelöst werden.")
        return

    print("-" * 50)
    print(f"🎯 Ziel: {target_ip}")
    print(f"🕒 Start: {datetime.now()}")
    print("-" * 50)

    # Die "Big 10" Ports, die wir scannen wollen
    ports = [21, 22, 23, 25, 53, 80, 110, 139, 443, 445, 3389, 8080]

    try:
        for port in ports:
            # Socket erstellen (IPv4, TCP)
            s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            socket.setdefaulttimeout(0.5) # Schneller Timeout
            
            # Verbindungsversuch (0 = Erfolg)
            result = s.connect_ex((target_ip, port))
            if result == 0:
                service = "Unknown"
                try:
                    service = socket.getservbyport(port)
                except: pass
                print(f"✅ Port {port:>5}/tcp OFFEN  ({service})")
            s.close()
            
    except KeyboardInterrupt:
        print("\n❌ Scan durch Benutzer abgebrochen.")
        sys.exit()
    except socket.error:
        print("\n❌ Keine Verbindung zum Server.")
        sys.exit()

    print("-" * 50)
    print("🏁 Scan abgeschlossen.")

if __name__ == "__main__":
    if len(sys.argv) == 2:
        scan_target(sys.argv[1])
    else:
        print("Verwendung: netscan.py <IP-Adresse oder Hostname>")
