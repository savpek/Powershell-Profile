function SanitizeForRegex([string] $pattern) {
    return $pattern -replace "-", "\-" -replace "}","\}" -replace '"','\"'
}
