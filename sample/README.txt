BUPTThesis文档类使用样例
=====================
更新记录
------
$LastChangedBy$
$LastChangedRevision$
$LastChangedDate$

文件说明
------
这个目录下包含了使用BUPTThesis编写北京邮电大学学位论文最基本的框架，各个文件的用途如下：

README.txt         当前文件

bare_thesis.tex    主文件
abstract.tex       封面与摘要
acronym.tex        缩略语
notations.tex      符号对照表
ch01-xxx.tex       分章子文件
ackgt.tex          致谢
pubs.tex           攻读学位期间发表论文列表
ch01-xxx.bib       分章参考文献数据库
pubs.bib           攻读学位期间发表论文数据库

Makefile           GNU Make用Makefile
makethesis.bat     Windows命令行用编译批处理文件

使用方法
------
1. 使用GNU Make
如果在Linux/UNIX/Cygwin环境下使用GNU Make工具，可以直接执行make完成编译产生
bare_thesis.pdf

如果在MinGW环境下，可以在Windows的命令提示符下执行mingw32-make完成编译产生
bare_thesis.pdf

2. 使用makethesis.bat
如果在Windows环境下，可以双击makethesis.bat图标完成编译产生bare_thesis.pdf

如果编译过程出错，有可能是Makefile或者makethesis.bat中的环境变量设置与运行的系统不一致，
请自行编辑这两个文件，进行必要的修改。

对于.tex文件的修改请参考.tex文件中的注释。

如有问题可以到发邮件到BUPTThesis讨论组咨询，BUPTThesis讨论组的主页是：
http://groups.google.com/group/buptthesis


