function Start-VM {
    [CmdLetBinding()]
    Param(
        [Parameter(Mandatory=$true)][string]$Name
    )

    VBoxManage setextradata global GUI/MaxGuestResolution any
    VBoxManage startvm "$Name"
    VBoxManage controlvm "$Name" setvideomodehint 1919 1199 32 0
    VBoxManage controlvm "$Name" setvideomodehint 1919 1079 32 1
}