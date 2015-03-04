function Copy-GitHubRepository {
    param(
    [Parameter(ValueFromPipeline, Mandatory)]$uri
    );

    process {
        Invoke-Expression "git clone $uri"
    }
}