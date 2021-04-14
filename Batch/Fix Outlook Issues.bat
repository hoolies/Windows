cd %UserProfile%\AppData\Local\Microsoft\Outlook
attrib -r -s -h %UserProfile%\AppData\Local\Microsoft\Outlook\*.*
attrib +r +h %UserProfile%\AppData\Local\Microsoft\Outlook\*.ost
del %UserProfile%\AppData\Local\Microsoft\Outlook\*.* /Q
attrib -r -h %UserProfile%\AppData\Local\Microsoft\Outlook\*.ost
attrib -r -h -s %UserProfile%\AppData\Local\Microsoft\Outlook\16
attrib -r -h -s %UserProfile%\AppData\Local\Microsoft\Outlook\16\*.*
FOR /D %%p IN ("%UserProfile%\AppData\Local\Microsoft\Outlook\*.*") DO rmdir "%%p" /s /q
