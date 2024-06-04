
User Group
----------------------

# Create Domain Users
New-ADUser -Name "User1" -GivenName "User" -Surname "One" -SamAccountName "User1" -UserPrincipalName "User1@abc.com" -AccountPassword (ConvertTo-SecureString "Asdf1234" -AsPlainText -Force) -Enabled $true

New-ADUser -Name "User2" -GivenName "User" -Surname "Two" -SamAccountName "User2" -UserPrincipalName "User2@abc.com" -AccountPassword (ConvertTo-SecureString "Asdf1234" -AsPlainText -Force) -Enabled $true

New-ADUser -Name "User3" -GivenName "User" -Surname "Three" -SamAccountName "User3" -UserPrincipalName "User3@abc.com" -AccountPassword (ConvertTo-SecureString "Asdf1234" -AsPlainText -Force) -Enabled $true

# Create Domain Groups
New-ADGroup -Name "Group1" -GroupScope Global
New-ADGroup -Name "Group2" -GroupScope Global

# Add Users to Groups
Add-ADGroupMember -Identity "Group1" -Members "User1", "User2"
Add-ADGroupMember -Identity "Group2" -Members "User2", "User3"

# Check if User1 exists
Get-ADUser -Identity User1
Get-ADUser -Identity User2
Get-ADUser -Identity User3

# Check if Group1 exists
Get-ADGroup -Identity Group1
Get-ADGroup -Identity Group2

# Check members of Group1,Group2
Get-ADGroupMember -Identity Group1
Get-ADGroupMember -Identity Group2

# Check groups for User1,User2,User3
Get-ADUser -Identity User1 -Properties MemberOf | Select-Object -ExpandProperty MemberOf
Get-ADUser -Identity User2 -Properties MemberOf | Select-Object -ExpandProperty MemberOf
Get-ADUser -Identity User3 -Properties MemberOf | Select-Object -ExpandProperty MemberOf
