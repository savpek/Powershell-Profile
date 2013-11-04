function Repair-VisualStudioStructure() 
{
    "Clearing .suo files..."
    Get-ChildItem -Recurse *.suo | Remove-Item -Force
}