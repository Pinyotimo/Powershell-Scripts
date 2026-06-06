<# User Authentication and Login Logging System
A company system requires basic protection against unauthorized access. You are required to develop a PowerShell script that accepts a username and password from the user. The script should compare the entered credentials against a predefined admin account. If the credentials are correct, the system should display a successful login message; otherwise, it should deny access. Additionally, every login attempt, whether successful or not, must be recorded in a log file named “login_attempts.txt” together with the date and time of the attempt. This helps system administrators track suspicious login activity.


User Authentication and Login Logging System
This script prompts for a username and password, validates against a predefined admin account,
and logs every attempt (success or failure) with timestamp, username, and password into login_attempts.txt
#>

$LogFile = ".\login_attempts.txt"
$AdminUser = "Admin"
$AdminPass = "Steve@123"

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "      SYSTEM AUTHENTICATION GATEWAY      " -ForegroundColor Cyan
Write-Host "=========================================`n" -ForegroundColor Cyan

# Prompt user for credentials
$EnteredUser = Read-Host "Enter Username"
$EnteredPass = Read-Host "Enter Password"

$TimeStamp = Get-Date

# Validate credentials
if ($EnteredUser -eq $AdminUser -and $EnteredPass -eq $AdminPass) {
    Write-Host "`n[SUCCESS] Access Granted. Welcome, $EnteredUser!" -ForegroundColor Green
    $LogMessage = "[$TimeStamp] SUCCESSFUL LOGIN - User: $EnteredUser - Password: $EnteredPass"
} else {
    Write-Host "`n[ERROR] Access Denied. Invalid credentials." -ForegroundColor Red
    $LogMessage = "[$TimeStamp] FAILED LOGIN - User: $EnteredUser - Password: $EnteredPass"
}

# Append log entry to file
Add-Content -Path $LogFile -Value $LogMessage
Write-Host "`n[INFO] Attempt recorded in log file." -ForegroundColor Yellow
