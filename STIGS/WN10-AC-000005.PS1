<#
 .SYNOPSIS  
    This Powershell scrip ensures Windows 10 account lockout duration must be configured to 15 minutes or greater.


.NOTES
    Author          : Kevin Mejia
    LinkedIn        :https://www.linkedin.com/in/kevin-mejia-901039270/
    GitHub          : https://github.com/Kevin-M1
    Date Created    : 2025-08-31
    Last Modified   : 2025-08-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
   
    Example syntax:
    PS C:\> .WN10-AC-000005.ps1 
#>

# Define the security template content
$template = @"
[System Access]
LockoutBadCount = 5
ResetLockoutCount = 15
LockoutDuration = 15
"@

# Save the template to a temporary file
$tempFile = "$env:TEMP\STIG_Lockout.inf"
$template | Out-File -Encoding ASCII -FilePath $tempFile

# Apply the security settings
secedit /configure /db secedit.sdb /cfg $tempFile /quiet

# Clean up
Remove-Item $tempFile
Write-Host "STIG-compliant account lockout policy applied."
