Set-StrictMode -Version Latest

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

Function Get-ToNotepad {
    Param(
	    [Parameter(Mandatory=$True, position=1)]
	    [string]$FilePattern,
	     
	    [Parameter(Mandatory=$True, position=2)]
	    [string]$Match
    )

    $files = dir $FilePattern -Recurse | Select-String "$Match";
    $uniqueFiles = $files | Select-Object -Unique Path;

    "All matches:";
    foreach($file in $files) {
        $file;
    }

    $opened = 0;
    foreach($file in $uniqueFiles)
    {
        if($opened -eq 20) { 
            Write-Error "Limit is 20 open notepads by single command.";
            return;    
        }
        
        $command = 'Notepad2 /m "=" "' + $file.Path + '"';
        Invoke-Expression $command;
        
        $opened += 1;
    }
}

Function Stop-AllNotepads {
    Stop-Process -Name *Notepad2*;
}

Set-StrictMode -Off