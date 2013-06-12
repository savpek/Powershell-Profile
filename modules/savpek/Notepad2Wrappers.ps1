Set-StrictMode -Version Latest

Function Open-Notepads {
    PROCESS {
        $command = 'Notepad2 /g "' + $_.LineNumber + ',0" "' + $_.Path + '"';
        $command;
        Invoke-Expression $command;
    }
}

Function Close-Notepads {
    Stop-Process -Name *Notepad2*;
}

Set-StrictMode -Off