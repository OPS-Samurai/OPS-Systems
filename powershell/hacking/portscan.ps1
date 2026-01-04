# @doc: Schneller TCP-Portscanner (Native PowerShell)
function Invoke-PortScan {
    param(
        [string]$Target,
        [int[]]$Ports = @(21, 22, 23, 80, 443, 445, 3389, 8080)
    )

    Write-Host "🎯 Ziel: $Target" -ForegroundColor Cyan
    Write-Host "⏳ Scanne Ports..." -NoNewline

    foreach ($Port in $Ports) {
        $TcpClient = New-Object System.Net.Sockets.TcpClient
        try {
            # Asynchrone Verbindung für Speed (500ms Timeout)
            $Connect = $TcpClient.BeginConnect($Target, $Port, $null, $null)
            $Wait = $Connect.AsyncWaitHandle.WaitOne(500, $false)

            if ($TcpClient.Connected) {
                Write-Host "`n✅ Port $Port ist OFFEN" -ForegroundColor Green
            }
        }
        catch {}
        finally {
            $TcpClient.Close()
            $TcpClient.Dispose()
        }
    }
    Write-Host "`n🏁 Scan beendet." -ForegroundColor Gray
}
