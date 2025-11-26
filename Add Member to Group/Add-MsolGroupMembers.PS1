Import-CSv -Path “c:\Temp\Choptank365Group.csv” | ForEach {

$UPN=$_.UserPrincipalName

$Users=Get-MsolUser -UserPrincipalName $UPN

$Groupid = Get-MsolGroup -ObjectId “0c8362fda-020f-419a-9af1-617201b4d312”

$Users | ForEach {Add-MsolGroupMember -GroupObjectId $GroupID.ObjectID -GroupMemberObjectId $Users.ObjectID -GroupMemberType User}

}