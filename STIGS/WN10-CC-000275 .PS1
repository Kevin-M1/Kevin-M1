<#
.SYNOPSIS
    This PowerShell script ensures prevents users from sharing the local drives on their client computers to Remote Session Hosts that they access helps reduce possible exposure of sensitive data.
    STIG ID: WN10-CC-000275

.NOTES
    Author          : Kevin Mejia
    LinkedIn        :https://www.linkedin.com/in/kevin-mejia-901039270/
    GitHub          : https://github.com/Kevin-M1
    Date Created    : 2025-04-02
    Last Modified   : 2025-04-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         :WN10-CC-000275

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    
    Example syntax:
    PS C:\> .\__(STIG ID: WN10-CC-000275).ps1 
#>

PS C:\Users\Kevin0715># STIG ID: WN10-CC-000275
# Disable Client Drive Mapping (fDisableCdm = 1)

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
$regName = "fDisableCdm"
$desiredValue = 1

# Create the key if it doesn't exist
If (-Not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
    Write-Output "Created missing registry path: $regPath"
}

# Check current value
$currentValue = (Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue).$regName

# Set the value if missing or incorrect
If ($currentValue -ne $desiredValue) {
    Set-ItemProperty -Path $regPath -Name $regName -Value $desiredValue -Type DWord
    Write-Output "✔️ 'fDisableCdm' set to $desiredValue at $regPath"
} else {
    Write-Output "✅ 'fDisableCdm' is already set correctly to $desiredValue"
