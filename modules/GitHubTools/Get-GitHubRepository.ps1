function Get-GitHubRepository {
    [CmdLetBinding()]
    Param($Like = "")
    $response = Invoke-WebRequest -Uri "https://api.github.com/users/savpek/repos?per_page=100" -Method Get

    if($response.StatusCode -ne "200") {
        throw "Invalid response code."
    }

    $uris = $response.Content | ConvertFrom-Json | foreach { $_.html_url } | where { $_ -like "*$Like*" }

    return $uris
}

