Set-StrictMode -Version Latest

Function Open-Notepads {
    PROCESS {
        if($_.Path -ne "") 
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

Set-StrictMode -Off