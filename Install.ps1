$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition

Invoke-Expression "$scriptPath\modules\posh-git\install.ps1"

Add-Content $profile ". '$scriptPath\InitProfile.ps1'"