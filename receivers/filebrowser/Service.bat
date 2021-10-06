@echo off
cd %~dp0
title [Launching]filebrowserService
if not exist receive mkdir receive
echo Detecting filebrowser running status...
tasklist|find /i "filebrowser.exe" ||goto launchService
goto killService
:launchService
echo Launching...
start /min filebrowser 
goto detectLaunch



exit /B

:killService
echo filebrowser is running, kill now...
taskkill /im filebrowser.exe /F
tasklist|find /i "filebrowser.exe" ||goto launchService
goto killService

:detectLaunch
curl http://localhost:8080/ >nul
if %ERRORLEVEL%==0 goto launchSuccess
goto detectLaunch


:launchSuccess
title [Running]filebrowserService
echo filebrowser launch success...
goto watchdog

:watchdog
echo Start Daemon Service...
echo Check filebrowser alive every minute...
echo Check new files every minute...
:check
for %%i in (receive\*) do (
move %%i ..\..\pending >nul
)
curl http://localhost:8080/ >nul
if not %ERRORLEVEL%==0 goto filebrowserError
echo %time% filebrowser alive!
ping 127.1 >nul -n 61
goto check


:filebrowserError
title [Rebooting]filebrowserService
echo Seems that filebrowser has died
echo Detecting filebrowser running status...
tasklist|find /i "filebrowser.exe" ||goto launchService
goto killService



