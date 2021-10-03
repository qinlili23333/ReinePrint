@echo on
echo PDF Print Module 1.0.0
echo Author:Qinlili
echo Preparing file: %*
cd %~dp0
echo Printing file: %*
PDFtoPrinter.exe ..\..\pending\%*
exit %ERRORLEVEL%