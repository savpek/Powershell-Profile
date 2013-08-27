function New-TempScript() {
    $file = [System.IO.Path]::GetTempFileName() + ".ps1"
    New-Item -ItemType file -force $file
    psedit $file
}