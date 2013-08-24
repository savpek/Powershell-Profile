. .\VisualStudioExtensions.ps1

Describe "UpdateProjectName" {
    $testData = 'Microsoft Visual Studio Solution File, Format Version 12.00
                # Visual Studio 2013
                VisualStudioVersion = 12.0.20617.1 PREVIEW
                MinimumVisualStudioVersion = 10.0.40219.1
                Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "UnitTestProject1", "UnitTestProject1\UnitTestProject1.csproj", "{522F42A5-BF3F-40E8-8AD0-B4DB587662FB}"
                EndProject
                Project("{2150E333-8FDC-42A3-9474-1A3956D46DE8}") = ".nuget", ".nuget", "{CD340024-35CB-4431-ADCE-520E881ED394}"
	                ProjectSection(SolutionItems) = preProject
		                .nuget\packages.config = .nuget\packages.config
	                EndProjectSection
                EndProject'


    It "If cannot find guid from file, throw error." {
        { UpdateProjectName "ABC CONTENT" "GUID" "NewProjectName" } | Should Throw
    }

    It "If can find guid from file, dont throw error." {
        { UpdateProjectName "ABC GUID ABC" "GUID" "NewProjectName" } | Should Not Throw
    }

    $expected ='Microsoft Visual Studio Solution File, Format Version 12.00
                # Visual Studio 2013
                VisualStudioVersion = 12.0.20617.1 PREVIEW
                MinimumVisualStudioVersion = 10.0.40219.1
                Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "ChangeToThisProjectName", "UnitTestProject1\UnitTestProject1.csproj", "{522F42A5-BF3F-40E8-8AD0-B4DB587662FB}"
                EndProject
                Project("{2150E333-8FDC-42A3-9474-1A3956D46DE8}") = ".nuget", ".nuget", "{CD340024-35CB-4431-ADCE-520E881ED394}"
	                ProjectSection(SolutionItems) = preProject
		                .nuget\packages.config = .nuget\packages.config
	                EndProjectSection
                EndProject'

    It "If guid is found, replace project name with new one." {
        UpdateProjectName $testData "FAE04EC0-301F-11D3-BF4B-00C04F79EFBC" "ChangeToThisProjectName" | Should Be $expected
    }
}

Describe "UpdateProjectPath" {
    $testData = 'MinimumVisualStudioVersion = 10.0.40219.1
                Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "UnitTestProject1", "UnitTestProject1\UnitTestProject1.csproj", "{522F42A5-BF3F-40E8-8AD0-B4DB587662FB}"
                EndProject
                Project("{2150E333-8FDC-42A3-9474-1A3956D46DE8}") = ".nuget", ".nuget", "{CD340024-35CB-4431-ADCE-520E881ED394}"
	                ProjectSection(SolutionItems) = preProject
		                .nuget\packages.config = .nuget\packages.config
	                EndProjectSection
                EndProject'


    It "If cannot find guid from file, throw error." {
        { UpdateProjectPath "ABC CONTENT" "GUID" "NewProjectPath" } | Should Throw
    }

    It "If can find guid from file, dont throw error." {
        { UpdateProjectPath "ABC GUID ABC" "GUID" "NewProjectPath" } | Should Not Throw
    }

    $expected = 'MinimumVisualStudioVersion = 10.0.40219.1
                Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "UnitTestProject1", "Path\NewPath.csproj", "{522F42A5-BF3F-40E8-8AD0-B4DB587662FB}"
                EndProject
                Project("{2150E333-8FDC-42A3-9474-1A3956D46DE8}") = ".nuget", ".nuget", "{CD340024-35CB-4431-ADCE-520E881ED394}"
	                ProjectSection(SolutionItems) = preProject
		                .nuget\packages.config = .nuget\packages.config
	                EndProjectSection
                EndProject'

    It "If guid is found, replace project name with new one." {
        UpdateProjectPath $testData "FAE04EC0-301F-11D3-BF4B-00C04F79EFBC" "Path\NewPath.csproj" | Should Be $expected
    }
}