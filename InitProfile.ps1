$root = Split-Path -parent $PSCommandPath

# Custom modules, remember, dont add last "\" at end of path ...
# Load posh-git example profile
. "$root\Modules\posh-git\profile.example.ps1"

Import-Module "$root\modules\PsGet"
Import-Module "$root\modules\savpek"

$xGitHub = "$root\..\\"
<<<<<<< HEAD
$xProfile = $root

$env:path += ";$root\bin\Notepad2"
$env:GIT_EDITOR = "Notepad2.exe"
=======
$xProfile = $root
>>>>>>> 44b3e9a1dde6b6def29383085a5dc3e78421494a
