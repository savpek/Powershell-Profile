﻿if (Get-Module New-Shell) { return }
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