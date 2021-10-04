@echo off
title Reine Print 打印测试
echo 本程序将打印一张兰音的立绘作为测试
echo 请确认你已经安装打印机驱动并设置好了默认打印机
echo 按任意键开始
pause >nul
cls
echo 正在获取图片...
curl https://i0.hdslb.com/bfs/album/9829786efa39b61ac458cf19ecc7e63ab4a6c30e.jpg -o pending\Reine.jpg
echo 正在启动打印服务...
start Launch.bat
echo 请观察打印机是否打印了仅仅一张兰音
echo 按任意键退出测试
pause >nul