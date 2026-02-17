# Run PowerShell as Administrator before executing
# Run with:
# Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
# .\SystemRepair.ps1

Write-Host "Starting system repair process..." -ForegroundColor Cyan

# Step 1: CheckHealth
Write-Host "`nRunning DISM CheckHealth..." -ForegroundColor Yellow
Start-Process -FilePath "DISM.exe" -ArgumentList "/Online", "/Cleanup-Image", "/CheckHealth" -Wait -NoNewWindow

# Step 2: ScanHealth
Write-Host "`nRunning DISM ScanHealth..." -ForegroundColor Yellow
Start-Process -FilePath "DISM.exe" -ArgumentList "/Online", "/Cleanup-Image", "/ScanHealth" -Wait -NoNewWindow

# Step 3: RestoreHealth
Write-Host "`nRunning DISM RestoreHealth..." -ForegroundColor Yellow
Start-Process -FilePath "DISM.exe" -ArgumentList "/Online", "/Cleanup-Image", "/RestoreHealth" -Wait -NoNewWindow

# Step 4: SFC Scan
Write-Host "`nRunning System File Checker (SFC)..." -ForegroundColor Yellow
Start-Process -FilePath "sfc.exe" -ArgumentList "/scannow" -Wait -NoNewWindow

Write-Host "`nSystem repair process complete!" -ForegroundColor Green
