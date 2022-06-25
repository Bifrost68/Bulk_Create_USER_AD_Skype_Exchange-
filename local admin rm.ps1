$userlist=import-csv "C:\Maintenance\script\Local admin.csv" -Delimiter ";"
Start-Transcript -path "C:\Maintenance\script\COMPUTERCLEAN.TXT"
foreach ($user in $userlist)
{
$computer = $user.hostname
$Userlocal = $user.name
Invoke-Command -ComputerName "$computer" -ScriptBlock { Remove-LocalGroupMember -Group administrators -Member $userlocal } 
write-host $computer
write-host $userlocal
}
Stop-Transcript 