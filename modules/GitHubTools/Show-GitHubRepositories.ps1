function Show-GitHubRepositories {
    $response = Invoke-WebRequest -Uri "https://api.github.com/users/savpek/repos" -Method Get

    if($response.StatusCode -ne "200") {
        throw "Invalid response code."
    }

    $uris = $response.Content | ConvertFrom-Json | foreach { $_.html_url }

    return $uris
}

