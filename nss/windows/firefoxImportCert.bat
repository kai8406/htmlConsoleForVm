@echo off

:: begin to get firefox cert db path
set certdbTempPath=\Mozilla\Firefox\profiles.ini
set certdbIniPath=%appdata%%certdbTempPath%
set certdbFullPath=
if exist %certdbIniPath% (
echo get ini file of firefox, and to get cert db number
) else (
echo can't get ini file of firefox, please start firefox browzer once.
pause & exit
)

set temp=
for /f "tokens=1,2 delims==" %%i in (%certdbIniPath%) do (
if "%%i"=="Path" set temp=%%j
)

set tempX=\Mozilla\Firefox\
set temp=%temp:/=\% 
set certdbFullPath="%appdata%"%tempX%%temp%
echo %certdbFullPath%
:: end to get firefox cert db path

:: beging to construct nss command.
set exePath=\bin\certutil.exe
set curExeFile="%cd%"%exePath%

if exist %curExeFile% (
echo find the certutil.exe of nss.
) else (
echo can't find the certutil.exe of nss.
pause & exit
)

:: the path of certificate.changed according to your environment
set certPath=\certs\win\00ec645e.0.crt
set curCertPath="%cd%"%certPath%

if exist %curCertPath% (
echo get certificate of vcenter.
) else (
echo can't get certificate of vcenter.
pause & exit
)

set "space= "

set param1=-A -t "C,," -n VC192.168.20.64 -i
set param2=-d

set command=%curExeFile%%space%%param1%%space%%curCertPath%%space%%param2%%space%%certdbFullPath%
:: end to construct nss command.

:: beging to run command.
echo %command%
%command%

:: perhaps no chance to run
set err=%errorlevel%
if "%err%"=="0" (
 echo success to import cert to firefox.
)else(
 echo fail to import cert to firefox.
)

:: end to run command

pause
