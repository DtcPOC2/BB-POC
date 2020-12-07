Write-Host "Results Count:" -BackgroundColor Cyan -ForegroundColor White

Show-EventLog

Register-ScheduledTask -TaskName "Schedule MFA Status Report" -Trigger $Time -Action $Action -RunLevel Highest

Get-View -ViewType VirtualMachine -Filter @{"Name" = "BB POC CYAN MFA STATUS TESTING"}

#BB keywords: MFA Status Cyan