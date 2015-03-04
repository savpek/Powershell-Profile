# Script to invoke new shell. This is used to bybass ISE limitation to use interactive shell.
# This is needed for eg. many git commands (like git push).
Function Invoke-Interactive {
    Param(
	       [Parameter(Mandatory,Position=1)]
	       [string]$command,
	     
	       [Parameter(Position=2)]
	       [string]$command2,
	
	       [Parameter(Position=3)]
	       [string]$command3,

	       [Parameter(Position=4)]
	       [string]$command4
    )
    start-process powershell.exe -argument "-nologo -noprofile -executionpolicy bypass -command $command $command2 $command3 $command4; read-host 'Exit'"	
}