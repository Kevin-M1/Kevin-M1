<#
 .SYNOPSIS  
    This PowerShell script disables the indexing of encrypted files by setting the required registry key, ensuring compliance with STIG ID: WN10-CC-000305.


.NOTES
    Author          : Kevin Mejia
    LinkedIn        :https://www.linkedin.com/in/kevin-mejia-901039270/
    GitHub          : https://github.com/Kevin-M1
    Date Created    : 2025-04-01
    Last Modified   : 2025-04-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000305

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-CC-000305.ps1 
#>

PS C:\Users\Kevin0715> # Define the registry path and value
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
$name = "AllowIndexingEncryptedStoresOrItems"
$value = 0

# Create the key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the value to 0 (disabled)
Set-ItemProperty -Path $regPath -Name $name -Value $value -Type DWord

# Output confirmation
$current = Get-ItemProperty -Path $regPath -Name $name
Write-Host "AllowIndexingEncryptedStoresOrItems set to:" $current.$name

AllowIndexingEncryptedStoresOrItems set to: 0

PS C:\Users\Kevin0715> 
