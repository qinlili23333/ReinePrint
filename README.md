# ReinePrint
一个简易的网页打印服务端，可扩展各类文件格式支持，基于MPL协议永久免费开源  
`我不赚钱欸我就是玩就是喜欢砸人饭碗`  
项目名的来源是[月亮国公主六边形战士兰音](https://space.bilibili.com/698029620/)  
## 开发中
目前已官方支持以下格式：  
图片类：bmp,jpeg,jpg,png,tif,tiff  
文档类：caj,doc,docx,pdf,ppt,pptx,txt,html
预处理文件类：xps,oxps,ps

## 使用方法
Clone本项目到本地，确认已经安装Python3（需加入`PATH`变量）和MS Office后，首先运行`PythonModuleInit.bat`，初始化完成后运行`Launch.bat`即可启动  
如果你使用内置的`qrcp`接收服务请务必在路由器上放行本机的`9980`端口  
请务必确保已经在设置内关闭`Let Windows manage my default printer`并设置了默认打印机，所有打印都会在默认打印机上进行，请不要把默认打印机设置为`Adobe PDF`等虚拟打印机测试  
如果需要修改打印设置，把打印机的首选项改掉就行了，本项目一律使用你设置的首选项进行打印  
本项目可以在多网卡设备上运行，但显示地址和二维码默认只显示第一个IP，但你可以通过本机任意IP访问  
如果你需要打印postscript文件，请打开Acrobat Distiller，在`文件-首选项`中勾选`信任所有文件`，否则一旦打印postscript文件，弹出的是否信任会打断全自动无人值守状态  


## 运行环境
.Net 4.8(oxps文档必须)  
Python3（caj,office文档必须）  
MS Office 2013以上版本（office文档必须）  
Adobe Acrobat Pro DC(postscript必须)

## 这个项目目前有什么局限性
对于文件名包含逗号和特殊字符的情况无法处理会直接报错并跳过（空格和括号已经可以处理）  
在配置极低的电脑上可能无法打印超大型的ppt/pptx  

## 我可以为这个项目做些什么
[写一个新的接收服务](receivers/DevNote.md)  
[写一个新格式的支持](printmodule/DevNote.md)  
改善本项目的任意组件的源码  
提Issue  

## 使用以下开源项目
[qrcode.js](http://davidshimjs.github.io/qrcodejs/)
[caj2pdf](https://github.com/caj2pdf/caj2pdf)
[wkhtmltopdf](https://wkhtmltopdf.org/index.html)
[PrintXPS](https://github.com/frogmorecs/PrintXPS)
[oxpsConverter](https://github.com/19871010/oxpsConverter)