# Define Active Directory domain details
$DomainName = "abc.com"
$OU = "OU=Users,DC=abc,DC=com"

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
