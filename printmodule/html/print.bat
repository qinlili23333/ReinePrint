@echo off
echo HTML Print Module 1.0.0
echo Author:Qinlili
echo Preparing file: %*
cd %~dp0
wkhtmltopdf.exe ..\..\pending\%* temp.pdf
echo Printing file: %*
..\pdf\PDFtoPrinter.exe temp.pdf
del /f /s /q temp.pdf
exit %ERRORLEVEL%