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

# @doc: Config bearbeiten
function conf {
    code $PROFILE
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
