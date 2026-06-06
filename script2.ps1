<#
Suspicious File Scanner in a System Directory
This script scans a user-specified directory for potentially dangerous files
(.exe, .ps1, .bat) and logs the results into scan_report.txt
#>

# Prompt user for directory path
$Directory = Read-Host "Enter the directory path to scan"

# Report file path
$ReportFile = ".\scan_report.txt"

# Define suspicious extensions
$SuspiciousExtensions = @(".exe", ".ps1", ".bat")

# Clear old report if it exists
if (Test-Path $ReportFile) {
    Clear-Content $ReportFile
}

Write-Host "`nScanning directory: $Directory" -ForegroundColor Cyan

# Scan for suspicious files
$SuspiciousFiles = Get-ChildItem -Path $Directory -Recurse -ErrorAction SilentlyContinue |
    Where-Object { $SuspiciousExtensions -contains $_.Extension.ToLower() }

if ($SuspiciousFiles.Count -gt 0) {
    foreach ($File in $SuspiciousFiles) {
        Write-Host "[WARNING] Suspicious file detected: $($File.FullName)" -ForegroundColor Red
        Add-Content -Path $ReportFile -Value "[$(Get-Date)] Suspicious file: $($File.FullName)"
    }
    Write-Host "`n[INFO] Scan complete. Report saved to $ReportFile" -ForegroundColor Yellow
} else {
    Write-Host "`n[INFO] No suspicious files found in $Directory" -ForegroundColor Green
    Add-Content -Path $ReportFile -Value "[$(Get-Date)] No suspicious files found in $Directory"
}
