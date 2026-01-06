# JARVIS WINDOWS LOADER
$JarvisRoot = "$env:USERPROFILE\OPS-Systems"

# 1. General laden
Get-ChildItem "$JarvisRoot\powershell\general\*.ps1" | ForEach-Object { . $_.FullName }

# 2. Hacking laden
Get-ChildItem "$JarvisRoot\powershell\hacking\*.ps1" | ForEach-Object { . $_.FullName }

# 3. Python Pfad Info
Write-Host "Python Module liegen in $JarvisRoot\python" -ForegroundColor Yellow
