function Find-NotMatchingNamespace () 
{
    Get-ChildItem -Recurse *.csproj | Select-Xml -XPath "//ns:RootNamespace" -Namespace @{ns="http://schemas.microsoft.com/developer/msbuild/2003"} | Where { $_.Path -notlike "*" + $_.Node.'#text' + "*" } | foreach { "Project: " + $_.Path + " and name: " + $_.Node.'#text' + " Does not match!" }
}
