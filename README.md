# ReinePrint
一个简易的网页打印服务端，完全模块化可随意扩展，基于MPL协议永久免费开源支持商用  
所有组件均使用完全开源的解决方案，每一行代码都可被随意审查，MPL协议要求二次开发必须开源，保证了本项目和使用本项目的其他项目都绝对纯净可控  
`我不赚钱欸我就是玩就是喜欢砸人饭碗`  
项目名的来源是[月亮国公主六边形战士兰音](https://space.bilibili.com/698029620/)  

## 格式支持
目前已官方支持以下格式：  
图片类：bmp,jpeg,jpg,png,tif,tiff  
文档类：caj,xls,xlsx,doc,docx,pdf,ppt,pptx,txt,html  
预处理文件类：xps,oxps,ps

## 使用方法
Clone本项目到本地，确认已经安装Python3（需加入`PATH`变量）和MS Office后，首先运行`PythonModuleInit.bat`，初始化完成后运行`Launch.bat`即可启动  
如果你使用内置的`qrcp`接收服务请务必在路由器上放行本机的`9980`端口  
如果你使用内置的`filebrowser`接收服务请务必在路由器上放行本机的`8080`端口  
请务必确保已经在设置内关闭`Let Windows manage my default printer`并设置了默认打印机，所有打印都会在默认打印机上进行，请不要把默认打印机设置为`Adobe PDF`等虚拟打印机测试  
如果需要修改打印设置，把打印机的首选项改掉就行了，本项目一律使用你设置的首选项进行打印  
本项目可以在多网卡设备上运行，但显示地址和二维码默认只显示第一个IP，但你可以通过本机任意IP访问  
如果你需要打印postscript文件，请打开Acrobat Distiller，在`文件-首选项`中勾选`信任所有文件`，否则一旦打印postscript文件，弹出的是否信任会打断全自动无人值守状态  


## 运行环境
### 硬件配置
CPU：推荐2核心4线程以上  
内存：可用容量大于4G  
网络：稳定的局域网连接，（互联网连接是可选的，支持映射端口开启外网打印）  
硬盘：至少拥有200M以上空闲空间（建议安装在只有ASCII字符且无空格的路径中，建议使用无空格的英文用户名）  

### 软件需求
.Net 4.8(oxps文档必须)  
Python3（caj,office文档必须）  
MS Office 2013以上版本（office文档必须）  
Adobe Acrobat Pro DC(postscript必须)

## 这个项目目前有什么局限性
对于文件名包含逗号和特殊字符的情况无法处理会直接报错并跳过（空格和括号已经可以处理）  
在配置极低的电脑上可能无法打印超大型的ppt/pptx  
qrcp在无互联网连接获取ip的情况下只能工作在一个网卡上  

## 为什么有些文件打印失败了
请按照以下顺序检查出错原因：  
1. 该文件的后缀是否在当前版本支持范围内且处于启用状态（可使用配置工具查看启用的格式）  
2. 该文件的实际格式是否与后缀相符合（比如后缀为`.ppt`的`PNG`图片无法打印）  
3. 你是否具备该文件格式所必须的运行环境和足够的设备配置  
4. 该文件的文件名是否具备逗号或其他特殊符号  
如果没有上述问题，请提交一个Issue详细描述你遇到的问题，并附上遇到问题的文件  

## 根目录程序内容
`ConfigureTool.bat`配置工具，可启用或停用格式支持  
`daemon.bat`打印队列服务，请不要单独运行这个程序  
`EnvChecker.bat`环境检查，检查是否可以流畅稳定运行打印服务  
`Launch.bat`启动并管理主服务，平时只需要启动这个程序  
`PythonModuleInit.bat`初始化必须的pip模块，你只需要运行一次  
`ReineDemoTest.bat`测试程序，打印一张兰音的立绘用于测试部署情况   

## 我可以为这个项目做些什么
[写一个新的接收服务](receivers/DevNote.md)  
[写一个新格式的支持](printmodule/DevNote.md)  
改善本项目的任意组件的源码  
提Issue  

## 使用以下开源项目
[qrcode.js](http://davidshimjs.github.io/qrcodejs/)  
[caj2pdf](https://github.com/caj2pdf/caj2pdf)（包括[MuPDF](https://www.mupdf.com/)）  
[wkhtmltopdf](https://wkhtmltopdf.org/index.html)  
[PrintXPS](https://github.com/frogmorecs/PrintXPS)  
[oxpsConverter](https://github.com/19871010/oxpsConverter)  
[7zip](https://www.7-zip.org/)  
[PDFtoPrinter](http://www.columbia.edu/~em36/pdftoprinter.html)  
[filebrowser](https://github.com/filebrowser/filebrowser)  
