function New-TempScript() {
    $file = [System.IO.Path]::GetTempFileName()
    psedit $file
}