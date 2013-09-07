if(-not (Test-Path $profile)) {
    New-Item -Force -ItemType file $profile
}

function InstallChocolatey() {
    Write-Host "Install chocolate package manager." -ForegroundColor Green
    powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"
    Add-Content $profile "`$env:Path += `";C:\chocolatey\bin;`""
    $env:Path += ";${env:ProgramFiles(x86)}\Git\bin;"
}

function Install([string]$Name, [string]$PathExtensionFolder = "") {
    Write-Host "Installing $Name." -ForegroundColor Green
    cinst $name

    if($PathExtensionFolder -ne "") {
        $env:Path += ";$PathExtension;"
        Add-Content $profile "`$env:Path += `";$PathExtensionFolder;`""
    }
}

Function InstallPowerShellProfile() {
    Write-Host "Install powershell profile." -ForegroundColor Green
    $scriptPath = split-path -parent $MyInvocation.MyCommand.Definition

    $githubAddr = "https://github.com/savpek/Powershell-Profile.git"
    $githubFolder = "${env:HomePath}\Documents\GitHub"
    $profileFolder = "$githubFolder\Powershell-Profile"

    if(-not (Test-Path $githubFolder)) {
        New-Item -ItemType Directory -Force $githubFolder
    }

    Push-Location $githubFolder

    git clone $githubAddr

    Push-Location $profileFolder

    Get-ChildItem -Recurse $profileFolder\* | Unblock-File

    Add-Content $profile ". '$profileFolder\InitProfile.ps1'"
}

InstallChocolatey

Install "git" "C:\git\bin"
Install "poshgit"
Install "notepad2"
Install "P4Merge"
Install "7Zip"
Install "Pester"
Install "GoogleChrome"
Install "putty"
Install "adobereader"
Install "greenshot"
Install "linqPad4"
Install "LogExpert"

InstallPowerShellProfile

. $profile