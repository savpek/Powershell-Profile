function GetBrokenProjectGuidsFromSolution([string] $solutionContents) {
    
    if(Test-Path "Path\Project1.csproj") {
        return @()
    }
    return @()
}