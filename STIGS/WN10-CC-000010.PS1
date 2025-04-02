.SYNOPSIS
  This PowerShell script disables the lock screen slide show feature, which could otherwise display sensitive information to unauthorized individuals.
Turning off this feature helps ensure that such information is only accessible to a logged-in user.

.NOTES
    Author          : Kevin Mejia
    LinkedIn        :https://www.linkedin.com/in/kevin-mejia-901039270/
    GitHub          : https://github.com/Kevin-M1
    Date Created    : 2025-04-02
    Last Modified   : 2025-04-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000010

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    
    Example syntax:
    PS C:\> .\__(WN10-CC-000010).ps1 
#>


PS C:\Users\Kevin0715># STIG ID: WN10-CC-000010
# Description: Ensure NoLockScreenSlideshow is set to 1 (Disables lock screen slideshow)

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$valueName = "NoLockScreenSlideshow"
$desiredValue = 1

# Create registry path if it doesn't exist
if (!(Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating: $regPath"
    New-Item -Path $regPath -Force | Out-Null
}

# Check and set the value
$currentValue = Get-ItemProperty -Path $regPath -Name $valueName -ErrorAction SilentlyContinue

if ($null -eq $currentValue) {
    Write-Output "Value not found. Creating $valueName with value $desiredValue..."
    New-ItemProperty -Path $regPath -Name $valueName -Value $desiredValue -PropertyType DWORD -Force | Out-Null
} elseif ($currentValue.$valueName -ne $desiredValue) {
    Write-Output "Incorrect value ($($currentValue.$valueName)). Updating to $desiredValue..."
    Set-ItemProperty -Path $regPath -Name $valueName -Value $desiredValue
} else {
    Write-Output "$valueName is already set to the correct value ($desiredValue). No action needed."
}

Write-Output "STIG fix complete. NoLockScreenSlideshow set to $desiredValue."
