#To get the list of VM Names
$VMnames = Get-VM | Select-Object | ForEach-Object {$_.Name}
#Getting the VM Names alone to VMnames variable

# Setting the New Vm names to each VM in VMnames variable
ForEach ($i in $VMnames)

{
echo "Old VMname $i"
$newname = Read-Host "New hostname"
Get-VM $i |Set-VM -name $newname -Confirm:$false
$ChangedVM = Get-VM $newname |  Select Name -ExpandProperty Name
echo "VM Name has been successfully changed to $ChangedVM"
}