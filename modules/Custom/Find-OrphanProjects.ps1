$psScriptRoot = Split-Path -parent $PSCommandPath

. $psScriptRoot\Functions\ReadProjectInformationFromSolution.ps1



function Find-OrphanProjects([Parameter(Mandatory=$true)][String]$solutionFiles, [String[]]$searchRoot = ".\") {
    # Private methods.
    function CheckGuid($guids, $projectContents) {
        foreach($guid in $guids) {
            if($projectContents -like "*$guid*") {
                return $true
            }
        }

        return $false
    }

    # Function.
    $projectInfos = @()
    foreach($solutionPath in $solutionFiles) {
        $solutionContent = Get-Content -Path $solutionPath
        $projectInfos += ReadProjectInformationFromSolution $solutionContent
    }

    $projectFiles = Get-ChildItem -Recurse "$searchRoot\*.csproj"

    $invalidProjects = @()

    foreach($project in $projectFiles) {
        $projectContent = Get-Content $project
        if(-not (CheckGuid ($projectInfos | Select-Object -ExpandProperty Id) $projectContent)) {
            $invalidProjects += $project
        }
    }

    foreach($project in $invalidProjects) {
        "$project"
    }
}