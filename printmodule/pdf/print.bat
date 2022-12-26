@echo on
echo PDF Print Module 1.1.0
echo Author:Qinlili
echo Preparing file: %*
cd %~dp0
set /p backend=< ..\..\config\pdf-backend
if %backend%==Acrobat goto Acroprint
echo Printing file: %*
PDFtoPrinter.exe ..\..\pending\%*
exit %ERRORLEVEL%


:Acroprint
echo Enable Acrobat Print.
if not exist acrobat.location goto find
:return
for /f "delims=" %%a in ('type acrobat.location') do set acrobat=%%a
echo Printing file: %*
%acrobat% /n /t ..\..\pending\%*
exit %ERRORLEVEL%

:find

echo Finding Acrobat...
if exist "C:\Program Files (x86)\Adobe\Acrobat DC\Acrobat\Acrobat.exe" set acrobat="C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe"
if exist "C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe" set acrobat="C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe"
if not defined acrobat (
echo Cannot find Acrobat Distiller, did you installed Acrobat Pro DC?
exit 404
)
echo Found %acrobat%
echo %acrobat% >acrobat.location
goto return