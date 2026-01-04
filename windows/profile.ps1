# ==============================================
# JARVIS WINDOWS CONFIGURATION (PowerShell)
# ==============================================

# --- 1. OPTIK & PROMPT ---
function prompt {
    $path = $($executionContext.SessionState.Path.CurrentLocation)
    $user = $env:USERNAME
    $hostName = $env:COMPUTERNAME
    Write-Host "┌──($user㉿$hostName)-[$path]" -ForegroundColor Cyan
    return "└─$ "
}

# --- 2. ALIASES ---
# @doc: Zeigt Verzeichnisinhalt wie unter Linux.
Set-Alias -Name ll -Value ls

# @doc: Öffnet den Explorer im aktuellen Ordner.
function open { explorer . }

# --- 3. TOOLS ---

# @doc: Zeigt die öffentliche IP-Adresse an.
function myip {
    Write-Host "🔍 [Jarvis] Ermittle Identität..."
    try {
        $ip = (Invoke-WebRequest -Uri "https://ifconfig.me/ip" -UseBasicParsing).Content
        Write-Host "🌐 IP: $ip" -ForegroundColor Green
    } catch {
        Write-Host "❌ Offline" -ForegroundColor Red
    }
}

# @doc: Führt ein System-Update durch (via Winget).
function sysup {
    Write-Host "🚀 [Jarvis] Windows Update (Winget)..."
    winget upgrade --all --include-unknown
}

# @doc: Erstellt Verzeichnis und wechselt hinein.
function mkcd {
    param([string]$path)
    New-Item -ItemType Directory -Force -Path $path | Out-Null
    Set-Location $path
}

# @doc: Startet einen Webserver auf Port 8000.
function www {
    Write-Host "🚀 Server: http://localhost:8000"
    python -m http.server 8000
}

# --- 4. AUTOMATION & SYNC ---

# @doc: Bearbeitet dieses Profil.
function conf {
    code $PROFILE
}

# @doc: Sync mit GitHub + Auto-Doku (Cross-Platform).
function dotsync {
    param([string]$msg = "Auto-Sync: $(Get-Date -Format 'yyyy-MM-dd HH:mm')")
    
    # 1. Doku generieren (Python-Version aufrufen, falls vorhanden)
    $repo = "$env:USERPROFILE\dotfiles"
    if (Test-Path "$repo\gendocs.py") { python "$repo\gendocs.py" }

    # 2. Git Sync
    Write-Host "⚙️ [Jarvis] Syncing..."
    git -C $repo add .
    git -C $repo commit -m "$msg"
    git -C $repo pull --rebase
    git -C $repo push
    
    # 3. Reload
    . $PROFILE
}
