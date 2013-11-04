function Update-TfsTaskSprint(
        [Parameter(Mandatory=$true)][string] $TfsServerCollectionUri, 
        [Parameter(Mandatory=$true)][string] $NewSprintPath,
        [Parameter(Mandatory=$true)][string] $Project,
        [switch]$WhatIf) {
    $storage = Get-TfsWorkItemStorage $tfsServerCollectionUri

    $results = $storage.Query("select * from Issue where 
                                        [Work Item Type] contains 'Task'                                      
                                    and [State] <> 'Done' 
                                    and [State] <> 'Removed'    
                                    and [Team Project] = '$Project'")

    $results = $results | where { $_.IterationPath -like "*\*" }

    foreach($workItem in $results) {
        "Updating '$($workItem.Title)' from '$($workItem.IterationPath)' to sprint '$($newSprintPath)', current state: '$($workitem.State)'"

        if($WhatIf) {
            Write-Host -ForegroundColor Yellow "No changes made because WhatIf flag."
        }
        else {
            $workItem.Open();
            $workItem.IterationPath = $newSprintPath
            $workItem.Save()
        }
    }
}
