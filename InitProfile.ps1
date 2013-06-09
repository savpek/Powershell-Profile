$root = Split-Path -parent $PSCommandPath

# Custom modules, remember, dont add last "\" at end of path ...
# Load posh-git example profile
. "$root\Modules\posh-git\profile.example.ps1"

Import-Module "$root\modules\savpek"

$env:_profile = $root
$env:_gitf = "$root\..\\"