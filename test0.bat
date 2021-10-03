for /f "tokens=1-2 delims=:" %%i in ('ipconfig ^|find /i "IPv4"') do set ip=%%j
set "ip=%ip: =%"
echo ip=%ip%
pause