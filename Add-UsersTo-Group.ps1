# Define group name
$GroupName = "YourGroupName"

# Define user names (separated by commas if multiple)
$UserNames = "User1", "User2", "User3"

# Loop through each user and add them to the group
foreach ($UserName in $UserNames) {
    Add-ADGroupMember -Identity $GroupName -Members $UserName
}

# Display confirmation message
Write-Host "Users added to the group '$GroupName' successfully."
