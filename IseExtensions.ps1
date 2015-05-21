$menu = $psISE.CurrentPowerShellTab.AddOnsMenu.Submenus

$menu.Add("ShowMethodCode", {
    $method = Read-Host 'Method name'
    Invoke-Expression "`${function:$method}"
}, "Ctrl+Alt+S") | out-null

$menu.Add("TfsCheckout", {
    tf checkout $psISE.CurrentFile.FullPath
}, "Ctrl+Alt+T") | out-null
