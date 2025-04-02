SYNOPSIS
    This script ensures the DisableInventory setting is configured appropriately, enhancing system security by preventing unauthorized data collection.  STIG WN10-CC-000175.PS1

.NOTES
    Author          : Kevin Mejia
    LinkedIn        :https://www.linkedin.com/in/kevin-mejia-901039270/
    GitHub          : https://github.com/Kevin-M1
    Date Created    : 2025-04-01
    Last Modified   : 2025-04-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000175

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> WN10-CC-000175.ps1 
#>

PS C:\Users\Kevin0715># WN10-CC-000175 Compliance Fix: Disable Inventory Collector

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat"
$regName = "DisableInventory"
$desiredValue = 1

# Create key if it doesn't exist
If (-Not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
    Write-Output "Created missing registry path: $regPath"
}

# Check current value
$currentValue = (Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue).$regName

# Apply fix if value is missing or incorrect
If ($currentValue -ne $desiredValue) {
    Set-ItemProperty -Path $regPath -Name $regName -Value $desiredValue -Type DWord
    Write-Output "✔️ 'DisableInventory' set to $desiredValue at $regPath"
} else {
    Write-Output "✅ 'DisableInventory' is already set correctly to $desiredValue"
}
