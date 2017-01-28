Dim oShell
'Dim oUserEnv
Dim oParam

Set oShell   = WScript.CreateObject ("WSCript.shell")
'Set oUserEnv = oShell.Environment("User")
Set oParam   = WScript.Arguments

'oUserEnv.Item("WD") = "C:\git-sdk-64\usr\bin\"
'oUserEnv.Item("MSYS2_PATH_TYPE") = "inherit"
'oUserEnv.Item("MSYSTEM") = "MINGW64"
'oUserEnv.Item("CHERE_INVOKING") = "enabled_from_arguments"

if oParam.Count > 0 then
    oShell.CurrentDirectory = oParam(0)
    oShell.run "C:\git-sdk-64\usr\bin\mintty.exe --icon /mingw64.ico /bin/bash --login"
else
    oShell.CurrentDirectory = oShell.ExpandEnvironmentStrings("%USERPROFILE%\Desktop")
    'oShell.run "C:\git-sdk-64\usr\bin\mintty.exe --icon /mingw64.ico /bin/bash --login -c ""if test -e /usr/bin/tmux; then /usr/bin/tmux; exit; else /bin/bash; fi"""
    oShell.run "C:\git-sdk-64\usr\bin\mintty.exe --icon /mingw64.ico /bin/bash --login -c ""if test -e /mingw64/bin/byobu; then /mingw64/bin/byobu; exit; else /bin/bash; fi"""
end if

Set oParam   = Nothing
'Set oUserEnv = Nothing
Set oShell   = Nothing
