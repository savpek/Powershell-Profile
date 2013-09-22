function New-ChocolateyTemplate {
    [cmdletbinding()]
    Param(
        [Parameter(Mandatory=$true)][string]$Name, 
        [Parameter(Mandatory=$true)][string]$Version,
        [Parameter(Mandatory=$true)][string]$Author,
        [Parameter(Mandatory=$true)][string]$HomePage)

    New-item -ItemType directory -Force ".\$Name.install"
    New-Item -ItemType directory -Force ".\$Name.install\tools\"
    New-Item -ItemType directory -Force ".\$Name.install\contents\"

    $nuspecFile = @"
<?xml version="1.0" encoding="utf-8"?>
<package xmlns="http://schemas.microsoft.com/packaging/2010/07/nuspec.xsd">
    <metadata>
    <id>$Name.install</id>
    <title>$Name (Install)</title>
    <version>$Version</version>
    <authors>$Author</authors>
    <owners>$Author</owners>
    <summary>$Name</summary>
    <description>$Name</description>
    <projectUrl>$HomePage</projectUrl>
    <tags>$Name</tags>
    <copyright></copyright>
    <licenseUrl>$HomePage</licenseUrl>
    <requireLicenseAcceptance>false</requireLicenseAcceptance>
    <!--<iconUrl>https://raw.github.com/__CHOCO_PKG_OWNER_REPO__/master/__NAME__/__NAME__.png</iconUrl>-->
    <!--<dependencies>
        <dependency id="" version="" />
    </dependencies>-->
    <releaseNotes></releaseNotes>
    </metadata>
    <files>
    <file src="tools\**" target="tools" />
    <!--<file src="content\**" target="content" />-->
    </files>
</package>
"@

    Set-Content -Force ".\$Name.install\$Name.install.nuspec" $nuspecFile
    PsEdit ".\$Name.install\$Name.install.nuspec"

    $installerFile = @"
#NOTE: Please remove any commented lines to tidy up prior to releasing the package, including this one

`$packageName = '$Name' # arbitrary name for the package, used in messages
`$installerType = 'EXE_OR_MSI' #only one of these two: exe or msi
`$url = 'URL_HERE' # download url
`$url64 = `$url # 64bit URL here or just use the same as `$url
`$silentArgs = 'SILENT_ARGS_HERE' # "/s /S /q /Q /quiet /silent /SILENT /VERYSILENT" # try any of these to get the silent installer #msi is always /quiet
`$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx

# main helpers - these have error handling tucked into them already
# installer, will assert administrative rights
Install-ChocolateyPackage "`$packageName" "`$installerType" "`$silentArgs" "`$url" "`$url64"  -validExitCodes `$validExitCodes
"@

    Set-Content -Force ".\$Name.install\tools\chocolateyInstall.ps1" $installerFile
    PsEdit ".\$Name.install\tools\chocolateyInstall.ps1"
}