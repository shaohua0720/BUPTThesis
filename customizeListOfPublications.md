# 自定义“攻读学位期间发表论文列表” #

攻读学位期间发表论文列表由 `pubs.tex` 产生。BUPTThesis 默认提供了\*期刊论文\*和\*会议论文\*两种子类型。如果希望增加新的子类型，例如\*专利\*需要做如下修改：

**第一步**  在`bare_thesis.tex`的导言区找到
```
%% 攻读学位期间发表论文用
%% \newcite{<suffix>}{<caption>} 声明不同的论文
%% 类型(例如: 期刊论文、会议论文等)。每一个类型的对应的 .bib 文件
%% 用 \bibliography<suffix> 命令加载，用 \nocite<suffix> 命令引用。具体
%% 请参考 pubs.tex 中的示例
\newcite{jrnl}{期刊论文}
\newcite{conf}{会议论文}
```
在会议论文类型的声明之后增加一个新的类型：
```
\newcite{ptnt}{专利}
```
这样会声明下面两个命令
```
\bibliographyptnt
\nociteptnt
```

**第二步**  在`pubs.tex`中用`\bibliographyptnt`加载 BibTeX 数据库（.bib文件），用`\nociteptnt`引用 BibTeX 条目：
```
\begin{tableofpublications}
  \bibliographyjrnl{pubs}
  \nocitejrnl{paper1}

  \bibliographyconf{pubs}
  \nociteconf{paper2}

  \bibliographyptnt{pubs}
  \nociteptnt{patent1}
  \nociteptnt{patent2}
\end{tableofpublications}
```

**第三步**  修改`makethesis-pdflatex.bat`或者`makethesis.bat`。找到
```
REM list of .aux files for mainmatter
set AUXFILES=(%TARGET% jrnl conf)
```
在`AUXFILES`列表的后面加上新的子类型名称`ptnt`
```
REM list of .aux files for mainmatter
set AUXFILES=(%TARGET% jrnl conf ptnt)
```