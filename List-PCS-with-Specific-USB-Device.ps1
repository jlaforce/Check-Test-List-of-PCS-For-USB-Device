##Select Text List of Machines
Function Get-FileName($initialDirectory)
{   
    [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null

    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.InitialDirectory = $initialDirectory
    $OpenFileDialog.filter = "TXT (*.txt) | *.txt"
    $OpenFileDialog.ShowDialog() | Out-Null
    $OpenFileDialog.FileName
}
$inputfile = Get-FileName ".\"
$inputdata = Get-Content $inputfile
$pcs = $inputdata
## Create Name for the CSV
$listname = Read-Host "What would you like to tname the CSV file? (It will end in *.CSV)"
##This is to grab what USB device you are looking for
$USBDevice = Read-Host "Whats the Name of the USB Device you are looking for? ex. 'Samsung SSD'(w/o quotes)"
##using psexec to forcibly allow psremoting on  your list of PCs, if necessary delete the ##'s next to the lines
##foreach($pc in $pcs) {
##    .\PsExec.exe -nobanner \\$pc -h -s powershell.exe Enable-PSremoting -force
##    .\PsExec.exe -nobanner \\$pc -h -s powershell.exe 'winrm quickconfig'
##    .\PsExec.exe -nobanner \\$pc -h -s powershell.exe 'netsh advfirewall set allprofiles state off'
##    .\PsExec.exe -nobanner \\$pc -h -s powershell.exe 'netsh advfirewall set allprofiles settings remotemanagement enable'
##}

##Query for input USB Device
foreach($pc in $pcs) {
    Get-CIMInstance -ComputerName $pc -Query "SELECT * from CIM_LogicalDevice WHERE Caption LIKE '$USBDevice%'" | Select-Object SystemName, Name | Export-Csv -Path ".\$listname.csv" -NoTypeInformation -Append -Force
}
