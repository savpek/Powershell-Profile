function New-ChocolateyPackage {
    [Cmdletbinding()]
    Param(
        [Parameter(Mandatory=$true)][string]$Name,
        [Parameter(Mandatory=$true)][string]$SourceFolder, 
        [Parameter(Mandatory=$true)][switch]$Test)
    
    if($SourceFolder -like "*.\*") {
        throw "You should give full path, '.\' eg. format is not acceptable for SourceFolder."
    }

    Push-Location $SourceFolder

    try {
        $specFile = Get-ChildItem *.nuspec |Select-Object -First 1 -ExpandProperty FullName

        if(-not $specFile) {
            throw "Cannot locate *.nuspec file from source folder. Abort."
        }

        "Create package..."
        Get-ChildItem "*.nupkg" | Remove-Item -Force
        nuget pack $specFile
    } 
    finally {
        Pop-Location
    }

    if($Test) {
        "Test..."
        cinst $Name -source $SourceFolder -force
    }

}