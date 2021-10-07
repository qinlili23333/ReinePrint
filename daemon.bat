@echo off
setlocal enabledelayedexpansion
title Print Daemon
if not exist config\printlog.enable set log=rem
if exist config\detectonline.enable set skipdetect=rem
echo Detecing target folder...
if not exist pending mkdir pending
if not exist finished mkdir finished
if not exist error mkdir error
if not exist logs mkdir logs
cd pending
echo Daemon launch success
%log% echo %time%打印队列服务启动成功>>..\logs\print.log
:scanFiles
echo Formating file names...
for /f "delims=" %%i in ('dir /s/b *.*') do (
    set "foo=%%~nxi"
    set foo=!foo: =!
    set foo=!foo: =!
    ren "%%~fi" "!foo!"
)
FOR %%a in (*) do (
set "name=%%a"
set "name=!name:(=!"
set "name=!name:)=!"
ren "%%a" "!name!"
)

%skipdetect% goto processfile
FOR /F "tokens=2* delims==" %%A in (
  'wmic printer where "default=True" get name /value'
  ) do SET printer=%%A

FOR /F "tokens=2* delims==" %%A in (
  'wmic printer where "workoffline=True" get name /value'
  ) do SET offline=%%A
if "%printer%"=="%offline%" (
echo Printer offline, pause printing...
%log% echo %time%打印机离线，暂停打印 >>..\logs\print.log
)

:processfile
for %%i in (*) do (
echo Processing %%i
call :processFile %%i
)
echo All tasks done, sleep for 5s...
ping 127.1 >nul -n 6
goto scanFiles

:processFile
set file=%1
%log% echo %time%正在处理文件%file% >>..\logs\print.log
for /f "tokens=1-2 delims=." %%j in ("%file%") do set type=%%k
echo File type is %type%
if not exist ..\printmodule\%type%\print.bat (
echo Unsupport type %type%
echo Please install plugin to print this file
%log% echo %time%打印失败：不支持打印此格式>>..\logs\print.log
move %file% ..\error
exit /b
)
start /wait ..\printmodule\%type%\print.bat %file%
if %ERRORLEVEL%==0 (
%log% echo %time%打印成功 >>..\logs\print.log
move %file% ..\finished
echo Print %file% success
)
if not %ERRORLEVEL%==0 (
%log% echo %time%打印失败：模块返回错误%ERRORLEVEL% >>..\logs\print.log
move %file% ..\error
echo Print %file% failed
)
set ERRORLEVEL=0
exit /b