
---

**Q: 什么是 latex-bupt, ThuThesis 和 BUPTThesis ？**

**A:** 都是学位论文 LaTeX2e 文档类模板：
  * [latex-bupt](http://code.google.com/p/latex-bupt) 是 uxgnaw 制作的第一个北京邮电大学研究生学位论文模板；
  * [ThuThesis](http://thuthesis.sourceforge.net/) 是[薛瑞尼](http://xueruini.myipcn.org/)制作的清华大学学位论文模板；
  * BUPTThesis 是 DazzleZhang 制作的北京邮电大学研究生学位论文模板。BUPTThesis 以 ThuThesis 为基础，根据《北京邮电大学研究生学位论文格式要求》进行了修改和补充，并添加了一些新的功能。

---


**Q: BUPTThesis 和 latex-bupt 有什么区别？**

**A:** BUPTThesis 是在 ThuThesis 基础上修改而成的。与 latex-bupt 的区别主要在于：
  * 使用 UTF-8 编码；
  * 更美观的论文格式；
  * 自动根据所指定的密级修改论文版权申明；
  * 自动抽取缩略语表；
  * 用 BibTeX 产生发表论文列表；

---


**Q: 从哪里可以下载 BUPTThesis 文档类？**

**A:** 目前 BUPTThesis 尚处在开发阶段，暂无打包的发行版本可供下载。最新的开发版本可以利用 Subversion 客户端获得，具体操作详见[下载与安装](DownloadInstall.md)。

---



**Q: 如何向开发人员反馈关于 BUPTThesis 文档类的功能需求、问题报告或者修改意见？**

**A:** 可以通过 BUPTThesis 项目主页上的 [Issues 标签页](http://code.google.com/p/buptthesis/issues/list)新增一个事件，开发人员会根据具体情况安排相应的处理办法，并公布计划的更正日期。

---



**Q: 为什么用 WinEdt 打开时汉字编码都是错的？**

**A:** BUPTThesis 使用 UTF-8 编码，而 WinEdt 默认使用的是 Ansi 编码，需要手动修改 WinEdt 的编码方式。虽然 WinEdt 从 v5.5 开始提供对 UTF-8 编码的支持，但是目前 WinEdt 对 UTF-8 编码的支持尚不完善，在其[主页](http://www.winedt.com/about.html)上已经明确指出
<blockquote>
WinEdt has currently a limited capability to handle UTF-8 documents. Full support for Unicode is planned when a transition to the new version of Delphi will be completed.<br>
</blockquote>

鉴于 WinEdt 的现状，建议大家尝试使用下列支持 UTF-8 编码的文本编辑器：
  * [GNU Emacs](http://www.gnu.org/software/emacs/)（可以配合 [AUCTeX](http://www.gnu.org/software/auctex/) 使用）
  * [TeXworks](http://code.google.com/p/texworks/)

---



**Q: 为什么最后的 pdf 文件里没有附录缩略语表呢？我查了一下 log 文件，里面有个 No file bare\_thesis.acr，是不是这个原因呢？那为什么这个文件没有生成呢？**

**A:** 请检查 glossaries 宏包是否已正确安装。请使用 makethesis.bat 或者 Makefile 编译。

---



**Q: 参考文献和/或已发表论文的 .bib 里面加入中文，编译时就报错是什么原因？**

**A:** 请确认相应的 .bib 文件使用的编码方式是 UTF-8。

---
