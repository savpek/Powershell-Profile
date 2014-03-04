Set-StrictMode -Version Latest

Function Open-Notepads {
    [CmdLetBinding()]
    Param(
        [Alias("FullName")]
        [parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true)]$Path
    )

    PROCESS {
        $command = 'Notepad2 /g "' + $_.LineNumber + ',0" "' + $Path + '"';
        $command;
        Invoke-Expression $command;
    }
}

Set-StrictMode -Off