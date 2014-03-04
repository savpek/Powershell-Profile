function Get-GitHubRepository {
    param(
    [Parameter(ValueFromPipeline=$true, Mandatory=$true)]$uri
    );

    process {
        Invoke-Expression "git clone $uri"
    }
}