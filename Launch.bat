@echo off
set VERSION=Alpha0.1.1
title [启动中...]Reine Print [%VERSION%]
echo Reine Print
echo 开发：琴梨梨
echo 版本：%VERSION%
echo 正在启动...
if not exist pending mkdir pending
if not exist finished mkdir finished
if not exist error mkdir error
echo 启动接收服务...
for /d %%i in (receivers\*) do (
echo 正在启动%%i服务
start /min %%i\Service.bat
)
echo 启动打印服务...
start /min daemon.bat
echo 加载控制台...
:console
title Reine Print [%VERSION%]
cls
echo Reine Print Console
echo =============
echo [1]停止
echo [2]展示打印地址
echo =============
set /p choose=请输入数字
if %choose%==1 goto stop
if %choose%==2 goto showurl
goto console



:stop
cls
echo 正在停止...
for /d %%i in (receivers\*) do (
echo 正在停止%%i服务
start /min %%i\Stop.bat
)
taskkill /im cmd.exe /f
exit

:showurl
for /f "tokens=1-2 delims=:" %%i in ('ipconfig ^|find /i "IPv4"') do set ip=%%j
set "ip=%ip: =%"
echo setIP(^"%ip%^") >showurl/ip.js
start showurl/showurl.html
goto console