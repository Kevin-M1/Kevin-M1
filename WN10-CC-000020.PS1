<#
.SYNOPSIS
    This PowerShell script ensures Configuring the system to disable IPv6 source routing protects against spoofing.

.NOTES
    Author          : Kevin Mejia
    LinkedIn        :https://www.linkedin.com/in/kevin-mejia-901039270/
    GitHub          : https://github.com/Kevin-M1
    Date Created    : 2025-04-02
    Last Modified   : 2025-04-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000020

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__(WN10-CC-000020).ps1 
#>

PS C:\Users\Kevin0715># STIG ID: WN10-CC-000020
# Description: Ensure DisableIpSourceRouting is set to 2 for IPv6 (Protection against spoofing)

$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters"
$valueName = "DisableIpSourceRouting"
$desiredValue = 2

# Check if registry path exists
if (!(Test-Path $regPath)) {
    Write-Output "Registry path does not exist. Creating path..."
    New-Item -Path $regPath -Force | Out-Null
}

# Check if the registry value exists
$currentValue = Get-ItemProperty -Path $regPath -Name $valueName -ErrorAction SilentlyContinue

if ($null -eq $currentValue) {
    Write-Output "Value not found. Creating $valueName with value $desiredValue..."
    New-ItemProperty -Path $regPath -Name $valueName -Value $desiredValue -PropertyType DWORD -Force | Out-Null
} elseif ($currentValue.$valueName -ne $desiredValue) {
    Write-Output "Incorrect value detected ($($currentValue.$valueName)). Updating to $desiredValue..."
    Set-ItemProperty -Path $regPath -Name $valueName -Value $desiredValue
} else {
    Write-Output "$valueName is already set to the correct value ($desiredValue). No action needed."
}

Write-Output "Operation complete. A system reboot is recommended for changes to take full effect."
