Write-Host  -ForegroundColor Cyan "Starting Circet OSD 21H2 with Firmware Update"
Start-Sleep -Seconds 3

#Change Display Resolution for Lenovo T440s
Write-Host  -ForegroundColor Cyan "Setting Display Resolution for Lenovo T440s"
if ((Get-MyComputerProduct) -match '20AR') {
    Write-Host  -ForegroundColor Cyan "Setting Display Resolution to 1920x"
    Set-DisRes 1920
}

Write-Host  -ForegroundColor Cyan "Importing the OSD PowerShell Module"
Import-Module OSD -Force

#Start OSDCloud ZTI 
Write-Host  -ForegroundColor Cyan "Start OSD Windows 10 21H2 with Firmware Update"
Start-OSDCloud -OSLanguage de-de -OSVersion 'Windows 10' -OSBuild 21H2 -OSEdition Pro -OSlicense Retail -Firmware -ZTI

#Restart from WinPE
Write-Host  -ForegroundColor Cyan "Restarting in 10 seconds!"
Start-Sleep -Seconds 10
wpeutil reboot
