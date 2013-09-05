function Get-TfsIterations([Parameter(Mandatory=$true)][string] $collectionUri) {
    $storage = Get-TfsWorkItemStorage $collectionUri
    
    foreach($project in $storage.Projects) {
        Write-Host -ForegroundColor Yellow "Project:" $project.Name
        
        foreach($iterationRoots in $project.IterationRootNodes) {
            "  Root: " + $iterationRoots.Path
                foreach($iteration in $iterationRoots) {
                    "    " + $iteration.Path
                }
        }
    }
}