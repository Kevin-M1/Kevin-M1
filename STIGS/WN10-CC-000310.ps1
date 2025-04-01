<#
 .SYNOPSIS  
    This Powershell script refers to security policy that ensures users are prevented from changing installiton options on windows systems. WN10-CC-000310 


.NOTES
    Author          : Kevin Mejia
    LinkedIn        :https://www.linkedin.com/in/kevin-mejia-901039270/
    GitHub          : https://github.com/Kevin-M1
    Date Created    : 2025-04-01
    Last Modified   : 2025-04-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000310

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
   
    Example syntax:
    PS C:\> .WN10-CC-000310.ps1 
#>

PS C:\Users\Kevin0715> $regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"
$name = "EnableUserControl"
$value = 0

# Ensure key exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Create or update the value
New-ItemProperty -Path $regPath -Name $name -Value $value -PropertyType DWord -Force | Out-Null

Write-Host "EnableUserControl successfully set to 0."
