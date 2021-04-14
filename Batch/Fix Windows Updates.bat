net stop wuauserv
net stop BITS
net stop CryptSvc
net stop msiserver

sc config wuauserv start=auto
sc config BITS start=auto
sc config CryptSvc start=auto
sc config msiserver start=auto

ren C:\Windows\SoftwareDistribution SoftwareDistribution_old
ren C:\Windows\System32\catroot2 catroot2_old

net start wuauserv
net start BITS
net start CryptSvc
net start msiserver
