$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition

Add-Content $profile ". '$scriptPath\InitProfile.ps1'"