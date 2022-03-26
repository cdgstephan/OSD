Write-Host  -ForegroundColor Cyan "Starting Circet OSD 21H2 with Firmware Update"
Start-Sleep -Seconds 5

#Change Display Resolution for Virtual Machine
Write-Host  -ForegroundColor Cyan "Setting Display Resolution for Lenovo T440s"
if ((Get-MyComputerProduct) -match '') {
    Write-Host  -ForegroundColor Cyan "Setting Display Resolution to 1920x"
    Set-DisRes 1920
}

#Make sure I have the latest OSD Content
Write-Host  -ForegroundColor Cyan "Updating the OSD PowerShell Module"
Install-Module OSD -Force

Write-Host  -ForegroundColor Cyan "Importing the OSD PowerShell Module"
Import-Module OSD -Force

#Start-Sleep -Seconds 5

#Start OSDCloud ZTI 
Write-Host  -ForegroundColor Cyan "Start OSD Windows 10 21H2 with Firmware Update"
Start-OSDCloud -OSLanguage de-de -OSVersion 'Windows 10' -OSBuild 21H2 -OSEdition Pro -OSlicense Retail -Firmware -ZTI

#Restart from WinPE
Write-Host  -ForegroundColor Cyan "Restarting in 10 seconds!"
Start-Sleep -Seconds 10
wpeutil reboot
