$LogFile = ".\login_attempts.txt"
$AdminUser = "Admin"
$AdminPass = "Steve@123"

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "      SYSTEM AUTHENTICATION GATEWAY      " -ForegroundColor Cyan
Write-Host "=========================================`n" -ForegroundColor Cyan

$EnteredUser = Read-Host "Enter Username"
$PasswordPrompt = Read-Host "Enter Password" -AsSecureString
$EnteredPass = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($PasswordPrompt))

# Verified hyphens used below
$TimeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

if ($EnteredUser -eq $AdminUser -and $EnteredPass -eq $AdminPass) {
    Write-Host "`n[SUCCESS] Access Granted. Welcome, $AdminUser!" -ForegroundColor Green
    $LogMessage = "[$TimeStamp] SUCCESSFUL LOGIN - User: $EnteredUser"
} else {
    Write-Host "`n[ERROR] Access Denied. Invalid credentials." -ForegroundColor Red
    $LogMessage = "[$TimeStamp] FAILED LOGIN ATTEMPT - User: $EnteredUser"
}

Add-Content -Path $LogFile -Value $LogMessage
Write-Host "`n[INFO] Attempt recorded in log file." -ForegroundColor Yellow
