function ReadProjectInformationFromSolution([string] $solutionContents) {
    
    $results = @()

    $matches = $solutionContents | Select-String -Pattern "Project\(`"\{(.*?)\}\`"\) = `"(.*?)`", \`"(.*?)\`", \`"\{(.*?)\}" -AllMatches
    $matches = $matches | Select -ExpandProperty matches

    foreach($match in $matches) {
        $projectInfo = [PsCustomObject] @{
            Name = $match.Groups[2];
            Path = $match.Groups[3];
            Id = $match.Groups[1];
        }

        $results += $projectInfo;
    }

    return $results
}