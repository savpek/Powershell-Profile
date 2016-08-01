Set-StrictMode -Version Latest

Function Open-Notepads {
    [CmdLetBinding()]
    Param(
        [Alias("FullName")]
        [parameter(Mandatory,ValueFromPipelineByPropertyName=$true)]$Path,
        [parameter(ValueFromPipelineByPropertyName)]$Pattern
    )

    Begin {
        $opened = @()
    }

    PROCESS {
        if($opened -contains $Path) {            return
        }

        if((Get-Item $Path) -is [System.IO.DirectoryInfo]) {
            return
        }

        if($Pattern) {
            notepad /m "$pattern" "$Path"
        }
        else {
            notepad "$path"
        }
        $opened += $Path
    }
}

Set-StrictMode -Off