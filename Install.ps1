Set-StrictMode -Version Latest

if(-not (Test-Path $profile)) {
    New-Item -Force -ItemType file $profile
}

function AddPathToEnvironment([string]$path) {
    $env:Path += ";$path;"

    if(-not (Get-Content $profile | Select-String -SimpleMatch "*;$path;*" -Quiet)) {
        "Adding $path to path variables."
        Add-Content $profile "`$env:Path += `";$path;`""
    }
}

function GetDirectoryOfFile([string]$exeName) {
    $executable = Get-ChildItem -Recurse -ErrorAction Ignore "C:\*$exeName" | Select -First 1 -ExpandProperty FullName 

    if($executable) {
        return (Split-Path -parent $executable)
    }
    else {
        throw "Cannot locate exetutable: $exeName from C:\*"
    }
}

function InstallChocolatey() {
    Write-Host "Install chocolate package manager." -ForegroundColor Green
    powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"
    AddPathToEnvironment ";C:\chocolatey\bin;"
}

function Install([string]$Name, [string]$exeName = "") {
    Write-Host "Installing $Name." -ForegroundColor Green
    cinst $name

    if($exeName -ne "") {
        $path = GetDirectoryOfFile $exeName
        AddPathToEnvironment $path
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

$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition

InstallChocolatey
Install "git" "git.exe"
Install "poshgit"
Install "notepad2"
Install "winmerge" "WinMergeU.exe"
Install "7Zip"
Install "Pester"
Install "GoogleChrome"
Install "putty" "putty.exe"
Install "adobereader"
Install "greenshot"
Install "linqPad4"
Install "LogExpert"
Install "Dexpot"

if(-not (Test-Path "${env:APPDATA}\Dexpot\Profile\")) {
    New-Item -ItemType Directory "${env:APPDATA}\Dexpot\Profile\" -Force
}

Copy-Item "$scriptPath\InstallationFiles\*.dxp" "${env:APPDATA}\Dexpot\Profile\" -Force

InstallPowerShellProfile

. $profile