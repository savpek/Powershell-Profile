function Repair-VisualStudioStructure([Switch] $tfs) 
{
    "Clearing .suo files..."
    Get-ChildItem -Recurse *.suo | Remove-Item -Force

    "Removing solution control crap from solution files."
    $solutions = Get-ChildItem -Recurse *.sln

    foreach($solution in $solutions) {
        $contents = [System.IO.File]::ReadAllText($solution.Fullname)
        $contents = $contents -replace "(?s)GlobalSection\(TeamFoundationVersionControl\).*?EndGlobalSection", ""

        $path = $solution.FullName

        if($tfs) {
            tf.exe lock /lock:none "$path"
            tf checkout "$path"
        }

        Set-Content -Value $contents -Path $path
    }
}
