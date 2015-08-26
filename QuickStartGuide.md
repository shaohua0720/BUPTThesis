# 关于 BUPTThesis #

BUPTThesis 提供用于排版北京邮电大学研究生学位论文的 LaTeX2e 文档类、BibTeX 样式、以及一些辅助工具。


# 开始使用 BUPTThesis 排版论文 #

使用 BUPTThesis 排版论文首先需要在你所使用的计算机上根据操作系统选择并安装一套 TeX 发行版本，例如：

  * [TeX Live](http://www.tug.org/texlive/) （支持 [Unix-like](http://www.tug.org/texlive/quickinstall.html)系统和 [Windows](http://www.tug.org/texlive/windows.html)系统）；
  * [MikTeX](http://www.miktex.org/)/[CTeX](http://www.ctex.org/)（支持Windows系统）；或者
  * [MacTeX](http://www.tug.org/mactex/) （支持Mac OS）。

所安装的 TeX 发行版本需要支持 UTF-8 编码的 CJK 宏包；并需要安装配置宋体和黑体两种中文字体。

下载[最新的 BUPTThesis 发行版本](http://buptthesis.googlecode.com/files/buptthesis-2.0.zip)压缩包并解压缩至任意目录。

在 Windows 系统下执行 makethesis-pdftex.bat 即可编译 BUPTThesis 附带的样理论文，输出为 bare\_thesis.pdf。