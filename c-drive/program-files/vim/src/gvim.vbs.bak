Dim oShell
Dim oUserEnv
Dim oParam
Dim oRegex
Dim sFile
Dim sPath
Dim sCmd

Set oShell = WScript.CreateObject("WSCript.shell")
Set oUserEnv = oShell.Environment("User")
Set oParam = WScript.Arguments
Set oRegex = new RegExp

'oUserEnv.Item("WD") = "C:\git-sdk-64\usr\bin\"
'oUserEnv.Item("MSYS2_PATH_TYPE") = "inherit"
'oUserEnv.Item("MSYSTEM") = "MINGW64"
'oUserEnv.Item("CHERE_INVOKING") = "enabled_from_arguments"

if oParam.Count < 1 then
    oShell.CurrentDirectory = oShell.ExpandEnvironmentStrings("%USERPROFILE%\Desktop")
else
    oRegex.Global = True

    oRegex.Pattern = "\\[^\\]*$"
    sPath = oRegex.Replace(oParam(0), "\")
    oShell.CurrentDirectory = sPath

    oRegex.Pattern = "[\\:""]+"
    sFile = "/" & oRegex.Replace(oParam(0), "/")

    oRegex.Pattern = "[^\x01-\x7f]"
    if oRegex.Test(sFile) then
        sFile = oRegex.Replace(sFile, "?")
    end if

    oRegex.Pattern = " "
    sFile = oRegex.Replace(sFile, "?")
end if

'sCmd = "C:\git-sdk-64\mingw64.exe /usr/bin/vim"
sCmd = "C:\git-sdk-64\usr\bin\mintty.exe --icon /gvim.ico /bin/bash --login"
oShell.run sCmd & " -c ""/usr/bin/vim " & sFile & """"

Set sCmd     = Nothing
Set sPath    = Nothing
Set sFile    = Nothing
Set oRegex   = Nothing
Set oParam   = Nothing
Set oUserEnv = Nothing
Set oShell   = Nothing
