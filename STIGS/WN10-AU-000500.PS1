
<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Kevin Mejia
    LinkedIn        :https://www.linkedin.com/in/kevin-mejia-901039270/
    GitHub          : https://github.com/Kevin-M1
    Date Created    : 2025-03-31
    Last Modified   : 2025-03-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

PS C:\Users\Kevin0715> # Define the registry path and value
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$propertyName = "MaxSize"
$propertyValue = 32768

# Check if the key exists, if not create it
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the MaxSize value
Set-ItemProperty -Path $regPath -Name $propertyName -Value $propertyValue -Type DWord

# Confirm the setting
$setValue = Get-ItemProperty -Path $regPath -Name $propertyName
Write-Output "MaxSize is now set to: $($setValue.$propertyName) KB"

MaxSize is now set to: 32768 KB

PS C:\Users\Kevin0715>
