@echo off
echo PPT Print Module 1.0.0
echo Author:Qinlili
echo Preparing file: %*
cd %~dp0
copy ..\..\pending\%* %cd%\temp.ppt
python -h >nul
if not %ERRORLEVEL%==0 exit 9009
echo Printing file: %*
python print.py
del /f /s /q temp.ppt
exit %ERRORLEVEL%