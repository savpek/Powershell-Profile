Set-StrictMode -Version Latest

$psScriptRoot = Split-Path -parent $PSCommandPath
Push-Location $psScriptRoot
. .\Notepad2Wrappers.ps1
. .\gitExtensions.ps1
. .\serviceExtensions.ps1
Pop-Location

Set-StrictMode -Off