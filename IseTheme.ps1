function Export-CurrentTheme {
    foreach($color in $psISE.Options.TokenColors) {
        "`$psISE.Options.TokenColors['$($color.key)'] = '$($color.value)'"
        "`$psISE.Options.ConsoleTokenColors['$($color.key)'] = '$($color.value)'"
    }

    foreach($property in ($psIse.Options.psobject.Properties | where { ($_.Name -like "*color*") -and ($_.Name -notlike "*token*")})) {
        "`$psISE.Options.$($property.Name) = " + "'$($psISE.Options."$($property.Name)".ToString())'"
    }
}

$psISE.Options.SelectedScriptPaneState = "Maximized"
$psISE.Options.ShowDefaultSnippets = $false
$psISE.Options.ShowToolBar = $false
$psISE.Options.ShowOutlining = $true
$psISE.Options.ShowLineNumbers = $true
$psISE.Options.FontSize = 10
$psISE.Options.Zoom = 100
$psISE.Options.FontName = "Lucida Console"
$psISE.Options.ShowWarningForDuplicateFiles = $true
$psISE.Options.ShowWarningBeforeSavingOnRun = $false
$psISE.Options.UseLocalHelp = $true
$psISE.Options.AutoSaveMinuteInterval = 2
$psISE.Options.MruCount = 10
$psISE.Options.ShowIntellisenseInConsolePane = $true
$psISE.Options.ShowIntellisenseInScriptPane = $true
$psISE.Options.UseEnterToSelectInConsolePaneIntellisense = $true
$psISE.Options.UseEnterToSelectInScriptPaneIntellisense = $true
$psISE.Options.IntellisenseTimeoutInSeconds = 3

$psISE.Options.TokenColors['Attribute'] = '#FFFFFFFF'
$psISE.Options.ConsoleTokenColors['Attribute'] = '#FFFFFFFF'
$psISE.Options.TokenColors['Command'] = '#FF9CD8F0'
$psISE.Options.ConsoleTokenColors['Command'] = '#FF9CD8F0'
$psISE.Options.TokenColors['CommandArgument'] = '#FFAE81FF'
$psISE.Options.ConsoleTokenColors['CommandArgument'] = '#FFAE81FF'
$psISE.Options.TokenColors['CommandParameter'] = '#FFA6E22E'
$psISE.Options.ConsoleTokenColors['CommandParameter'] = '#FFA6E22E'
$psISE.Options.TokenColors['Comment'] = '#FF6E715E'
$psISE.Options.ConsoleTokenColors['Comment'] = '#FF6E715E'
$psISE.Options.TokenColors['GroupEnd'] = '#FFFFFFFF'
$psISE.Options.ConsoleTokenColors['GroupEnd'] = '#FFFFFFFF'
$psISE.Options.TokenColors['GroupStart'] = '#FFFFFFFF'
$psISE.Options.ConsoleTokenColors['GroupStart'] = '#FFFFFFFF'
$psISE.Options.TokenColors['Keyword'] = '#FFF92659'
$psISE.Options.ConsoleTokenColors['Keyword'] = '#FFF92659'
$psISE.Options.TokenColors['LineContinuation'] = '#FFFFFFFF'
$psISE.Options.ConsoleTokenColors['LineContinuation'] = '#FFFFFFFF'
$psISE.Options.TokenColors['LoopLabel'] = '#FFAE81FF'
$psISE.Options.ConsoleTokenColors['LoopLabel'] = '#FFAE81FF'
$psISE.Options.TokenColors['Member'] = '#FFFD971F'
$psISE.Options.ConsoleTokenColors['Member'] = '#FFFD971F'
$psISE.Options.TokenColors['NewLine'] = '#FF000000'
$psISE.Options.ConsoleTokenColors['NewLine'] = '#FF000000'
$psISE.Options.TokenColors['Number'] = '#FFAE81FF'
$psISE.Options.ConsoleTokenColors['Number'] = '#FFAE81FF'
$psISE.Options.TokenColors['Operator'] = '#FFFFFFFF'
$psISE.Options.ConsoleTokenColors['Operator'] = '#FFFFFFFF'
$psISE.Options.TokenColors['Position'] = '#FF000000'
$psISE.Options.ConsoleTokenColors['Position'] = '#FF000000'
$psISE.Options.TokenColors['StatementSeparator'] = '#FFFD971F'
$psISE.Options.ConsoleTokenColors['StatementSeparator'] = '#FFFD971F'
$psISE.Options.TokenColors['String'] = '#FFE6DB74'
$psISE.Options.ConsoleTokenColors['String'] = '#FFE6DB74'
$psISE.Options.TokenColors['Type'] = '#FFFD971F'
$psISE.Options.ConsoleTokenColors['Type'] = '#FFFD971F'
$psISE.Options.TokenColors['Unknown'] = '#FF000000'
$psISE.Options.ConsoleTokenColors['Unknown'] = '#FF000000'
$psISE.Options.TokenColors['Variable'] = '#FFA8FF00'
$psISE.Options.ConsoleTokenColors['Variable'] = '#FFA8FF00'
$psISE.Options.ErrorForegroundColor = '#FFFF0000'
$psISE.Options.ErrorBackgroundColor = '#00FFFFFF'
$psISE.Options.WarningForegroundColor = '#FFFF8C00'
$psISE.Options.WarningBackgroundColor = '#FF272822'
$psISE.Options.VerboseForegroundColor = '#FF00FFFF'
$psISE.Options.VerboseBackgroundColor = '#FF272822'
$psISE.Options.DebugForegroundColor = '#FF00FFFF'
$psISE.Options.DebugBackgroundColor = '#00FFFFFF'
$psISE.Options.ConsolePaneBackgroundColor = '#FF272822'
$psISE.Options.ConsolePaneTextBackgroundColor = '#FF272822'
$psISE.Options.ConsolePaneForegroundColor = '#FFF5F5F5'
$psISE.Options.ScriptPaneBackgroundColor = '#FF272822'
$psISE.Options.ScriptPaneForegroundColor = '#FFF8F8F2'