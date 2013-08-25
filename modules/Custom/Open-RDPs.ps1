Function Open-RDPs {
    param(
        [Parameter(Mandatory=$true)][string[]]$Servers,
        [switch]$Console,
        [switch]$Admin,
        [switch]$Fullscreen
    )

    if ($admin) {
        $arguments += "/admin "
    } elseif ($console) {
        $arguments += "/console "
    }
    if ($fullscreen) {
        $arguments += "/f "
    }

    foreach($server in $servers) {
        Invoke-Expression "mstsc.exe /v:$server /w:1280 /h:960 $arguments"
    }
}