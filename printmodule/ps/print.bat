@echo off
echo PostScript Print Module 1.0.0
echo Author:Qinlili
echo Preparing file: %*
cd %~dp0
if not exist acrodist.location goto find
:return
for /f "delims=" %%a in ('type acrodist.location') do set acrodist=%%a
echo Converting to PDF...
%acrodist% /N /Q /O %cd%\temp.pdf /Y %cd%\..\..\pending\%*
echo Printing file: %*
..\pdf\PDFtoPrinter.exe temp.pdf
del /f /s /q temp.pdf
exit %ERRORLEVEL%

:find

echo Finding Acrobat Distiller...
for /r "C:\Program Files (x86)\Adobe\" %%i in (acrodist.*) do set acrodist=%%i
if not defined acrodist (
echo Cannot find Acrobat Distiller, did you installed Acrobat Pro DC?
exit 404
)
echo Found %acrodist%
echo "%acrodist%" >acrodist.location
goto return