# @doc: System-Update (Winget)
function sysup {
    Write-Host "🚀 [Jarvis] Windows Update..." -ForegroundColor Cyan
    winget upgrade --all --include-unknown
}

# @doc: Öffentliche IP anzeigen
function myip {
    $ip = (Invoke-WebRequest -Uri "https://ifconfig.me/ip" -UseBasicParsing).Content
    Write-Host "🌐 IP: $ip" -ForegroundColor Green
}

# @doc: List List (wie ls -la)
function ll {
    Get-ChildItem -Force
}

# @doc: Config bearbeiten (Smart: Code oder Notepad)
function conf {
    $path = $PROFILE
    # Prüft, ob VS Code da ist, sonst Notepad
    if (Get-Command "code" -ErrorAction SilentlyContinue) {
        Write-Host "📝 Öffne mit VS Code..." -ForegroundColor Cyan
        code $path
    } else {
        Write-Warning "VS Code nicht gefunden. Öffne mit Notepad."
        notepad $path
    }
}

# @doc: Dotfiles Sync (Windows Version)
function dotsync {
    param([string]$msg = "Auto-Sync via Windows")
    $repo = "$env:USERPROFILE\dotfiles"
    
    # 1. Doku generieren (Python)
    if (Test-Path "$repo\gendocs.py") { python "$repo\gendocs.py" }

    # 2. Git Magic
    Write-Host "⚙️ [Jarvis] Syncing..." -ForegroundColor Cyan
    git -C $repo add .
    git -C $repo commit -m "$msg"
    git -C $repo pull --rebase
    git -C $repo push
}

# @doc: Port Scanner (Python)
function netscan {
    # Ruft das Python-Skript auf und reicht alle Argumente ($args) weiter
    python "$env:USERPROFILE\dotfiles\python\hacking\netscan.py" $args
}
