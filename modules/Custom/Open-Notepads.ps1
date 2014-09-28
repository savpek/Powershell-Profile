Set-StrictMode -Version Latest

Function Open-Notepads {
    [CmdLetBinding()]
    Param(
        [Alias("FullName")]
        [parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true)]$Path,
        [parameter(ValueFromPipelineByPropertyName=$true)]$Pattern
    )

    Begin {
        $opened = @()
    }

    PROCESS {
        if($opened -contains $Path) {            return
        }
        $command = "Notepad /m '$pattern' '$Path'";
        $command;
        Invoke-Expression $command;
        $opened += $Path
    }
}

Set-StrictMode -Off