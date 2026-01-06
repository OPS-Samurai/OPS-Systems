# --- Python Tools Integration ---
# @doc: Startet den Python Port-Scanner (netscan.py)
function netscan {
    python "C:\Git\Python-Tools\Network-Scanner\netscan.py" @args
}
# --------------------------------



# --- Daily Dashboard ---

function dashboard {
    Write-Host "`n--- 🦅 JARVIS REPOSITORY DASHBOARD ---" -ForegroundColor Cyan
    $repoPath = "C:\Git"
    
    if (Test-Path $repoPath) {
        $repos = Get-ChildItem -Path $repoPath -Directory
        foreach ($repo in $repos) {
            # Sicherer Verzeichniswechsel
            Push-Location $repo.FullName
            try {
                $status = git status --porcelain
                $branch = git branch --show-current
                
                $color = if ($status) { "Yellow" } else { "Green" }
                $indicator = if ($status) { "PENDING" } else { "CLEAN" }
                
                Write-Host "[$($repo.Name.PadRight(25))] " -NoNewline -ForegroundColor White
                Write-Host "($($branch.PadRight(10))) " -NoNewline -ForegroundColor Gray
                Write-Host "-> $indicator" -ForegroundColor $color
            }
            finally {
                Pop-Location
            }
        }
    }
    Write-Host "---------------------------------------`n" -ForegroundColor Cyan
}


# --------------------------------