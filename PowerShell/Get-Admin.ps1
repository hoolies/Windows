$adminGroupName = 'ADMIN-HelpDesk'
$admingroup = [ADSI]"WinNT://localhost/Administrators,group"
$admingroup.add("WinNT://ANT/$adminGroupName")
$remoteusers = [ADSI]"WinNT://localhost/Remote Desktop Users,group"
$remoteusers.add("WinNT://ANT/$adminGroupName")
