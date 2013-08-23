function Find-NotMatchingAssemblyName () 
{
    Get-ChildItem -Recurse *.csproj | Select-Xml -XPath "//ns:AssemblyName" -Namespace @{ns="http://schemas.microsoft.com/developer/msbuild/2003"} | Where { $_.Path -notlike "*" + $_.Node.'#text' + "*" } | foreach { "Project: " + $_.Path + " and name: " + $_.Node.'#text' + " Does not match!" }
}

function Find-NotMatchingNamespace () 
{
    Get-ChildItem -Recurse *.csproj | Select-Xml -XPath "//ns:RootNamespace" -Namespace @{ns="http://schemas.microsoft.com/developer/msbuild/2003"} | Where { $_.Path -notlike "*" + $_.Node.'#text' + "*" } | foreach { "Project: " + $_.Path + " and name: " + $_.Node.'#text' + " Does not match!" }
}

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

function Repair-VisualStudioStructure() 
{
    "Clearing .suo files..."
    Get-ChildItem -Recurse *.suo | Remove-Item -Force
}

function Move-VisualStudioProject() 
{
}

function UpdateProjectName([string] $solutionContents, [string]$projectGuid, [string]$newProjectName) {
    
    if($solutionContents -notlike "*$projectGuid*")
    {
        Throw "Invalid guid, cannot find guid in solution contents."
    }

    $pattern = $projectGuid+'}") = ".*?"' -replace "-","\-" -replace "}","\}" -replace '"','\"' -replace "\)","\)"
    $replacement = $projectGuid+'}") = "' + $newProjectName + '"'

    return $solutionContents -replace $pattern, $replacement
}

