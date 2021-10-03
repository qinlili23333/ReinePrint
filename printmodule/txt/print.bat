@echo on
echo TXT Print Module 1.0.0
echo Author:Qinlili
echo Preparing file: %*
echo Printing file: %*
notepad /p "%*"
exit %ERRORLEVEL%
