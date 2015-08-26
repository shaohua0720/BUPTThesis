# 概述 #

本页介绍如何下载并安装BUPTThesis到你的本地TeX系统。


# 下载 #
## 发行版本 ##
目前BUPTThesis尚处在开发阶段，暂无发行版本。

## 开发版本 ##
开发版本的BUPTThesis可以通过SVN匿名下载，如果使用命令行方式的SVN客户端，执行下列命令即可签出最新的开发版本：
```
svn checkout http://buptthesis.googlecode.com/svn/trunk/ buptthesis-read-only
```
在图形方式下可以使用[RapidSVN](http://rapidsvn.tigris.org/)或者[TortoiseSVN](http://tortoisesvn.tigris.org/)

# 依赖关系 #
BUPTThesis采用UTF8编码的CJK宏包以支持中文处理。在使用BUPTThesis前请先确认你使用的LaTeX系统已经正确安装了支持[UTF-8](http://en.wikipedia.org/wiki/UTF-8)编码的CJK宏包和下列字体：
| **字体名** | **说明** | **字体小样<sup>*</sup>** |
|:--------|:-------|:---------------------|
| song    | 宋体     | ![http://www.foundertype.com/showfontpic.php?inputword=%b7%bd%d5%fd%ca%e9%cb%ce%bc%f2%cc%e5&fontfile=FZSSJW.TTF&fileformat=jpg&nonsense=fzssjw.jpg](http://www.foundertype.com/showfontpic.php?inputword=%b7%bd%d5%fd%ca%e9%cb%ce%bc%f2%cc%e5&fontfile=FZSSJW.TTF&fileformat=jpg&nonsense=fzssjw.jpg) |
| hei     | 黑体     | ![http://www.foundertype.com/showfontpic.php?inputword=%b7%bd%d5%fd%ba%da%cc%e5%bc%f2%cc%e5&fontfile=FZHTJW.TTF&fileformat=jpg&nonsense=fzhtjw.jpg](http://www.foundertype.com/showfontpic.php?inputword=%b7%bd%d5%fd%ba%da%cc%e5%bc%f2%cc%e5&fontfile=FZHTJW.TTF&fileformat=jpg&nonsense=fzhtjw.jpg) |
| kai     | 楷体     | ![http://www.foundertype.com/showfontpic.php?inputword=%b7%bd%d5%fd%bf%ac%cc%e5%bc%f2%cc%e5&fontfile=FZKTJW.TTF&fileformat=jpg&nonsense=fzktjw.jpg](http://www.foundertype.com/showfontpic.php?inputword=%b7%bd%d5%fd%bf%ac%cc%e5%bc%f2%cc%e5&fontfile=FZKTJW.TTF&fileformat=jpg&nonsense=fzktjw.jpg) |

<sup>*</sup> 字体小样来自[方正字库网站](http://www.foundertype.com.cn)，版权归北京北大方正电子有限公司所有。BUPTThesis不包含任何形式的中文字体文件。

如果需要自己添加中文字体，可以参考李果正的[《替 LaTeX CJK 新增字型》](http://blog.bs2.to/post/EdwardLee/7672)一文。如果想一次完成多个字体的转换，可以参考[这个bash脚本](http://molecast.spaces.live.com/blog/cns!EC4D45C8447FB575!153.entry)。

除了中文字体外，BUPTThesis还依赖下列宏包：
| **宏包名**       | **发行日期**　 | **版本**   | **说明** |
|:--------------|:----------|:---------|:-------|
| `calc`        | 2005/08/06 | 4.2      | 增强LaTeX的算术运算能力 |
| `fontenc`     | 2005/09/27 | 1.99g    | 更改默认字符为T1编码 |
| `textcomp`    | 2005/09/27 | 1.99g    | 加载TS1编码 |
| `mathptmx`    | 2005/04/12 | 9.2a     | 数学字体使用Times |
| `courier`     | 2005/04/12 | 9.2a     | 打字机字体使用Courier |
| `helvet`      | 2005/04/12 | 9.2a     | 无衬线英文字体使用Helvetica |
| `times`       | 2005/04/12 | 9.2a     | 默认字体使用Times |
| `amsmath`     | 2000/07/18 | 2.13     | 增强对数学排版的支持 |
| `amssymb`     | 2002/01/22 | 2.2d     | 使用amsfont定义的各种数学符号 |
| `bm`          | 2004/02/26 | 1.1c     | 增加对黑体数学符号的支持 |
| `graphicx`    | 1999/02/16 | 1.0f     | 用于处理图形 |
| `subfigure`   | 2002/07/30 | 2.1.4    | 用于处理子图或子表 |
| `psfrag`      | 1998/04/11 | 3.04     | 用于替换EPS图形中的字符串 |
| `indentfirst` | 1995/11/23 | 1.03     | 支持首行缩进的宏包 |
| `paralist`    | 2002/03/18 | 2.3b     | 段落环境宏包 |
| `CJKutf8`     | 2008/05/22 | 4.8.0    | 支持UTF-8编码的CJK宏包 |
| `CJKnumb`     | 2008/05/22 | 4.8.0    | 支持CJK字符数字的宏包 |
| `CJKpunct`    | 2006/10/12 | 4.6.0    | 调整中文标点间距的宏包 |
| `ntheorem`    | 2005/07/07 | 1.25     | 自定义定理环境 |
| `array`       | 2005/08/23 | 2.4b     |        |
| `booktabs`    | 2005/04/14 | 1.61803  | 增加对三线表的支持 |
| `longtable`   | 2004/02/01 | 4.11     | 增加对跨页长表格的支持 |
| `caption`     | 2008/03/20 | 3.1h     | 自定义标题宏包 |
| `everysel`    | 1999/06/08 | 1.03     |        |
| `listings`    | 2007/02/22 | 1.4      | 带语法高亮的代码清单环境 |
| `url`         | 2006/04/12 | 3.3      | 支持可换行的URL链接 |
| `bibentry`    | 2007/10/30 | 1.5      | 可以在文中添加BIBTEX条目 |
| `natbib`      | 2007/10/30 | 8.1      | 更好的参考文献引用宏包 |
| `hypernat`    | 2001/07/09 | 1.0b     | 使hypernat和natbib兼容的宏包 |
| `chapterbib`  | 2004/02/29 | 1.11     | 支持参考文献列于各章 |
| `xcolor`      | 2007/01/21 | 2.11     | 彩色支持宏包 |
| `hyperref`    | 2008/04/24 | 6.77u    | 支持PDF文件中书签和链接的宏包 |