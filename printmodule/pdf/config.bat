cls
echo PDF格式打印配置工具
if exist config\pdf-backend (
set /p backend=< config\pdf-backend
) else (
set backend=PDFtoPrinter
echo PDFtoPrinter > config\pdf-backend
)
echo 当前PDF打印后端为%backend%
echo [1]PDFtoPrinter（内置）
echo [2]Acrobat DC Pro（需安装）
set /p value=请输入你想切换的打印后端，输入无效值则保持不更改
if %value%==1 echo PDFtoPrinter > config\pdf-backend
if %value%==2 echo Acrobat > config\pdf-backend
echo 切换后端完成，按任意键返回
pause >nul
exit /b