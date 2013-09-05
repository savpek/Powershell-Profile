[System.Reflection.Assembly]::LoadWithPartialName('Microsoft.TeamFoundation.Client')
[System.Reflection.Assembly]::LoadWithPartialName('Microsoft.TeamFoundation.VersionControl.Client')
[System.Reflection.Assembly]::LoadWithPartialName('Microsoft.TeamFoundation.WorkItemTracking.Client')

Set-StrictMode -Version Latest

$psScriptRoot = Split-Path -parent $PSCommandPath

Push-Location $psScriptRoot

$files = Get-ChildItem *.ps1
foreach($file in $files) 
{
. $file
}

Pop-Location

Set-StrictMode -Off