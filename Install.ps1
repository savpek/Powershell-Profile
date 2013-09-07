$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition

Get-ChildItem -Recurse $scriptPath\* | Unblock-File

Add-Content $profile ". '$scriptPath\InitProfile.ps1'"

Write-Host "Install chocolate package manager." -ForegroundColor Green
powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"
Add-Content $profile "`$env:Path += `";C:\chocolatey\bin;`""
$env:Path += ";C:\chocolatey\bin;"

Write-Host "Installing git." -ForegroundColor Green
cinst git
Add-Content $profile "`$env:Path += `";C:\git\bin;`""
$env:Path += ";C:\git\bin;"

Write-Host "Installing poshgit!" -ForegroundColor Green
cinst poshgit

Write-Host "Installing notepad2." -ForegroundColor Green
cinst notepad2

Write-Host "Installing P4Merge." -ForegroundColor Green
cinst P4Merge

Write-Host "Installing DevBox settings for git (P4Merge, Notepad2 ...)." -ForegroundColor Green
cinst Devbox-GitSettings

Write-Host "Installing 7Zip." -ForegroundColor Green
cinst 7zip.install

Write-Host "Installing Pester." -ForegroundColor Green
cinst pester

Write-Host "Installing Google Chrome" -ForegroundColor Green
cinst GoogleChrome

Write-Host "Installing putty." -ForegroundColor Green
cinst putty

Write-Host "Insalling adobe reader." -ForegroundColor Green
cinst adobereader

Write-Host "Install greenshot." -ForegroundColor Green
cinst greenshot

Write-Host "Install linqPad4." -ForegroundColor Green
cinst linqpad4

Write-Host "Install LogExpert." -ForegroundColor Green
cinst logexpert