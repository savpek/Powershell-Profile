Set-StrictMode -Version Latest

Function Open-Notepads {
    PROCESS {
        if($_.Path -eq "") 
        {
            $filePath = $_.Path;
        }
        else {
            $filePath = $_.FullName;
        }

        $command = 'Notepad2 /g "' + $_.LineNumber + ',0" "' + $filePath + '"';
        $command;
        Invoke-Expression $command;
    }
}

Function Close-Notepads {
    Stop-Process -Name *Notepad2*;
}

Set-StrictMode -Off