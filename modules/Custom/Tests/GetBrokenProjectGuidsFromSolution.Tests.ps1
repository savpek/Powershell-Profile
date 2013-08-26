if(-not $pester) { return }

$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition

. $scriptPath\..\Functions\GetBrokenProjectGuidsFromSolution.ps1

Describe "Function: GetBrokenProjectGuildFromSolution.Tests" {
    Context "Invalid project paths." {
        Mock Test-Path { return $false } -verifiable
        
        It "With no broken paths return empty array." {
            (GetBrokenProjectGuidsFromSolution "SolutionContents").Count | Should Be 0
        }

        It "Parse paths correctly from solution file and ask them from Test-Path." {
            $testData = '
                Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Project1", "Path\Project1.csproj", "{522F42A5-BF3F-40E8-8AD0-B4DB587662FB}"
                EndProject
                Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Project2", "Path\Project2.csproj", "{522F42A5-BF3F-40E8-8AD0-B4DB587662FB}"
                EndProject'
            
            GetBrokenProjectGuidsFromSolution $testData

            Assert-MockCalled Test-Path -Times 1 -parameterFilter {$path -eq "Path\Project1.csproj"}
            Assert-MockCalled Test-Path -Times 1 -parameterFilter {$path -eq "Path\Project2.csproj"}
        }
    }
    


    It "With broken paths return GUID:s of broken projects." {
        
    }
}