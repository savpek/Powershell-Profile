function Open-PsEdit {
    Param(
        [Alias("FullName","Path")]
        [Parameter(Mandatory,ValueFromPipelineByPropertyName)]$InputFilePath
    ) 

    process { 
        psedit $InputFilePath
    }
}