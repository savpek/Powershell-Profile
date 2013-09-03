$root = Split-Path -parent $PSCommandPath

. $root\IseTheme.ps1

$env:PSModulePath += ";$root\modules\"

Import-Module PsGet
Import-Module Custom
Import-Module CSharp

try {
    Import-Module Posh-Git
}
catch {
    Write-Warning "Cannot load Posh-Git module, is it installed?"
}

$customPaths = New-Object PSObject
$customPaths | Add-Member -type NoteProperty -Name Root -Value $root

foreach($moduleFolder in (Get-ChildItem -Directory "$root\modules\")) 
{
    $customPaths | Add-Member -type NoteProperty -Name $moduleFolder.Name -Value $moduleFolder.FullName
}

$env:path += ";$root\bin\Notepad2"
$env:GIT_EDITOR = "Notepad2.exe"
