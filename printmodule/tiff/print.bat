@echo on
echo Image Print Module 1.0.0
echo Author:Qinlili
echo Preparing file: %*
FOR /F "tokens=2* delims==" %%A in (
  'wmic printer where "default=True" get name /value'
  ) do SET printer=%%A
echo Printing file: %*
rundll32 shimgvw.dll ImageView_PrintTo /pt %cd%\%* "%printer%"
exit %ERRORLEVEL%