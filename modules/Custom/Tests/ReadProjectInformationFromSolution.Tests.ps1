if(-not $pester) { return }

$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition

. $scriptPath\..\Functions\ReadProjectInformationFromSolution.ps1

Describe "Function: ReadProjectInformationFromSolution.Tests" {

    It "With one project in solution file, return correct values." {
        $testData = '
            Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Project1", "Path\Project1.csproj", "{522F42A5-BF3F-40E8-8AD0-B4DB587662FB}"
            EndProject
            Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Project2", "Path\Project2.csproj", "{522F42A5-BF3F-40E8-8AD0-B4DB587662FB}"
            EndProject'

        $results = ReadProjectInformationFromSolution $testData

        $results.Count | Should Be 2
        $results[0].Id | Should Be "522F42A5-BF3F-40E8-8AD0-B4DB587662FB"
        $results[0].Path | Should Be "Path\Project1.csproj"
        $results[0].Name | Should Be "Project1"

        $results[1].Id | Should Be "522F42A5-BF3F-40E8-8AD0-B4DB587662FB"
        $results[1].Path | Should Be "Path\Project2.csproj"
        $results[1].Name | Should Be "Project2"
    }
}