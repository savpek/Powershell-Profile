# Use this file to run your own startup commands

## Prompt Customization
<#
.SYNTAX
    <PrePrompt><CMDER DEFAULT>
    λ <PostPrompt> <repl input>
.EXAMPLE
    <PrePrompt>N:\Documents\src\cmder [master]
    λ <PostPrompt> |
#>

[ScriptBlock]$PrePrompt = {

}

# Replace the cmder prompt entirely with this.
# [ScriptBlock]$CmderPrompt = {}

[ScriptBlock]$PostPrompt = {

}

## <Continue to add your own>

$env:PSModulePath += ";$PsScriptRoot\..\..\modules\"
Import-Module Custom

git config --global user.email "savolainen.pekka@gmail.com"
git config --global user.name "Savpek"
git config --global core.autocrlf true

git config --global core.editor "code --wait"

git config --global mergetool.keepBackup false

$env:GIT_EDITOR = "notepad"

$HistoryFilePath = Join-Path ([Environment]::GetFolderPath('UserProfile')) .ps_history
Register-EngineEvent PowerShell.Exiting -Action { 
    Get-History |
        Where { $_.ToString() -notlike "ls*" } |
        Where { $_.ToString() -notlike "cd*" } |
        Export-Clixml $HistoryFilePath
} | out-null

if (Test-path $HistoryFilePath) { 
    Import-Clixml $HistoryFilePath | Add-History 
}

if(Test-Path C:\github) {
    Push-Location C:\github
}