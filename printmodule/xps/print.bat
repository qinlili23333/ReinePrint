@echo off
echo XPS Print Module 1.0.0
echo Author:Qinlili
echo Preparing file: %*
cd %~dp0
FOR /F "tokens=2* delims==" %%A in (
  'wmic printer where "default=True" get name /value'
  ) do SET printer=%%A
echo Printing file: %*
..\xps\PrintXPS.exe "%printer%" ..\..\pending\%*
exit %ERRORLEVEL%