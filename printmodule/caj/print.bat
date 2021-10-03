@echo on
echo CAJ Print Module 1.0.0
echo Author:Qinlili
echo Preparing file: %*
cd %~dp0
python -h >nul
if not %ERRORLEVEL%==0 exit 9009
python caj2pdf convert ..\..\pending\%* -o temp.pdf
echo Printing file: %*
..\pdf\PDFtoPrinter.exe temp.pdf
del /f /s /q temp.pdf
exit %ERRORLEVEL%