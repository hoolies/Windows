$query_s = query session | Out-String -Stream
$results = $query_s | Select-String -Pattern 'Console', 'services', 'rdp-tcp', 'ID' -NotMatch
$sessionIDs = $results -replace '\D+'

foreach ($sessionID in $sessionIDs){
    logoff $sessionID
}
