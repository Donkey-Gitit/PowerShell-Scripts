# Connect to Exchange Online
Connect-ExchangeOnline -UserPrincipalName admin@yourdomain.com

# Define variable for M365 group name
$GroupName = "Sales Team"

# Disable the welcome message
Set-UnifiedGroup -Identity $GroupName -UnifiedGroupWelcomeMessageEnabled:$false

# Check if welcome message enabled
Get-UnifiedGroup -Identity $GroupName | Select-Object Name, DisplayName, PrimarySmtpAddress, WelcomeMessageEnabled 
