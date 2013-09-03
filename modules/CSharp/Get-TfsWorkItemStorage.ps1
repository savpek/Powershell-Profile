Function Get-TfsWorkItemStorage([string]$serverCollectionUri) {
    $Tfs = [Microsoft.TeamFoundation.Client.TeamFoundationServerFactory]::GetServer($serverCollectionUri)

    $storage = $Tfs.GetService([Microsoft.TeamFoundation.WorkItemTracking.Client.WorkItemStore])

    return $storage
}