# ADDC-AddUsers1
ADDC addusers

Below is a PowerShell script to create multiple users in Active Directory Domain Controller:

```powershell
# Define Active Directory domain details
$DomainName = "yourdomain.com"
$OU = "OU=Users,DC=yourdomain,DC=com"

# Define user details
$UserDetails = @(
    @{
        UserName = "User1"
        Password = "Password1"
        FirstName = "User"
        LastName = "One"
        Description = "Test User One"
    },
    @{
        UserName = "User2"
        Password = "Password2"
        FirstName = "User"
        LastName = "Two"
        Description = "Test User Two"
    },
    @{
        UserName = "User3"
        Password = "Password3"
        FirstName = "User"
        LastName = "Three"
        Description = "Test User Three"
    }
)

# Import Active Directory module
Import-Module ActiveDirectory

# Create users
foreach ($UserDetail in $UserDetails) {
    $FullName = $UserDetail.FirstName + " " + $UserDetail.LastName
    $UserPrincipal = $UserDetail.UserName + "@" + $DomainName
    
    New-ADUser -Name $FullName -SamAccountName $UserDetail.UserName -UserPrincipalName $UserPrincipal -AccountPassword (ConvertTo-SecureString $UserDetail.Password -AsPlainText -Force) -Enabled $true -Description $UserDetail.Description -Path $OU
}

# Display confirmation message
Write-Host "Users created successfully."
```

Here's how the script works:
1. Define the Active Directory domain details such as `$DomainName` and the Organizational Unit (`$OU`) where you want to create the users.
2. Define an array `$UserDetails` containing hash tables, where each hash table represents the details of a user to be created. Each hash table includes keys like `UserName`, `Password`, `FirstName`, `LastName`, and `Description`.
3. The script imports the Active Directory module.
4. It iterates through each user detail in the `$UserDetails` array and creates a user using the `New-ADUser` cmdlet.
5. The `New-ADUser` cmdlet creates a new Active Directory user account with the specified properties (username, password, full name, description) and places it in the specified OU.
6. After creating all users, it displays a confirmation message.

Before running the script, ensure you have the necessary permissions to create users in Active Directory, and adjust the domain details and user details in the script according to your environment. Additionally, execute the script on a computer where the Active Directory module is available.
