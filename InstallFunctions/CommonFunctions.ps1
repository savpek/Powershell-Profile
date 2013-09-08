function AddPathToEnvironment([string]$path) {
    $env:Path += ";$path;"

    if(-not (Get-Content $profile | Select-String -SimpleMatch "*;$path;*" -Quiet)) {
        "Adding $path to path variables."
        Add-Content $profile "`$env:Path += `";$path;`""
    }
}

function CreateIfMissingFile($path) {
    if(-not (Test-Path $path)) {
        New-Item -Force -ItemType file $path
    }
}

function CreateIfMissingDir($path) {
    if(-not (Test-Path $path)) {
        New-Item -Force -ItemType directory $path
    }
}

function Install([string]$Name, [string[]]$exeNames = @()) {
    Write-Host "Installing $Name." -ForegroundColor Green
    cinst $name

    if($exeNames.Count -ne 0) {
        foreach($exe in $exeNames) {
            $path = GetDirectoryOfFile $exe
            AddPathToEnvironment $path
        }
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

function GitHubClone([string]$repository, [string]$targetFolder) {
    Write-Host "Cloning $repository" -ForegroundColor Green

    Push-Location $targetFolder
        git clone $repository
        Get-ChildItem -Recurse "$folder\*" | Unblock-File
    Pop-Location
}
