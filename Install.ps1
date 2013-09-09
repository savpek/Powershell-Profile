Set-StrictMode -Version Latest

$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition;

if(-not(Test-Path $profile)) {
    New-Item -ItemType file -force $profile
}

Add-Content $profile ". '$($installerPaths.CustomShellProfile)\InitProfile.ps1'"

. $profile
