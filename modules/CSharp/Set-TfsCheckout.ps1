filter Set-TfsCheckout {
    if($_.FullName) {
        tf checkout $_.FullName | Out-Null
    }
    elseif(Test-Path $_) {
        tf checkout $_ | Out-Null
    }
    else {
        throw "Cannot locate file matching '$_'"
    }

    return $_
}