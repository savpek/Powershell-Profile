$root = Split-Path -parent $PSCommandPath


$env:PSModulePath += ";$root\modules\"

Import-Module Custom
Import-Module CSharp

$customPaths = New-Object PSObject
$customPaths | Add-Member -type NoteProperty -Name Root -Value $root

foreach($moduleFolder in (Get-ChildItem -Directory "$root\modules\")) 
{
    $customPaths | Add-Member -type NoteProperty -Name $moduleFolder.Name -Value $moduleFolder.FullName
    Import-Module $moduleFolder
}

git config --global user.email "savolainen.pekka@gmail.com"
git config --global user.name "Savpek"
git config --global core.autocrlf true

git config --global core.editor "code --wait"

git config --global mergetool.keepBackup false

$env:GIT_EDITOR = "notepad"

if($psIse) {
    . $root\IseExtensions.ps1
    . $root\IseTheme.ps1
}