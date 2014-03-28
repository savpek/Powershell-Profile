Set-StrictMode -Version Latest

$psScriptRoot = Split-Path -parent $PSCommandPath

if(-not (Get-Command -CommandType Application | where { $_.name -eq 'VBoxManage.exe' })) {
    throw "Cannot import VirtualBox module, reason: cannot find 'VBoxManage.exe' from path."
}

Push-Location $psScriptRoot

$files = Get-ChildItem *.ps1
foreach($file in $files) 
{
. $file
}

Pop-Location

Set-StrictMode -Off