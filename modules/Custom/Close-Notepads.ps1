Set-StrictMode -Version Latest

Function Close-Notepads {
    Stop-Process -Name *Notepad2*;
}

Set-StrictMode -Off