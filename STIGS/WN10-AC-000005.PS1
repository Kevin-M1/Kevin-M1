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
# Create full STIG-compliant account lockout policy
$infContent = @"
[System Access]
LockoutBadCount = 5
ResetLockoutCount = 15
LockoutDuration = 15
"@

# Save to temp file
$tempInf = "$env:TEMP\STIG_Lockout.inf"
$infContent | Out-File -Encoding ASCII -FilePath $tempInf

# Apply the policy
secedit /configure /db C:\Windows\Security\Database\STIG_Lockout.sdb /cfg $tempInf /quiet

# Refresh policy engine
gpupdate /force

# Clean up
Remove-Item $tempInf
Write-Host "STIG-compliant account lockout policy applied successfully."

