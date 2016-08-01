Set-StrictMode -Version Latest

if(-not(Test-Path $profile)) {
    New-Item -ItemType file -force $profile
}

Add-Content $profile ". '$($PSScriptRoot)\InitProfile.ps1'"

. $profile
