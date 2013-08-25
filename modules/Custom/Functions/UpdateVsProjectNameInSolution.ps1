function UpdateVsProjectNameInSolution([string] $solutionContents, [string] $projectGuid, [string] $newProjectName) 
{
    if($solutionContents -notlike "*$projectGuid*")
    {
        Throw "Invalid guid, cannot find guid in solution contents."
    }

    $pattern = $projectGuid+'}") = ".*?"' -replace "-","\-" -replace "}","\}" -replace '"','\"' -replace "\)","\)"
    $replacement = $projectGuid+'}") = "' + $newProjectName + '"'

    return $solutionContents -replace $pattern, $replacement
}