Set-StrictMode -Version Latest

$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition;

function Installer([string]$scriptPath) {
    . "$scriptPath\InstallFunctions\CommonFunctions.ps1"
    . "$scriptPath\InstallFunctions\CommonPaths.ps1"

    CreateIfMissingFile $profile
    CreateIfMissingDir $installerPaths.GitHub

    function InstallChocolatey() {
        Write-Host "Install chocolate package manager." -ForegroundColor Green
        powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"
        AddPathToEnvironment ";C:\chocolatey\bin;"
    }

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
    Install "warmup" "nuget.exe"

    function ConfigurePowerShellProfile() {
        Write-Host "Install powershell profile." -ForegroundColor Green
        
        GitHubClone "https://github.com/savpek/Powershell-Profile.git" $installerPaths.GitHub
        
        Add-Content $profile ". '$($installerPaths.CustomShellProfile)\InitProfile.ps1'"
    }
    ConfigurePowerShellProfile

    CreateIfMissingDir "${env:APPDATA}\Dexpot\Profile\"
    Copy-Item "$($installerPaths.CustomShellProfile)\InstallationFiles\*.dxp" "${env:APPDATA}\Dexpot\Profile\" -Force

    function InstallWarmUp() {
        warmup addTextReplacement __CHOCO_PKG_OWNER_NAME__ "Savpek"
        warmup addTextReplacement __CHOCO_PKG_OWNER_REPO__ "savpek/Powershell-Profile/InstallationFiles"
        warmup addTextReplacement __CHOCO_AUTO_PKG_OWNER_REPO__ "savpek/Powershell-Profile/InstallationFiles"

        Copy-Item "$($installerPaths.CustomShellProfile)\InstallationFiles\*" "C:\CODE\_templates\"
    }
    InstallWarmUp

    Write-Host "Notes:" -ForegroundColor Green
    "Open dexpot and set Savpek profile, this step isn't automated."
}

Installer $scriptPath

. $profile
