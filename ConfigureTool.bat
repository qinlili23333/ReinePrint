@echo off
@setlocal enableextensions enabledelayedexpansion
title Reine Print 配置工具
:mainmenu
cls
set choose=0
echo 本工具可以对功能进行配置
echo 请确保设置前已经停止运行
echo =============
echo [1]接收服务管理
echo [2]格式支持管理
echo [3]打印日志管理
echo [4]打印机检测开关
echo =============
set /p choose=请输入数字
if %choose%==1 goto receivers
if %choose%==2 goto format
if %choose%==3 goto log
if %choose%==4 goto printerdetect
goto mainmenu




:receivers
cls
set choose=0
echo 接收服务管理
echo =============
echo [1]启用一个接收服务
echo [2]停用一个接收服务
echo [3]查询服务列表
echo [4]返回
echo =============
set /p choose=请输入数字
if %choose%==1 goto receiveron
if %choose%==2 goto receiveroff
if %choose%==3 goto receiverlist
if %choose%==4 goto mainmenu
goto receivers

:receiveron
set name=
cls
set /p name=输入需要启用的服务名
if not exist receivers\%name%\Service.disable goto noreceiver
rename receivers\%name%\Service.disable Service.bat
echo 已启用%name%
ping 127.1 >nul -n 3
goto receivers

:receiveroff
set name=
cls
set /p name=输入需要停用的服务名
if not exist receivers\%name%\Service.bat goto noreceiver
rename receivers\%name%\Service.bat Service.disable
echo 已停用%name%
ping 127.1 >nul -n 3
goto receivers

:noreceiver
echo 该服务不存在或当前状态无法进行该操作
ping 127.1 >nul -n 3
goto receivers

:receiverlist
cls
for /d %%i in (receivers\*) do (
if exist %%i\Service.bat (
echo %%i处于启用状态
)
if exist %%i\Service.disable (
echo %%i处于停用状态
)
)
echo 按任意键返回
pause >nul
goto receivers


:format
cls
set choose=0
echo 格式支持管理
echo =============
echo [1]启用一个格式
echo [2]停用一个格式
echo [3]查询格式列表
echo [4]切换格式后端引擎
echo [5]返回
echo =============
set /p choose=请输入数字
if %choose%==1 goto formaton
if %choose%==2 goto formatoff
if %choose%==3 goto formatlist
if %choose%==4 goto formatengine
if %choose%==5 goto mainmenu
goto format

:formaton
set name=
cls
set /p name=输入需要启用的格式
if not exist printmodule\%name%\print.bat_disable goto formaterror
rename printmodule\%name%\print.bat_disable print.bat
echo 已启用%name%
ping 127.1 >nul -n 3
goto format

:formatoff
set name=
cls
set /p name=输入需要禁用的格式
if not exist printmodule\%name%\print.bat goto formaterror
rename printmodule\%name%\print.bat print.bat_disable
echo 已禁用%name%
ping 127.1 >nul -n 3
goto format



:formatlist
cls
for /d %%i in (printmodule\*) do (
if exist %%i\print.bat (
echo %%i处于启用状态
)
if exist %%i\print.bat_disable (
echo %%i处于停用状态
)
)
echo 按任意键返回
pause >nul
goto format


:formatengine
cls
set /p name=输入需要配置的格式
if not exist printmodule\%name%\config.bat goto formaterror
call printmodule\%name%\config.bat
cls
goto format

:formaterror
echo 该格式不存在或该操作当前不被该格式支持
ping 127.1 >nul -n 3
goto format


:log
cls
set choose=0
echo 打印日志管理
echo =============
if exist config\printlog.enable (
echo [1]禁用打印日志)else (
echo [1]启用打印日志)
echo [2]查看打印日志
echo [3]返回
echo =============
set /p choose=请输入数字
if %choose%==1 goto switchlog
if %choose%==2 if exist logs\print.log (start logs\print.log)else (cls&echo 打印日志不存在&ping 127.1 >nul -n 2&goto log)
if %choose%==3 goto mainmenu
goto log

:switchlog
cls
if exist config\printlog.enable (
rename config\printlog.enable printlog.disable
echo 已禁用打印日志)else (
rename config\printlog.disable printlog.enable
echo 已启用打印日志)
ping 127.1 >nul -n 2
goto log

:printerdetect
cls
if exist config\detectonline.enable (
rename config\detectonline.enable detectonline.disable
echo 已禁用打印机检测，无视打印机是否在线)else (
rename config\detectonline.disable detectonline.enable
echo 已启用打印机检测，打印机离线后暂停任务)
ping 127.1 >nul -n 2
goto mainmenu