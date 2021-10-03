@echo off
cd %~dp0
title [Launching]qrcpService
if not exist receive mkdir receive
echo Detecting qrcp running status...
tasklist|find /i "qrcp.exe" ||goto launchService
goto killService
:launchService
echo Launching...
start /min qrcp receive -c config.json
goto detectLaunch



exit /B

:killService
echo qrcp is running, kill now...
taskkill /im qrcp.exe /F
tasklist|find /i "qrcp.exe" ||goto launchService
goto killService

:detectLaunch
curl http://localhost:9980/receive/printer >nul
if %ERRORLEVEL%==0 goto launchSuccess
goto detectLaunch


:launchSuccess
title [Running]qrcpService
echo qrcp launch success...
goto watchdog

:watchdog
echo Start Daemon Service...
echo Check qrcp alive every minute...
echo Check new files every minute...
:check
for %%i in (receive\*) do (
move %%i ..\..\pending >nul
)
curl http://localhost:9980/receive/printer >nul
if not %ERRORLEVEL%==0 goto qrcpError
echo %time% qrcp alive!
ping 127.1 >nul -n 61
goto check


:qrcpError
title [Rebooting]qrcpService
echo Seems that qrcp has died
echo Detecting qrcp running status...
tasklist|find /i "qrcp.exe" ||goto launchService
goto killService



