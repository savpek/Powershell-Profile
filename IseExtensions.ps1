$menu = $psISE.CurrentPowerShellTab.AddOnsMenu.Submenus

$menu.Add("ShowMethodCode", {
    $method = Read-Host 'Method name'
    Invoke-Expression "`${function:$method}"
}, "Ctrl+Alt+S") | out-null

$menu.Add("TfsCheckout", {
    tf checkout $psISE.CurrentFile.FullPath
}, $null) | out-null

$Script:DebugOnErrorToggle = $false
$Script:ToggleDebugging = {
    if($Script:DebugOnErrorToggle) {
        Write-Host "Debug on error disabled" -ForegroundColor Yellow
        $Script:DebugOnErrorToggle = $false
        Set-DebugOnError -Off
    }
    else {
        Write-Host "Debug on error enabled" -ForegroundColor green
        $Script:DebugOnErrorToggle = $true
        Set-DebugOnError
    }
}

function Set-DebugOnError {
    param(
	    [Parameter()]
	    [string[]]$Script,
	    [scriptblock]$Action,
	    [switch]$Off
    )

    Get-PSBreakpoint -Variable StackTrace | Remove-PSBreakpoint

    if (!$Off) {
	    if ($Script) {
		    $null = Set-PSBreakpoint -Variable StackTrace -Mode Write -Action $Action -Script $Script
	    }
	    else {
		    $null = Set-PSBreakpoint -Variable StackTrace -Mode Write -Action $Action
	    }
    }
}

$menu.Add("ToggleDebugError", {
    . $ToggleDebugging
}, "Ctrl+Alt+E") | out-null