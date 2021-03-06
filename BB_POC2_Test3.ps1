###########################################################################################
# Name: BluBracket POC Test PS Script 3
# Version: 1.0
# Author: Victoria Wallace
# Date: 13th November 2020
#
# Notes: 
#	Initial version (1.0 - 13/11/20)
###########################################################################################

# Start script logging - Will check for file existence first and remove if found

$FileName = "C:\ScriptLogs\bb_poc.log"
if (Test-Path $FileName) {
  Remove-Item $FileName
}
$TranscriptFile = "C:\ScriptLogs\bb_poc.log"
Start-Transcript -Path $TranscriptFile

###########################################################################################
# Set variables / Create Functions / Import Modules
###########################################################################################

$DT_BB_POC1_Variable1 = @()
$DT_BB_POC2_Variable2 = @()

###########################################################################################
# Run Script
###########################################################################################

Write-Host ""
Write-Host "Test BluBracket Code Copy"
Write-Host ""

$BB_Host = $env:computername
$BB_Buckets = Get-S3Object -BucketName text-content -Key aws-tech-docs

# Invoke web request for sharepoint

Write-host "Web request - Sharepoint Docs" -ForegroundColor Green
(Invoke-WebRequest -Uri "https://datactics.sharepoint.com/sites/Infrastructure").Links.Href.

# Copy info to CSV for offline use

$BB_Host = $env:computername | Export-Csv C:\Temp\blubracket_copy.csv
$BB_Buckets = Get-S3Object -BucketName text-content -Key aws-tech-docs | Export-Csv c:\Temp\blubracket_copy1.csv

# Copy item and rename

Write-host "Copy and rename DT BB POC Test"
Copy-Item "C:\DT_BB_POC.htm" -Destination "C:\Documents\DT_BB_POC.txt"

###########################################################################################
# Stop script logging - Copies for historical records
###########################################################################################

Write-Host ""
$fileext = get-date -Format hh.mm.ss
Copy-Item -Path C:\Temp\VM_Tasks.log -Destination C:\Temp\VM_Tasks_$fileext.log
Stop-Transcript