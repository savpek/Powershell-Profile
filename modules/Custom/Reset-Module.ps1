function Reset-Module {
    Param([string[]][Parameter(Mandatory)]$Modules)

    $modules | foreach {
        Remove-Module $_ -ErrorAction Ignore
        Import-Module $_
    }
}