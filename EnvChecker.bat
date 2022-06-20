@echo off
title Reine Printer Maintance Tool
setlocal enabledelayedexpansion
echo 本工具将检查运行环境
python -h >nul
if not %ERRORLEVEL%==0 (
echo 缺少Python3！)else (echo 已找到Python3)
if not exist "C:\Program Files\Microsoft Office\root\Office16\EXCEL.EXE" (
echo 缺少MS Office！ )else (echo 已找到MS Office)
for /r "C:\Program Files (x86)\Adobe\" %%i in (acrodist.*) do set acrodist=%%i
for /r "C:\Program Files\Adobe\" %%i in (acrodist.*) do set acrodist=%%i
if not defined acrodist (
echo 未找到Acrobat Pro DC！
)else (echo 已找到Acrobat Pro DC)
if not %PROCESSOR_ARCHITECTURE%==AMD64 (
echo 当前架构是%PROCESSOR_ARCHITECTURE%，不受官方支持)else (echo 当前架构为AMD64，受官方支持)
if %NUMBER_OF_PROCESSORS% GEQ 4 (
echo 当前设备逻辑核心数量为%NUMBER_OF_PROCESSORS%，可以流畅工作)else (echo 当前设备逻辑核心数小于4，可能无法打印某些格式)
sc query|find "Spooler" >nul && echo 系统打印服务正在运行 || echo 系统打印服务不在运行！
pause >nul