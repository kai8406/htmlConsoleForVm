@echo off
:: run commands as administrator
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit

:: output Os version
for /f "delims==" %%a in ('ver') do echo %%a

:: get the concurrent path
set currentPath=%~dp0
set certMgrPath=
if "%PROCESSOR_ARCHITECTURE%"=="x86" (
	set certMgrPath=%currentPath%certMgr\x86\CertMgr.exe
)

if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
	set certMgrPath=%currentPath%certMgr\x64\CertMgr.exe
)

echo %certMgrPath%

if exist %certMgrPath% (
echo get certMgr.exe file.
) else (
echo %certMgrPath%
	echo can't certMgr.exe file.
	pause & exit
)

:: the  path of certificate.changed according to your environment
set certPath=%currentPath%certs\win\00ec645e.0.crt

if exist %certPath% (
	echo get vcenter cert file
) else (
 echo %certPath%
	echo can't get venter cert file
pause & exit
)

set "space= "
set param1=-add -c
set param2=-s -r localMachine AuthRoot
set param3=-s -r localMachine trustedpublisher

set command1=%certMgrPath%%space%%param1%%space%%certPath%%space%%param2%
set command2=%certMgrPath%%space%%param1%%space%%certPath%%space%%param3%

echo %command1%
%command1%
set err=%errorlevel%
if "%err%"=="0" (
 echo import cert into auth success!
)else(
 echo import cert into auth fail!
)

:: perhaps no chance to run
echo %command2%
%command2%
set err=%errorlevel%
if "%err%"=="0" (
 echo import cert into trustPublisher success!
)else(
 echo import cert into trustPublisher fail!
)

pause
