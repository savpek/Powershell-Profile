function Start-Watch {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [string]
        $Glob,

        [Parameter()]
        [string]
        $Path = ((Resolve-Path .\).Path)
    )

    $fsw = New-Object IO.FileSystemWatcher "$($Path)", "$($Glob)" -Property @{IncludeSubdirectories = $false;NotifyFilter = [IO.NotifyFilters]'FileName, LastWrite'}

    $global:watch_output = @()

    try {
        Register-ObjectEvent $fsw Changed -SourceIdentifier FileChanged -Action {
            Write-Debug "The file '$($Event.SourceEventArgs.FullPath)' updated."
            $global:watch_output += $Event.SourceEventArgs.FullPath
        } | Out-Null
 
        while($true)
        {
            $global:watch_output | Get-Unique | Write-Output
            $global:watch_output = @()
            Start-Sleep -seconds 1
        }
    }
    finally {
        Unregister-Event FileChanged
    }
}