@echo off
netsh wlan show profiles > wpa && find ": " wpa > wk && del wpa && ren wk wpa && tail -n +3 wpa > wps && del wpa && ren wps wpa
echo > t
SETLOCAL ENABLEDELAYEDEXPANSION
for /F "tokens=*" %%i in (wpa) do ( set z=%%i && echo !z:~23,200! >> t)
echo SSID,PWD > xifi.csv
tail -n +2 t > wpa && echo > t
for /F "tokens=*" %%A in (wpa) do ( set line=%%A && echo !line:~0,-3!>> t)
tail -n +2 t > wpa && echo > t && type wpa > ssid
for /F "tokens=*" %%i in (wpa) do ( set z=%%i  && echo !z: =*! >> t)
tail -n +2 t > wpa && echo > t
for /F "tokens=*" %%A in (wpa) do ( set line=%%A && echo !line:~0,-4!>> t)
tail -n +2 t > wpa && echo > t
for /F "tokens=*" %%i in (wpa) do ( set z=%%i && netsh wlan show profile !z! key=clear >> t)
find "Key Content" t > tk && del t && ren tk t && tail -n +3 t > tk && del t && ren tk t && echo > tk
for /F "tokens=*" %%i in (t) do ( set z=%%i && echo !z:~25,200! >> tk)
tail -n +2 tk > t && del tk 
for /F "tokens=*" %%A in (t) do ( set line=%%A && echo !line:~0,-3!>> pwd)
del wpa && del t
for /F "delims=" %%a in (ssid) do ( set /A count1+=1 && set "ssid[!count1!]=%%a" )
for /F "delims=" %%a in (pwd) do ( set /A count2+=1 && set "pwd[!count2!]=%%a" )
for /L %%i in (1,1,%count1%) do echo !ssid[%%i]!,!pwd[%%i]! >> xifi.csv
del pwd && del ssid
ENDLOCAL



