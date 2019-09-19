$ImageFiles = "\\pcbnu011720\Senior\"
$ValidPath = Test-Path $ImageFiles -IsValid
If ($ValidPath -eq $True) {Write-Host "Path is OK"}
Else {Write-Host "Path is not OK"}