$root = Split-Path -parent $PSCommandPath

# Custom modules, remember, dont add last "\" at end of path ...
# Load posh-git example profile
. "$root\Modules\posh-git\profile.example.ps1"

Import-Module "$root\modules\PsGet"
Import-Module "$root\modules\savpek"

$xGitHub = "$root\..\\"
$xProfile = $root

$env:path += ";$root\bin\Notepad2"
$env:GIT_EDITOR = "Notepad2.exe"
