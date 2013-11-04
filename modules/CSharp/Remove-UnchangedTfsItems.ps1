function Remove-TfsUnchangedFiles($path) 
{
    Push-Location $path
        tfpt uu . /noget /recursive
    Pop-Location
}