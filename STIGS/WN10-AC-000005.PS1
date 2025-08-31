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
# Set Account Lockout Threshold (e.g., 5 failed logon attempts)
net accounts /lockoutthreshold:5

# Set Account Lockout Duration to 15 minutes
net accounts /lockoutduration:15

# Set Reset Account Lockout Counter After 15 minutes
net accounts /lockoutwindow:15

Write-Host "Account Lockout Policy updated:"
net accounts


# Clean up
Remove-Item $tempInf
Write-Host "STIG-compliant account lockout policy applied successfully."

