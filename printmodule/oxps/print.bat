@echo off
echo OXPS Print Module 1.0.0
echo Author:Qinlili
echo Preparing file: %*
cd %~dp0
XpsConverter ..\..\pending\%*
FOR /F "tokens=2* delims==" %%A in (
  'wmic printer where "default=True" get name /value'
  ) do SET printer=%%A
echo Printing file: %*
for %%i in (*.xps) do (
..\xps\PrintXPS.exe "%printer%" %%i
)
del /f /s /q *.xps
exit %ERRORLEVEL%