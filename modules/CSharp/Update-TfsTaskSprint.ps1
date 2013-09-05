function Update-TfsTaskSprint(
        [Parameter(Mandatory=$true)][string] $tfsServerCollectionUri, 
        [Parameter(Mandatory=$true)][string] $newSprintPath, 
        [switch]$WhatIf) {
    $storage = Get-TfsWorkItemStorage "https://savpektfs.visualstudio.com/DefaultCollection/"

    $results = $storage.Query("select * from Issue where [Work Item Type] contains 'Task' and [State] <> 'Done'")

    foreach($workItem in $results) {
        "Updating '" + $workItem.Title + "' to sprint '" + $newSprintPath + "'"

        if($WhatIf) {
            "No changes made because WhatIf flag."
        }
        else {
            $workItem.Open();
            $workItem.IterationPath = $newSprintPath
            $workItem.Save()
        }
    }
}
