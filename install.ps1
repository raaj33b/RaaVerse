# =======================================================
# RaaVerse Master Installer Script
# Author: Raajeeb
# =======================================================

Write-Host "Initializing RaaVerse Installer..." -ForegroundColor Cyan

# Variables
$repoUrl = "https://github.com/raaj33b/RaaVerse/raw/main/malware-removal-utility-app%20(1).zip"
$tempZip = "$env:TEMP\RaaVerse_MalwareUtility.zip"
$destFolder = "$HOME\Desktop\RaaVerse_Malware_Utility"

Try {
    # Step 1: Download
    Write-Host ">>> Downloading Malware Removal Utility..." -ForegroundColor Yellow
    Invoke-WebRequest -Uri $repoUrl -OutFile $tempZip -UseBasicParsing

    # Step 2: Extract
    Write-Host ">>> Extracting files to your Desktop..." -ForegroundColor Yellow
    Expand-Archive -Path $tempZip -DestinationPath $destFolder -Force

    # Step 3: Cleanup
    Write-Host ">>> Cleaning up temporary files..." -ForegroundColor Yellow
    if (Test-Path $tempZip) { Remove-Item -Path $tempZip -Force }

    Write-Host "`n=======================================================" -ForegroundColor Green
    Write-Host "  ✅ INSTALLATION COMPLETE! " -ForegroundColor Green
    Write-Host "  Check your Desktop for the 'RaaVerse_Malware_Utility' folder." -ForegroundColor Green
    Write-Host "=======================================================`n" -ForegroundColor Green

} Catch {
    Write-Host "`n❌ Error during installation: $_" -ForegroundColor Red
    Write-Host "Please make sure you are running PowerShell as Administrator.`n" -ForegroundColor Red
}
