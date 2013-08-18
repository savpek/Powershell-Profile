function Out-Diff {
<#
.Synopsis
    Redirects a Universal DIFF encoded text from the pipeline to the host using colors to highlight the differences.
.Description
    Helper function to highlight the differences in a Universal DIFF text using color coding.
.Parameter InputObject
    The text to display as Universal DIFF.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [PSObject]$InputObject
)
    Process {
        $contentLine = $InputObject | Out-String
        if ($contentLine -match "^Index:") {
            Write-Host $contentLine -ForegroundColor Cyan -NoNewline
        } elseif ($contentLine -match "^(\+|\-|\=){3}") {
            Write-Host $contentLine -ForegroundColor Gray -NoNewline
        } elseif ($contentLine -match "^\@{2}") {
            Write-Host $contentLine -ForegroundColor Gray -NoNewline
        } elseif ($contentLine -match "^\+") {
            Write-Host $contentLine -ForegroundColor Green -NoNewline
        } elseif ($contentLine -match "^\-") {
            Write-Host $contentLine -ForegroundColor Red -NoNewline
        } else {
            Write-Host $contentLine -NoNewline
        }
    }
}

# Script to invoke new shell. This is used to bybass ISE limitation to use interactive shell.
# This is needed for eg. many git commands (like push).
Function New-Shell 
{
    Param(
	       [Parameter(Mandatory=$True,Position=1)]
	       [string]$command,
	     
	       [Parameter(Mandatory=$False,Position=2)]
	       [string]$command2,
	
	       [Parameter(Mandatory=$False,Position=3)]
	       [string]$command3
    )
    start-process powershell.exe -argument "-nologo -noprofile -executionpolicy bypass -command $command $command2 $command3; read-host 'Exit'"	
}