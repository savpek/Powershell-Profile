function Add-TfsCheckout(
        [Parameter(Position=0, ValueFromPipelineByPropertyName=$true)][Alias("FullName", "FilePath")]$Path) {
    process {
        Invoke-Expression ("tf checkout '{0}'" -f $Path)
        return $_
    }
}