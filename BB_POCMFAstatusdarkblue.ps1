Write-Host "Results Count:" -BackgroundColor DarkBlue -ForegroundColor White

Show-EventLog

Register-ScheduledTask -TaskName "Schedule MFA Status Report" -Trigger $Time -Action $Action -RunLevel Highest

Get-View -ViewType VirtualMachine -Filter @{"Name" = "BB POC DARKBLUE MFA STATUS DARK BLUE TESTING"}

#BB keywords: MFA Status darkblue dark blue