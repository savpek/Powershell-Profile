function UpdateVsProjectPathInSolution([string] $solutionContents, [string] $projectGuid, [string] $newProjectPath) 
{
    if($solutionContents -notlike "*$projectGuid*")
    {
        Throw "Invalid guid, cannot find guid in solution contents."
    }

    $pattern = "Project\(`"{$projectGuid}`"\) = `"(.*?)`", `".*?`", `"{(.*?)}"
    $pattern = SanitizeForRegEx($pattern)
    $replacement = "Project(`"{$projectGuid}`") = `"`$1`", `"$newProjectPath`", `"{`$2}"

    return $solutionContents -replace $pattern, $replacement
}