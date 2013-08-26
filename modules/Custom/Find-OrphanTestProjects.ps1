function Find-OrphanTestProjects () 
{
    $projects = Get-ChildItem -Recurse *.csproj

    $nonTestProjects = $projects -notlike "*.*tests*.csproj"
    $testProjects = $projects -like "*.*tests*.csproj"

    foreach ($testProject in $testProjects) {
        $tokens = $testProject -split "\\"
        $testProjectPlainName = $tokens[-1] -replace "\.[a-z]*tests[a-z]*?.*\.csproj",""

        $matching = $nonTestProjects -like "*\$testProjectPlainName.csproj"

        "Attempting to find matches for $testProject"

        if($matching.Length -eq 0) 
        {
            Write-Host "Cannot find matching project for: $testProject" -ForegroundColor Yellow
        }

        if($matching.Length -gt 1) 
        {
            Write-Host "Multiple matching project for: $testProject, Matching: $matching" -ForegroundColor Yellow
        }
    }
}