@echo off
set VERSION=Alpha0.1.5
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
if exist %%i\Service.bat (
echo 正在启动%%i服务
start /min %%i\Service.bat
)
)
echo 启动打印服务...
start /min daemon.bat
echo 加载控制台...
:console
title Reine Print [%VERSION%]
cls
set choose=0
echo Reine Print Console
echo =============
echo [1]停止
echo [2]展示打印地址
echo [3]打印队列管理
echo =============
set /p choose=请输入数字
if %choose%==1 goto stop
if %choose%==2 goto showurl
if %choose%==3 goto printlist
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

:printlist
cls
set choose=0
echo Reine Print Console -^> List
echo =============
echo [1]查看待打印文件
echo [2]查看已打印文件
echo [3]查看打印失败文件
echo [4]清理已打印文件
echo [5]归档已打印文件
echo [6]返回
echo =============
set /p choose=请输入数字
if %choose%==1 start pending\
if %choose%==2 start finished\
if %choose%==3 start error\
if %choose%==4 rd /s /q finished & mkdir finished
if %choose%==5 start plugins\archive\archive.bat
if %choose%==6 goto console
goto printlist