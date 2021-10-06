@echo off
title 打印数据归档向导
echo 本向导将指导你归档已打印文件
set /p explore=你需要打开已打印文件列表查看并整理文件吗？[Y/N(默认)]
if "%explore%"=="Y" start finished\
set /p filename=请设置要归档的文件名(默认为ReineBackup.7z)
if not defined filename set filename=ReineBackup.7z
set /p pass=请设置密码，不需要则留空
echo 正在创建归档...
if defined pass set passopt=-p%pass%
plugins\archive\7za.exe a -mx9 -sdel %passopt%  %filename% finished\
mkdir finished
echo 归档创建完成，请在Reine Print目录内查看
echo 按任意键退出
pause >nul
exit