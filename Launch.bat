@echo off
set VERSION=Alpha0.1.0
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
start %%i\Service.bat
)
echo 启动打印服务...
start daemon.bat
echo 加载控制台...
title Reine Print [%VERSION%]
cls
echo Reine Print Console
echo =============
echo [0]重启
echo [1]停止
echo [2]展示打印地址
echo =============
set /p choose=请输入数字