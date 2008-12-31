%% BUPTThesis.cls
%%
%% 北京邮电大学研究生学位论文LaTeX2e文档类
%% 
%% 项目主页：http://code.google.com/p/buptthesis/
%% 
%% 本文档类基于 ThuThesis.cls 修改而成，基本满足北京邮电大学研究生论文格式要求
%%
%% 作者：
%% 张煜 (email:dazzlezhang@gmail.com)
%%
%% 更新记录:
%% $LastChangedBy$
%% $LastChangedDate$
%% $LastChangedRevision$

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{BUPTThesis}[2007/05/27 0.1 BUPTThesis Class by Yu Zhang]
\typeout{-- See the "BUPTThesis_HOWTO" manual for usage information.}
\typeout{-- http://code.google.com/p/buptthesis/}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BUPTThesis.cls 版本号, vM.m
\def\BUPTThesisversionmajor{0}
\def\BUPTThesisversionminor{1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 类名 BUPT-Thesis 的排版命令
\def\BUPTThesis{%
  \textsc{BUPT}-\textsc{Thesis}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 类选项条件项
%%% 学位类别选项 (*doctor*, master)
\newif\ifBUPT@doctor\BUPT@doctortrue  
\newif\ifBUPT@master\BUPT@masterfalse 
\DeclareOption{doctor}{         % 博士学位
  \BUPT@doctortrue
  \BUPT@masterfalse} 
\DeclareOption{master}{         % 硕士学位
  \BUPT@mastertrue
  \BUPT@doctorfalse}

%%% 保密等级选项 (*open*, control, confidential, classified, mostconfidential)
\newif\ifBUPT@secretlvl@open\BUPT@secretlvl@opentrue
\newif\ifBUPT@secretlvl@control\BUPT@secretlvl@controlfalse
\newif\ifBUPT@secretlvl@confidential\BUPT@secretlvl@confidentialfalse
\newif\ifBUPT@secretlvl@classified\BUPT@secretlvl@classifiedfalse
\newif\ifBUPT@secretlvl@mostconfidential\BUPT@secretlvl@mostconfidentialfalse
\DeclareOption{open}{             % 公开级
  \BUPT@secretlvl@opentrue
  \BUPT@secretlvl@controlfalse
  \BUPT@secretlvl@confidentialfalse
  \BUPT@secretlvl@classifiedfalse
  \BUPT@secretlvl@mostconfidentialfalse}
\DeclareOption{control}{          % 限制级
  \BUPT@secretlvl@openfalse
  \BUPT@secretlvl@controltrue
  \BUPT@secretlvl@confidentialfalse
  \BUPT@secretlvl@classifiedfalse
  \BUPT@secretlvl@mostconfidentialfalse}  
\DeclareOption{confidential}{     % 秘密级
  \BUPT@secretlvl@openfalse
  \BUPT@secretlvl@controlfalse
  \BUPT@secretlvl@confidentialtrue
  \BUPT@secretlvl@classifiedfalse
  \BUPT@secretlvl@mostconfidentialfalse}
\DeclareOption{classified}{       % 机密级
  \BUPT@secretlvl@openfalse
  \BUPT@secretlvl@controlfalse
  \BUPT@secretlvl@confidentialfalse
  \BUPT@secretlvl@classifiedtrue
  \BUPT@secretlvl@mostconfidentialfalse}
\DeclareOption{mostconfidential}{ % 绝密级
  \BUPT@secretlvl@openfalse
  \BUPT@secretlvl@controlfalse
  \BUPT@secretlvl@confidentialfalse
  \BUPT@secretlvl@classifiedfalse
  \BUPT@secretlvl@mostconfidentialtrue}

% 因为已经指定了默认选项，下面检查密级选项是否指定的判断就不需要了
% % 检查是否指定密级选项
% \AtEndOfClass{%
%   \ifBUPT@secretlvl@open\relax\else
%   \ifBUPT@secretlvl@control\relax\else
%   \ifBUPT@secretlvl@confidential\relax\else
%   \ifBUPT@secretlvl@classified\relax\else
%   \ifBUPT@secretlvl@mostconfidential\relax\else
%   \ClassError{BUPTthesis}{%
%     You have to specify one of secret levels: open, control, confidential, classified, or mostconfidential.}{}
%   \fi\fi\fi\fi\fi

%   \ifBUPT@sectionbib
%   \typeout{Bibliography will be typeset in the last section of each chapter.}
%   \fi
%   \ifBUPT@chapterbib
%   \typeout{Bibliography will be typeset in the last chapter.}
%   \fi
% }

%%% 参考文献格式选项 (*sectbib*, chapbib)
\newif\ifBUPT@sectbib\BUPT@sectbibtrue
\newif\ifBUPT@chapbib\BUPT@chapbibfalse
\DeclareOption{sectbib}{        % 参考文献列于各章末尾
  \BUPT@sectbibtrue
  \BUPT@chapbibfalse
}
\DeclareOption{chapbib}{        % 参考文献列于正文最后
  \BUPT@chapbibtrue
  \BUPT@sectbibfalse
}

%%% 数学字体选项 (mathptmx, *mathtime*)
\newif\ifBUPT@mathtime\BUPT@mathtimefalse
\newif\ifBUPT@mathptmx\BUPT@mathptmxtrue
\DeclareOption{mathtime}{       % 数学字体使用 MathTime
  \BUPT@mathtimetrue
  \BUPT@mathptmxfalse}
\DeclareOption{mathptmx}{       % 数学字体使用 mathptmx
  \BUPT@mathtimefalse
  \BUPT@mathptmxtrue}

%%% 题名页选项 (titlepage, *notitlepage*)
\newif\ifBUPT@titlepage\BUPT@titlepagefalse
\newif\ifBUPT@notitlepage\BUPT@notitlepagetrue
\DeclareOption{titlepage}{      % 前置部分包含题名页
  \BUPT@titlepagetrue
  \BUPT@notitlepagefalse
}
\DeclareOption{notitlepage}{    % 前置部分不包含题名页
  \BUPT@titlepagefalse
  \BUPT@notitlepagetrue
}

%%% 输出版本 (*print*, online)
\newif\ifBUPT@print\BUPT@printtrue
\newif\ifBUPT@online\BUPT@onlinefalse
\DeclareOption{print}{          % 打印版本
  \BUPT@printtrue
  \BUPT@onlinefalse
}
\DeclareOption{online}{         % 在线版本
  \BUPT@printfalse
  \BUPT@onlinetrue
}

%%% 设置默认类选项 (博士学位, 公开级, 参考文献列于各章末尾, 无题名页, 打印版本)
\ExecuteOptions{doctor,open,sectbib,mathptmx,notitlepage,print}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 传递选项给 book 文档类
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

% 根据用户设置的类选项重载默认的类选项
\ProcessOptions

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 加载 book 文档类作为 BUPTThesis 文档类的基础
% (字号 12pt, A4 纸, 章从奇数页开始, 双面印刷) 
\LoadClass[12pt, a4paper, openright, twoside]{book}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 加载宏包
%%% calc.sty 增强了 LaTeX 的算术运算能力
\RequirePackage{calc}

%%% 使用扩展 T1 与 TS1 编码
%\RequirePackage[T1]{fontenc}
%\RequirePackage{textcomp}

%%% 字体设置
\ifBUPT@mathptmx                % mathptmx 选项
\RequirePackage{mathptmx}       % roman      字体使用 Times-Roman
\RequirePackage{courier}        % typewriter 字体使用 Courier
\RequirePackage[scaled=.92]{helvet} 
                                % sans-serif 字体使用 Helvetica
\RequirePackage{amsmath}        % 使用 amsmath 数学宏包
\RequirePackage{amssymb}        % 使用 amssymb 符号字体
\newcommand{\bm}{\mathbf}       % 加粗符号使用 \mathbf
\else                           % MathTime 选项
\RequirePackage{times}          % roman      字体使用 Times-Roman
                                % typewriter 字体使用 Courier
\RequirePackage[scaled=.92]{helvet} 
                                % sans-serif 字体使用 Helvetica
\RequirePackage{amsmath}        % 使用 AMSTeX 数学宏包
\RequirePackage[subscriptcorrection,slantedGreek,nofontinfo,boldalphabet]{mtpro}
                                % 使用 MathTime Professional 字体
\RequirePackage[mtphrb]{mtpams} % 使用 MathTime Professional Supplement A 字体
                                % blackboard bold 字体使用 holey roman bold
\RequirePackage[mtpscr,mtpfrak]{mtpb}
                                % 使用 MathTime Professional Supplement B 字体
                                % \mathscr  使用 Math Script 字体
                                % \mathfrak 使用 Math Fraktur 字体
                                % \mathcal  使用 Math Calligraphic 字体
\RequirePackage{bm}             % 加粗符号使用 \boldsymbol
\fi
\RequirePackage[low-sup]{subdepth}       
                                % 使用 Subdepth 宏包, 调整上下标位置

%%% 条件公式
\RequirePackage{cases}           % 使用 cases 宏包以支持子公式编号的条件公式

%%% 图形支持
\RequirePackage[dvips]{graphicx} % 使用 dvips 驱动的 graphicx 宏包
\RequirePackage{subfigure}       % 使用 subfigure 宏包处理子图

%%% 首行缩进
\RequirePackage{indentfirst}

%%% 列表环境
\RequirePackage[neverdecrease]{paralist}

%%% 中文支持
\RequirePackage{CJKutf8}
\RequirePackage{CJKnumb}
\RequirePackage{CJKpunct}

%%% 定理类环境
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}

%%% 表格相关的宏包
\RequirePackage{array}
\RequirePackage{longtable}      % 支持跨页长表格
\RequirePackage{booktabs}       % 支持三线表
% tabular 环境中指定宽度的列居中命令
\newcommand\PBS[1]{\let\temp=\\%
  #1%
  \let\\=\temp
}

%%% 标题格式
\RequirePackage{caption}
\RequirePackage{everysel}

%%% 代码清单环境
\RequirePackage{listings}
\lstset{                                          % 默认代码清单环境格式
  extendedchars=false,                            % CJK 环境下禁用扩展字符
  aboveskip=12pt,                                 % 
  belowskip=12pt,                                 %
  numbers=left, numberstyle=\scriptsize\ttfamily, %
  basicstyle=\xiaowu[1.5]\ttfamily,               %
  keywordstyle=\color{Black},                     %\color{Purple},
  stringstyle=\ttfamily,                          %
  identifierstyle=\color{Black},                  %\color{NavyBlue}, %
  commentstyle=\it\ttfamily\kai\color{Black},     %\color{BrickRed}, %
  backgroundcolor=\color{White},                  %
  frame=lines,                                    %
  framerule=0.5pt,                                %
  linewidth=155mm,                                %
  xleftmargin=17.5mm,                             %
  xrightmargin=17.5mm,                            %
  breaklines=true,                                %
  breakatwhitespace=true,                         %
  breakindent=0pt                                 %
}

%%% 参考文献
\RequirePackage{url}
\RequirePackage{bibentry}
\ifBUPT@chapbib
\RequirePackage[square,super,numbers,sort&compress]{natbib}
\RequirePackage{hypernat}
\else
\RequirePackage[sectionbib,square,super,numbers,sort&compress]{natbib}
\RequirePackage{hypernat}
\RequirePackage{chapterbib}
\fi

\let\oldbibsecion\bibsection

\ifBUPT@chapbib
\renewcommand{\bibsection}{\oldbibsecion\addcontentsline{toc}{chapter}{\bibname}\wuhao[1.5]}
\else
\renewcommand{\bibsection}{\oldbibsecion\addcontentsline{toc}{section}{\bibname}\wuhao[1.5]}
\fi

%%% 书签支持
\RequirePackage[usenames,dvipsnames,dvips]{xcolor}
\RequirePackage[unicode,a4paper,dvips,colorlinks=true,linkcolor=Blue,citecolor=Mahogany,citebordercolor=white]{hyperref}

%%% 自动产生缩略语表
\RequirePackage[toc,section=chapter]{glossaries}
\setlength{\glsdescwidth}{0.8\linewidth} % 缩略语描述列宽
\newglossarystyle{BUPT@Acronyms@style}{  % 设置自定义缩略语表格式
  \glossarystyle{long}                   % 以 long 样式为基础
  \renewcommand*{\glossaryentryfield}[5]{% 
    \@glstarget{glo:##1}{##2} & ##3\CJKchar{"0FF}{"00C}##4\\}%
}
\glossarystyle{BUPT@Acronyms@style} % 选择自定义的缩略语表样式
% 设置 acronym 词汇表的标题
\newglossary[alg]{acronym}{acr}{acn}{\BUPT@listofacronyms@name}
\makeglossaries
% 重载 \newacronym 命令
\renewcommand{\newacronym}[5][]{
  \newglossaryentry{#2}{%
    type=\acronymtype,%
    name={#3},
    description={#4},
    text={#3},%
    descriptionplural={#4\acrpluralsuffix},%
    first={#3}, %{#4 (#3)},%
    plural={#3\acrpluralsuffix},%
    firstplural={\@glo@descplural\space (\@glo@plural)},
    symbol={#5},% 
    #1}
}
% 重载 \glsdisplayfirst 命令
\renewcommand{\glsdisplayfirst}[4]{
  \!\CJKchar{"0FF}{"008}% 中文括号“（”
  \!{#2}% 
  \CJKchar{"0FF}{"00C}% 全宽逗号“，”
  \!{#1}% 
  \!\CJKchar{"0FF}{"009}% 中文括号“）”
}

\renewcommand{\glsdefaulttype}{acronym}
\renewcommand{\glossarysection}[2][\@gls@title]{\chapter{#2}}
\newcommand{\tableofacronyms}{\printglossary[type=\acronymtype]}


%\RequirePackage{titlesec}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 论文页面格式
%% 前置部分，包括封面、封二、题名页、英文题名页、摘要页、目次页等
\renewcommand\frontmatter{%
  \cleardoublepage              % 从奇数页开始
  \@mainmatterfalse             % 非主体部分标志
  \pagenumbering{Roman}         % 页码使用大写罗马数字
  \pagestyle{BUPT@empty}        % 无页眉页脚(BUPT@empty格式)
}       
%% 主体部分格式
\renewcommand\mainmatter{%
  \cleardoublepage              % 从奇数页开始
  \@mainmattertrue              % 主体部分标志
  \pagenumbering{arabic}        % 页码使用阿拉伯数字
  \pagestyle{BUPT@headings}
}
%% 结尾部分格式
\renewcommand\backmatter{%
  \cleardoublepage}

%% 重新定义字体命令
\newcommand\song{\CJKfamily{song}} % 宋体
\newcommand\hei{\CJKfamily{hei}}   % 黑体
\newcommand\kai{\CJKfamily{kai}}   % 楷体
\newcommand\fs{\CJKfamily{fs}}     % 仿宋
\newcommand\li{\CJKfamily{li}}     % 隶书
\newcommand\you{\CJKfamily{you}}   % 幼圆

%% 重新定义字号命令
\newlength\BUPT@linespace                   % 声明行距
\newcommand{\BUPT@choosefont}[2]{%
  \setlength{\BUPT@linespace}{#2*\real{#1}}%
  \fontsize{#2}{\BUPT@linespace}\selectfont
}
\def\BUPT@define@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][\baselinestretch]{%
    \BUPT@choosefont{##1}{#2}
  }
}

\BUPT@define@fontsize{chuhao}{42bp}  % 初号
\BUPT@define@fontsize{xiaochu}{36bp} % 小初
\BUPT@define@fontsize{yihao}{26bp}   % 一号
\BUPT@define@fontsize{xiaoyi}{24bp}  % 小一
\BUPT@define@fontsize{erhao}{22bp}   % 二号
\BUPT@define@fontsize{xiaoer}{18bp}  % 小二
\BUPT@define@fontsize{sanhao}{16bp}  % 三号
\BUPT@define@fontsize{xiaosan}{15bp} % 小三
\BUPT@define@fontsize{sihao}{14bp}   % 四号
\BUPT@define@fontsize{banxiaosi}{13bp} % 半小四
\BUPT@define@fontsize{xiaosi}{12bp}    % 小四
\BUPT@define@fontsize{dawu}{11bp}      % 大五号
\BUPT@define@fontsize{wuhao}{10.5bp}   % 五号
\BUPT@define@fontsize{xiaowu}{9bp}     % 小五
\BUPT@define@fontsize{liuhao}{7.5bp}   % 六号
\BUPT@define@fontsize{xiaoliu}{6.5bp}  % 小六
\BUPT@define@fontsize{qihao}{5.5bp}    % 七号
\BUPT@define@fontsize{bahao}{5bp}      % 八号
\BUPT@define@fontsize{covertitlesize}{32bp}
%%% 默认字号小四
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12bp}{20bp}
  \abovedisplayskip=10bp \@plus 2bp \@minus 2bp
  \abovedisplayshortskip=10bp \@plus 2bp \@minus 2bp
  \belowdisplayskip=\abovedisplayskip
  \belowdisplayshortskip=\abovedisplayshortskip
}

%% 页面设置
% 纸张 210mm x 297mm (A4)
% 版芯 155mm x 230mm
\AtBeginDvi{\special{papersize=\the\paperwidth,\the\paperheight}}
\AtBeginDvi{\special{!%
    \@percentchar\@percentchar BeginPaperSize: a4
    ^^Ja4^^J\@percentchar\@percentchar EndPaperSize}}
\setlength{\hoffset}{-1in}
\addtolength{\hoffset}{5mm}           % 装订线: 1in + \hoffset = 5mm
\setlength{\voffset}{-1in}            %
\setlength\marginparwidth{0mm}        %
\setlength\marginparsep{0mm}          %
\setlength{\textwidth}{\paperwidth}   %
\addtolength{\textwidth}{-55mm}       % 版芯宽度: 155mm = 210mm - 55mm
\setlength{\oddsidemargin}{25mm}      % 内侧页边距: 奇数页左侧页边距
\setlength{\evensidemargin}{20mm}     % 外侧页边距: 偶数页左侧页边距 
\setlength{\textheight}{\paperheight} %
\setlength{\headheight}{20pt}         % 页眉高度: 20pt
\setlength{\topskip}{0pt}             % 
\setlength{\skip\footins}{15pt}       %
\setlength{\topmargin}{30mm}          % 上边距: 30mm
\setlength{\footskip}{15mm}           %
\setlength{\headsep}{5mm}             %
\addtolength{\textheight}{-79mm}      % 文字高度:  297mm (纸张高度)
                                      %          - 30mm (上边距) 
                                      %          -  7mm (\headerheight, 20pt) 
                                      %          -  5mm (\headsep)
                                      %          - 15mm (\footskip)
                                      %          - 22mm (下边距)
%% 页眉页脚
\let\BUPT@cleardoublepage\cleardoublepage
\newcommand{\BUPT@clearemptydoublepage}{%
  \clearpage{\pagestyle{empty}\BUPT@cleardoublepage}}
\let\cleardoublepage\BUPT@clearemptydoublepage
% 定义三种页眉页脚页面
%% ps@BUPT@empty 无页眉，无页脚
\def\ps@BUPT@empty{%
  \let\@oddhead\@empty                    % 奇数页眉为空
  \let\@evenhead\@empty                   % 偶数页眉为空
  \let\@oddfoot\@empty                    % 奇数页脚为空
  \let\@evenfoot\@empty                   % 偶数页脚为空
}
%% ps@BUPT@plain 无页眉，页脚为五号页码
\def\ps@BUPT@plain{%
  \let\@oddhead\@empty                    % 奇数页眉为空
  \let\@evenhead\@empty                   % 偶数页眉为空
  \def\@oddfoot{\hfil\wuhao\thepage\hfil} % 奇数页脚为居中页码
  \let\@evenfoot=\@oddfoot                % 偶数页脚为居中页码
}
%% ps@BUPT@headings 有页眉有页脚
\def\ps@BUPT@headings{                    %
  \def\@oddhead{                          % 奇数页页眉
    \vbox to\headheight{                  %
      \hb@xt@\textwidth{                  %
%        \hfill\wuhao\song\leftmark\hfill
        \xiaowu\song\hfill\cBUPTthesis%\hfill\leftmark
      }%
      \vskip2pt\hbox{%
        \vrule width\textwidth height0.4pt depth0pt
      }
    }
  }
  \def\@evenhead{%
    \vbox to\headheight{%
      \hb@xt@\textwidth{%
%        \wuhao\song\hfill\leftmark\hfill
%        \xiaowu\song\cBUPTthesis\hfill\leftmark
        \xiaowu\song\leftmark\hfill
      }%
      \vskip2pt\hbox{%
        \vrule width\textwidth height0.4pt depth0pt
      }
    }
  }
  \def\@oddfoot{\hfil\wuhao\thepage\hfil} % 奇数页脚为居中页码
  \let\@evenfoot=\@oddfoot                % 偶数页脚为居中页码
}
%\renewcommand{\thechapter}{\CJKnumber{\value{chapter}}}
\renewcommand{\chaptermark}[1]{\@mkboth{\@chapapp\ ~~#1}{}}

%% 中文段落首行缩进两字符
\newlength\CJKtwospaces
\def\CJKindent{%
  \settowidth\CJKtwospaces{\CJKchar{"030}{"000}\CJKchar{"030}{"000}}%
  \parindent\CJKtwospaces}
\newlength{\CJKfourchars}
\setlength{\CJKfourchars}{\CJKtwospaces}
\addtolength{\CJKfourchars}{\CJKtwospaces}
%% 4个中文字符宽度
%\newlength{\CJKcharwidth}
%\settowidth{\CJKcharwidth}{\CJKchar{"030}{"000}}
%% 段落间垂直距离
\setlength{\parskip}{0pt \@plus2pt \@minus0pt}
%% 调整默认列表环境间距
\def\BUPT@item@space{%
  \let\itemize\compactitem
  \let\enditemize\endcompactitem
  \let\enumerate\compactenum
  \let\endenumerate\endcompactenum
  \let\description\compactdesc
  \let\enddescription\endcompactdesc
}
%% 脚注
\newcommand*\MakePerPage[2][\@ne]{%
  \expandafter\def\csname c@pchk@#2\endcsname{\c@pchk@{#2}{#1}}%
  \newcounter{pcabs@#2}%
  \@addtoreset{pchk@#2}{#2}}
\def\new@pagectr#1{\@newl@bel{pchk@#1}}
\def\c@pchk@#1#2{\z@=\z@
  \begingroup
  \expandafter\let\expandafter\next\csname pchk@#1@\arabic{pcabs@#1}\endcsname
  \addtocounter{pcabs@#1}\@ne
  \expandafter\ifx\csname pchk@#1@\arabic{pcabs@#1}\endcsname\next
  \else \setcounter{#1}{#2}\fi
  \protected@edef\next{%
    \string\new@pagectr{#1}{\arabic{pcabs@#1}}{\noexpand\thepage}}%
  \protected@write\@auxout{}{\next}%
  \endgroup\global\z@}
\MakePerPage{footnote}
%% 脚注带圈数字
\def\BUPT@textcircled#1{%
  % 1~10的带圈数字直接使用字库中的带圈数字
  \ifnum \value{#1} = 1 \CJKchar{"024}{"060}
  \else\ifnum \value{#1} = 2 \CJKchar{"024}{"061}
  \else\ifnum \value{#1} = 3 \CJKchar{"024}{"062}
  \else\ifnum \value{#1} = 4 \CJKchar{"024}{"063}
  \else\ifnum \value{#1} = 5 \CJKchar{"024}{"064}
  \else\ifnum \value{#1} = 6 \CJKchar{"024}{"065}
  \else\ifnum \value{#1} = 7 \CJKchar{"024}{"066}
  \else\ifnum \value{#1} = 8 \CJKchar{"024}{"067}
  \else\ifnum \value{#1} = 9 \CJKchar{"024}{"068}
  \else\ifnum \value{#1} = 10 \CJKchar{"024}{"069}
  % 11~99的带圈数字
  \else \textcircled{\qihao\arabic{#1}}
  \fi\fi\fi\fi\fi\fi\fi\fi\fi\fi
}
\renewcommand{\thefootnote}{\BUPT@textcircled{footnote}}
\renewcommand{\thempfootnote}{\BUPT@textcircled{mpfootnote}}
\def\footnoterule{\vskip-3\p@\hrule\@width0.3\textwidth\@height0.4\p@\vskip2.6\p@}
\let\BUPT@footnotesize\footnotesize
\renewcommand\footnotesize{\BUPT@footnotesize\xiaowu[1.5]}
\def\@makefnmark{\textsuperscript{\hbox{\normalfont\@thefnmark}}}
\long\def\@makefntext#1{
  \bgroup
  \setbox\@tempboxa\hbox{%
    \hb@xt@ 2em{\@thefnmark\hss}}
  \leftmargin\wd\@tempboxa
  \rightmargin\z@
  \linewidth \columnwidth
  \advance \linewidth -\leftmargin
  \parshape \@ne \leftmargin \linewidth
  \footnotesize
  \@setpar{{\@@par}}%
  \leavevmode
  \llap{\box\@tempboxa}%
  #1
  \par\egroup}

%% 数学相关
%%% 允许公式断行、分页
\allowdisplaybreaks[4]
%\def\make@df@tag{\@ifstar\BUPT@make@df@tag@@\make@df@tag@@@}
%\def\BUPT@make@df@tag@@#1{%
%  \gdef\df@tag{\BUPT@maketag{#1}\def\@currentlabel{#1}}}
% redefinitation of tagform broken eqref!
\renewcommand{\eqref}[1]{\textup{(\ref{#1})}}
\renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter-\fi\@arabic\c@equation}
\renewcommand\thefigure{\ifnum \c@chapter>\z@ \thechapter-\fi\@arabic\c@figure}
\renewcommand\thetable{\ifnum \c@chapter>\z@ \thechapter-\fi\@arabic\c@table}
%\def\BUPT@maketag#1{\maketag@@@{(\ignorespaces #1\unskip\@@italiccorr)}}
%\def\tagform@#1{\maketag@@@{%
%    (\ignorespaces #1\unskip\@@italiccorr)\equcaption{#1}}}
%%% 证明环境方块乱跑
\gdef\@endtrivlist#1{% % from \endtrivlist
  \if@inlabel \indent\fi
  \if@newlist \@noitemerr\fi
  \ifhmode
  \ifdim\lastskip >\z@ #1\unskip \par %<<<<<<<<<<<<<<<<<<<<<<
  \else #1\unskip \par \fi
  \fi
  \if@noparlist \else
  \ifdim\lastskip >\z@
  \@tempskipa\lastskip \vskip -\lastskip
  \advance\@tempskipa\parskip \advance\@tempskipa -\@outerparskip
  \vskip\@tempskipa
  \fi
  \@endparenv
  \fi #1}
%%% 定理是用黑体，正文使用宋体，用冒号隔开
\renewtheoremstyle{plain}%
{\item[\hskip\labelsep \theorem@headerfont ##1\ ##2\theorem@separator]}%
{\item[\hskip\labelsep \theorem@headerfont ##1\ ##2\ \CJKchar{"0FF}{"008}##3\CJKchar{"0FF}{"009}\!\theorem@separator\!]}
\renewtheoremstyle{nonumberplain}%
{\item[\theorem@headerfont\hskip\labelsep ##1\theorem@separator]}%
{\item[\theorem@headerfont\hskip \labelsep ##1\ \CJKchar{"0FF}{"008}##3\CJKchar{"0FF}{"009}\!\theorem@separator\!]}
\theoremstyle{plain}

\theorembodyfont{\song\rmfamily}
\theoremheaderfont{\hei\bfseries}
% \theoremsymbol{\ensuremath{\blacksquare}}
\theoremsymbol{}
%%% 浮动对象及表格
\setlength{\floatsep}{12bp \@plus4pt \@minus1pt}
\setlength{\intextsep}{12bp \@plus4pt \@minus2pt}
\setlength{\textfloatsep}{12bp \@plus4pt \@minus2pt}
\setlength{\@fptop}{0bp \@plus1.0fil}
\setlength{\@fpsep}{12bp \@plus2.0fil}
\setlength{\@fpbot}{0bp \@plus1.0fil}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}
\let\old@tabular\@tabular
\def\BUPT@tabular{\wuhao[1.5]\old@tabular}
\DeclareCaptionLabelFormat{BUPT}{{\wuhao[1.5]\kai #1~\rmfamily #2}}
\DeclareCaptionLabelSeparator{BUPT}{\hspace{1em}}
\DeclareCaptionFont{BUPT}{\wuhao[1.5]\kai}
\captionsetup{labelformat=BUPT,labelsep=BUPT,font=BUPT}
\captionsetup[table]{position=top,belowskip={12bp-\intextsep},aboveskip=3bp}
\captionsetup[figure]{position=bottom,belowskip={12bp-\intextsep},aboveskip=-
  2bp}
\captionsetup[subfloat]{font=BUPT,captionskip=6bp,nearskip=6bp,farskip=0bp,topadjust=0bp}
% \renewcommand{\thesubfigure}{\thefigure--(\arabic{subfigure})}
% \renewcommand{\p@subfigure}{:}
%% 三线表longtable
\def\LT@c@ption#1[#2]#3{% change code from longtable.sty
\LT@makecaption#1\fnum@table{#3}%
\def\@tempa{#2}%
\ifx\@tempa\@empty\else
{\let\\\space
  \addcontentsline{lot}{table}%
  {\protect\numberline{\tablename\hskip0.5em\thetable}{#2}}}%
\fi}
\let\BUPT@LT@array\LT@array
\def\LT@array{\wuhao[1.5]\BUPT@LT@array} % set default font size
\def\hlinewd#1{%
  \noalign{\ifnum0=`}\fi\hrule \@height #1 \futurelet
  \reserved@a\@xhline}

%% 章节标题
\renewcommand\chapter{%
  \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{%
  \cleardoublepage\phantomsection%
  \thispagestyle{BUPT@headings}%
  \global\@topnum\z@%
  \@afterindenttrue%
  \ifnum \c@secnumdepth >\m@ne
  \if@mainmatter
  \refstepcounter{chapter}%
  \addcontentsline{toc}{chapter}{\protect\numberline{\@chapapp}#1}%TODO: shit
  \else
  \addcontentsline{toc}{chapter}{#1}%
  \fi
  \else
  \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  \@makechapterhead{#2}}
\def\@makechapterhead#1{%
  \vspace*{20bp}%
  {\parindent \z@ \centering
    \hei\bfseries\csname BUPT@title@font\endcsname\sanhao[1]
    \ifnum \c@secnumdepth >\m@ne
    \@chapapp\hskip1em
    \fi
    #1\par\nobreak
    \vskip 24bp}}
\def\@schapter#1{%
  \cleardoublepage\phantomsection%
  \thispagestyle{BUPT@headings}%
  \global\@topnum\z@%
  \@afterindenttrue%
  \ifx\BUPT@preschapter\empty
    \relax
  \else
    \BUPT@preschapter
  \fi
  \@makeschapterhead{#1}
  \@afterheading}
\def\@makeschapterhead#1{%
  \vspace*{20bp}%
  {\parindent \z@ \centering
    \hei\bfseries\csname BUPT@title@font\endcsname
    \ifx\BUPT@schapterformat\empty
      \sanhao[1]
    \else
      \BUPT@schapterformat
    \fi
    \interlinepenalty\@M
    #1\par\nobreak
    \vskip 24bp}}

%%% 定义一个超强的chapter*
% \BUPT@chapter*[<tocline>]{<title>}[<titlesize>][<prefix>]
\def\BUPT@chapter*{%
  \@ifnextchar [ % ]
  {\BUPT@@chapter}     % 如果是\BUPT@chapter*[，按\BUPT@@chapter处理
  {\BUPT@@chapter@}    % 否则是\BUPT@chapter*{<title>}，按\BUPT@@chapter@处理
}
% 把\BUPT@chapter*{<title>}替换为为\BUPT@@chapter[<title>]{<title>}
\def\BUPT@@chapter@#1{%
  \BUPT@@chapter[#1]{#1}%
}
% 
\def\BUPT@@chapter[#1]#2{%
  \@ifnextchar [ % ]
  {\BUPT@@@chapter[#1]{#2}}      % 如果是\BUPT@chapter*[#1]{#2}[，
                                 % 按\BUPT@@@chapter[#1]{#2}处理
  {\BUPT@@@chapter[#1]{#2}[][]}} % 如果是\BUPT@chapter*[#1]{#2}
                                 % 按\BUPT@@@chapter[#1]{#2}[][]处理
\def\BUPT@@@chapter[#1]#2[#3]{%
  \@ifnextchar [ % ]
  {\BUPT@@@@chapter[#1]{#2}[#3]} % 如果是\BUPT@chapter*[#1]{#2}[#3][#4]，
                                  % 按\BUPT@@@@chapter[#1]{#2}[#3]处理 
  {\BUPT@@@@chapter[#1]{#2}[#3][]}% 如果是\BUPT@chapter*[#1]{#2}[#3]
                                  % 按\BUPT@@@@chapter[#1]{#2}[#3][]处理 
}
\def\BUPT@@@@chapter[#1]#2[#3][#4]{%
  % \if@openright\cleardoublepage\else\clearpage\fi
  \cleardoublepage              % 中文摘要从奇数也开始
  \phantomsection%
%  \thispagestyle{BUPT@headings}%
  \def\@tmpa{#1}               % <tocline>
  \def\@tmpb{#3}               % <titlesize>
  \def\@tmpc{#4}               % <prefix>
  \ifx\@tmpa\@empty
    \pdfbookmark[0]{#2}{\expandafter\@gobble\string#2}
  \else
    \addcontentsline{toc}{chapter}{#1}
  \fi
  \ifx\@tmpc\@empty
    \def\BUPT@preschapter{}
  \else
    \def\BUPT@preschapter{%
      \par{%
        \sanhao[1]\hei
        \begin{center}
          {#4}
        \end{center}
      }
    }
  \fi
  \chapter*{#2}
%  \global\@topnum\z@%
%  \@afterindenttrue%
  %% the following is \@schapter}
  %%% the following is \@maskschapterhead#1
%  \vspace*{20bp}%
%  {\parindent \z@ \centering
%    \hei\csname BUPT@title@font\endcsname
%    \ifx\tmpb\@empty
%      \sanhao[1]
%    \else
%      {#3}
%    \fi
%    \interlinepenalty\@M
%    \textbf{#2}\par\nobreak
%    \vskip 24bp}
  %%% end of \@makeschapterhead#1
%  \@afterheading
  %% end of \@schapter
%  \ifx\@tmpb\@empty
  \@mkboth{#2}{#2}
%  \else
%  \@mkboth{#3}{#3}
%  \fi}
}

%% 一级节标题
\renewcommand\section{\@startsection {section}{1}{\z@}%
  {-24bp \@plus -1ex \@minus -.2ex}%
  {6bp \@plus .2ex}%
  {\hei\bfseries\csname BUPT@title@font\endcsname\sihao[1.429]}}
%% 二级节标题
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {-16bp \@plus -1ex \@minus -.2ex}%
  {6bp \@plus .2ex}%
  {\hei\bfseries\csname BUPT@title@font\endcsname\xiaosi[1.538]}}
%% 三级节标题
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {-16bp \@plus -1ex \@minus -.2ex}%
  {6bp \@plus .2ex}%
  {\song\csname BUPT@title@font\endcsname\xiaosi[1.667]}}

%% 目录格式
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}
\renewcommand\tableofcontents{%
  \BUPT@chapter*[]{\contentsname}
  \normalsize\@starttoc{toc}}
\def\BUPT@toc@font{\bfseries}%sffamily
%\def\@pnumwidth{2em} % 这个参数没用了
\def\@tocrmarg{2em}
\def\@dotsep{1} % 目录点间的距离
\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
  \vskip \z@ \@plus.2\p@
  {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
    \parindent #2\relax\@afterindenttrue
    \interlinepenalty\@M
    \leavevmode
    \@tempdima #3\relax
    \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
    {\csname BUPT@toc@font\endcsname #4}\nobreak
    \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
    \nobreak{\normalfont \normalcolor #5}%
    \par}%
  \fi}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
  \addpenalty{-\@highpenalty}%
  \vskip 4bp \@plus\p@
  \setlength\@tempdima{4em}%
  \begingroup
  \parindent \z@ \rightskip \@pnumwidth
  \parfillskip -\@pnumwidth
  \leavevmode
  \advance\leftskip\@tempdima
  \hskip -\leftskip
  {\hei\csname BUPT@toc@font\endcsname #1} % numberline is called here, and it use @tempdima
  \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
  \nobreak{\normalfont \normalcolor #2}\par
  \penalty\@highpenalty
  \endgroup
  \fi}
\renewcommand*\l@section{\@dottedtocline{1}{1.2em}{2.1em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{2em}{3em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{3.5em}{3.8em}}

%% 字距
\newcommand*{\ziju}[1]{\renewcommand{\CJKglue}{\hskip #1}}
%% 破折号
\newcommand{\pozhehao}{\kern0.3ex\rule[0.8ex]{2em}{0.1ex}\kern0.3ex}
%% 关键字间隔
\newcommand{\keyspace}{\hspace{2em}}
%%% 封面和封底
\newcommand\BUPT@define@term[2][]{%
  \def\@tempa{#1}
  \ifx\@tempa\@empty
  \def\BUPT@def{\expandafter\gdef}
  \else
  \def\BUPT@def{\long\expandafter\gdef}
  \fi
  \BUPT@def\csname #2\endcsname##1{%
    \BUPT@def\csname BUPT@#2\endcsname{##1}}
  \csname #2\endcsname{}
}
%% 封面、摘要、版权、致谢格式定义
%%% 文献保密等级 GB/T 7156-2003
\BUPT@define@term{preschapter}
\BUPT@define@term{schapterformat}
\BUPT@define@term{covertitle}
\BUPT@define@term{ctitle}              % 中文题目
\BUPT@define@term{cdegree}             % 中文学位名称
\newcommand\cdepartment[2][]{%
  \def\BUPT@cdepartment@short{#1}
  \def\BUPT@cdepartment{#2}}     % 中文院系名称
%\def\caffil{\cdepartment} % for compatibility
\def\BUPT@cdepartment@short{}    % 中文院系名称（短）
\def\BUPT@cdepartment{}
\BUPT@define@term{cmajor}        % 中文专业名称
%  \def\csubject{\cmajor} % for compatibility
\BUPT@define@term{cauthor}       % 中文作者姓名
\BUPT@define@term{csupervisor}   % 中文导师姓名
\BUPT@define@term{cassosupervisor}
\BUPT@define@term{ccosupervisor}
\BUPT@define@term{cdate}
\BUPT@define@term[long]{cabstract}
\BUPT@define@term{ckeywords}
\BUPT@define@term{etitle}
\BUPT@define@term{edegree}
\BUPT@define@term{edepartment}
\BUPT@define@term{studentnumlabel}
\BUPT@define@term{studentnum}
% \def\eaffil{\edepartment} % for compability
\BUPT@define@term{emajor}
% \def\esubject{\emajor} % for compability
\BUPT@define@term{eauthor}
\BUPT@define@term{esupervisor}
\BUPT@define@term{eassosupervisor}
\BUPT@define@term{ecosupervisor}
\BUPT@define@term{edate}
\BUPT@define@term[long]{eabstract}
\BUPT@define@term{ekeywords}
\BUPT@define@term{cauthorlabel}
\BUPT@define@term{cmajorlabel}
\BUPT@define@term{csupervisorlabel}
\BUPT@define@term{cdepartmentlabel}
\BUPT@define@term{ctitlelabel}
\BUPT@define@term{secretperiod}

\def\BUPT@preschapter{}
\def\BUPT@schapterformat{}
%% 封面
\newcommand{\BUPT@first@titlepage}{
% \begin{center}
  \vspace*{-1.3cm}
  % 密级与保密期限
  \parbox[b]{\textwidth}{%
    \sihao
    \BUPT@secretlvl@caption\BUPT@title@sep\BUPT@secretlvl@value
    \ifBUPT@secretlvl@open
      \relax
    \else
      \qquad\BUPT@secretperiod@caption\BUPT@title@sep\BUPT@secretperiod
    \fi
  }
  \parbox[t]{\textwidth}{%
    \begin{center}
      % 手写体校名
      \includegraphics[width=12cm]{buptname}\par
      \covertitlesize[1.0]{\hei\BUPT@covertitle}\par
      \vspace*{10.5bp}
      % 校徽
      \includegraphics[width=3.5cm]{buptlogo}
    \end{center}
  }
  \vspace*{26bp}
  % 论文题目
  \parbox[t]{\textwidth}{
    \renewcommand{\baselinestretch}{1.5}
    \xiaoer[1]\song
    \begin{center}
      \begin{tabular}{@{}l@{}c@{}p{86mm}@{}}
        \BUPT@ctitlelabel & \BUPT@title@sep & {%
          \begin{minipage}[t]{86mm}
            \centering\BUPT@ctitle
          \end{minipage}
        }
      \end{tabular}
    \end{center}
  }
  % 作者信息
  \parbox{\textwidth}{%
    {\sihao[1.24]
      \begin{center}
        \setlength{\extrarowheight}{0pt}
        \setlength{\arrayrulewidth}{0.45mm}
        \begin{tabular}{@{}p{1.96cm}@{}c@{}l@{}p{4.2cm}}
          \BUPT@studentnumlabel & \BUPT@title@sep 
          & {\hfill\BUPT@studentnum\hfill} \\ % 学号
          [-3pt] \cline{3-3} \\
          \BUPT@cauthorlabel & \BUPT@title@sep 
          & {\hfill\BUPT@cauthor\hfill} \\ % 作者
          [-3pt] \cline{3-3} \\
          \BUPT@cmajorlabel & \BUPT@title@sep 
          & {\hfill\BUPT@cmajor\hfill} \\ % 专业
          [-3pt] \cline{3-3} \\
          \BUPT@csupervisorlabel & \BUPT@title@sep 
          & {\hfill\BUPT@csupervisor\hfill} \\ % 导师
          [-3pt] \cline{3-3} \\
          \BUPT@cdepartmentlabel & \BUPT@title@sep 
          & {\hfill\BUPT@cdepartment\hfill} \\ % 学院
          [-2pt] \cline{3-3} \\
        \end{tabular}
      \end{center}
    }
  }
  % 中文日期
  \begin{center}
    {\sihao[1.0] \song \BUPT@cdate}
  \end{center}
} % end of titlepage

\newcommand{\BUPT@doctor@engcover}{%
  \begin{center}
    \vspace*{0.2cm}
    \parbox[t][5.2cm][t]{\paperwidth-7.2cm}{
      \renewcommand{\baselinestretch}{1.5}
      \begin{center}
        \erhao[1.1] \textbf{\textsf{\BUPT@etitle}}
      \end{center}}
    \parbox[t][5.8cm][t]{\paperwidth-7.2cm}{
      \renewcommand{\baselinestretch}{1.3}
      \begin{center}
        \sanhao Dissertation Submitted to\\
        \textbf{Tsinghua University}\\
        in partial fulfillment of the requirement\\
        for the degree of\\
        \textbf{\textsf{\BUPT@edegree}}
      \end{center}}
    \parbox[t][3.6cm][b]{\paperwidth-7.2cm}{
      \renewcommand{\baselinestretch}{1.3}
      \begin{center}{
          \sanhao \textsf{by\\[3bp]
            \textbf{\BUPT@eauthor\\
              (~\BUPT@emajor~)}}}
      \end{center}}
    \par\vspace{0.9cm}
    \parbox[t][2.1cm][t]{\paperwidth-7.2cm}{
      \renewcommand{\baselinestretch}{1.2}\xiaosan\centering
      \begin{tabular}{rl}
        Dissertation Supervisor : & \BUPT@esupervisor\\
        \ifx\BUPT@eassosupervisor\@empty
        \else Associate Supervisor : & \BUPT@eassosupervisor\\
        \fi
      \end{tabular}}
    \parbox[t][2cm][b]{\paperwidth-7.2cm}{
      \begin{center}
        \sanhao \textbf{\textsf{\BUPT@edate}}
      \end{center}}
  \end{center}}

\newcommand\BUPT@underline[2][6em]{%
  \hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt%
}
%% 封面
\newcommand{\makecover}{
  \phantomsection
  \pdfbookmark[-1]{\BUPT@ctitle}{ctitle}
  \normalsize%
  \begin{titlepage}
    \BUPT@first@titlepage
    \cleardoublepage
%    \BUPT@doctor@engcover
    \BUPT@makedeclauth          % 创新性声明与授权说明页
  \end{titlepage}
  \cleardoublepage
  \normalsize
  \BUPT@makeabstract
  \let\@tabular\BUPT@tabular}
%% 生成中英文摘要页
\newcommand{\BUPT@makeabstract}{%
  \pagestyle{BUPT@headings}     % 使用带页眉的页面
  \pagenumbering{Roman}         % 页码使用大写罗马数字
  % 中文摘要
  \BUPT@chapter*[]%
  {\cabstract@caption}%
  [\xiaosan\hei]%
  [\centering\sanhao\hei\BUPT@ctitle] % 目录不包含摘要
  {
    \sihao[1.5]
    \par{
      \CJKindent
      \song\BUPT@cabstract
    }\par
    \vspace*{12bp}
    \setbox0=\hbox{{\hei \BUPT@ckeywords@title}}
    \noindent\hangindent\wd0\hangafter1\box0\BUPT@ckeywords
  }
  % 英文摘要
  \BUPT@chapter*[]%
  {\eabstractname} % no tocline
  [\xiaosan]
  [\centering\sanhao\textbf{\MakeUppercase\BUPT@etitle}]
  {    
    \sihao[1.5]
    \par{%
      %\setlength{\parindent}{2\parindent}
      \CJKindent
      \BUPT@eabstract
%      \setlength{\parindent}{.5\parindent}
    }\par
    \vspace{24bp}
    \setbox0=\hbox{\textbf{KEY WORDS:\enskip}}
    \noindent\hangindent\wd0\hangafter1\box0\BUPT@ekeywords
  }
}
%% 攻读学位期间发表的学术论文目录
\newenvironment{tableofpublications}[1]{
  \cleardoublepage       % 从奇数页开始
  % [<tocline>]{<title>}[<titlesize>][<prefix>]
  \BUPT@chapter*[\BUPT@tableofpublications@name]{\BUPT@tableofpublications@name} % 学术论文目录标题
  \nobibliography{IEEEabrv,#1}
  \begin{enumerate}[{[}1{]}]
}
{
  \end{enumerate}
}

%% 符号说明
\newenvironment{listofnotations}[1][2.5cm]{
  \BUPT@chapter*[]{\BUPT@listofnotations@name} % 不入目录
  \noindent\begin{list}{}%
    {\vskip-30bp\xiaosi[1.6]
      \renewcommand\makelabel[1]{##1\hfil}
      \setlength{\labelwidth}{#1}  % 标签盒子宽度
      \setlength{\labelsep}{0.5cm} % 标签与列表文本距离
      \setlength{\itemindent}{0cm} % 标签缩进量
      \setlength{\leftmargin}{\labelwidth+\labelsep} %×ó±ß½ç
      \setlength{\rightmargin}{0cm}
      \setlength{\parsep}{0cm} % 段落间距
      \setlength{\itemsep}{0cm} % 
      \setlength{\listparindent}{0cm} % 段落缩进量
      \setlength{\topsep}{0pt} % 
    }}{\end{list}}

%%% 参考文献表格式
\bibpunct{[}{]}{,}{s}{}{,}
\renewcommand\NAT@citesuper[3]{\ifNAT@swa
\unskip\kern\p@\textsuperscript{\NAT@@open #1\NAT@@close}%
   \if*#3*\else\ (#3)\fi\else #1\fi\endgroup}
\DeclareRobustCommand\onlinecite{\@onlinecite}
\def\@onlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}
% \renewenvironment{thebibliography}[1]{%
%   \ifBUPT@sectbib
%   \bibsection%section*{\bibname}%
%   \else
%   \BUPT@chapter*{\bibname}%
%   \fi
%    \wuhao[1.5]
%    \list{\@biblabel{\@arabic\c@enumiv}}%
%         {\renewcommand{\makelabel}[1]{##1\hfill}
%          \settowidth\labelwidth{1.1cm}
%          \setlength{\labelsep}{0.6em}
%          \setlength{\itemindent}{0pt}
%          \setlength{\leftmargin}{\labelwidth+\labelsep}
%          \addtolength{\itemsep}{-0.7em}
%          \usecounter{enumiv}%
%          \let\p@enumiv\@empty
%          \renewcommand\theenumiv{\@arabic\c@enumiv}}%
%     \sloppy
%     \clubpenalty4000
%     \@clubpenalty \clubpenalty
%     \widowpenalty4000%
%     \interlinepenalty4000%
%     \sfcode`\.\@m}
%    {\def\@noitemerr
%      {\@latex@warning{Empty `thebibliography' environment}}%
%     \endlist}

%% 附录
\let\BUPT@appendix\appendix
\renewenvironment{appendix}{%
  \BUPT@appendix
  \gdef\@chapapp{\appendixname~\thechapter}
  %\renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter-\fi\@arabic\c@equation}
}{}

%% 缩略词表
\newenvironment{listofacronyms}[1][2.5cm]{
%   \BUPT@chapter*[]{\BUPT@listofacronyms@name} % 不入目录
  \noindent\begin{list}{}%
    {\vskip-30bp\xiaosi[1.5]
      \renewcommand\makelabel[1]{##1\hfil}
      \setlength{\labelwidth}{#1}  % 标签盒子宽度
      \setlength{\labelsep}{0.5cm} % 标签与列表文本距离
      \setlength{\itemindent}{0cm} % 标签缩进量
      \setlength{\leftmargin}{\labelwidth+\labelsep} %×ó±ß½ç
      \setlength{\rightmargin}{0cm}
      \setlength{\parsep}{0cm} % 段落间距
      \setlength{\itemsep}{0cm} % 
      \setlength{\listparindent}{0cm} % 段落缩进量
      \setlength{\topsep}{0pt} % 
    }}{\end{list}}

\newenvironment{denotation}[1][2.5cm]{
  \BUPT@chapter*[]{\BUPT@denotation@name} % no tocline
  \noindent\begin{list}{}%
    {\vskip-30bp\xiaosi[1.6]
      \renewcommand\makelabel[1]{##1\hfil}
      \setlength{\labelwidth}{#1}  % 标签盒子宽度
      \setlength{\labelsep}{0.5cm} % 标签与列表文本距离
      \setlength{\itemindent}{0cm} % 标签缩进量
      \setlength{\leftmargin}{\labelwidth+\labelsep} %×ó±ß½ç
      \setlength{\rightmargin}{0cm}
      \setlength{\parsep}{0cm} %¶ÎÂä¼ä¾à
      \setlength{\itemsep}{0cm} %±êÇ©¼ä¾à
      \setlength{\listparindent}{0cm} %¶ÎÂäËõ½øÁ¿
      \setlength{\topsep}{0pt} %±êÇ©ÓëÉÏÎÄµÄ¼ä¾à
    }}{\end{list}}

%% 致谢
\newenvironment{acknowledgement}{%
  \cleardoublepage               % 从奇数页开始
  \BUPT@chapter*[\BUPT@ackname]{\BUPT@ackname}[\BUPT@ackname]
}
{%
%   \par\vfill%
%   \noindent
%   { \setlength{\unitlength}{0.1\textwidth}
%     \begin{picture}(10, 0.1)
%       \multiput(0,0)(1, 0){10}{\rule{0.8\unitlength}{1.2pt}}
%       \multiput(0,0.08)(1, 0){10}{\rule{0.8\unitlength}{1.2pt}}
%     \end{picture}
%   }
%   %% 声明
%   \parbox[t][4cm][c]{\textwidth}{{\sanhao\hei\centerline{\BUPT@declarename}}}
%   \par{\xiaosi\parindent2em\BUPT@declaretext}\vskip2cm
%   { \xiaosi\hfill\BUPT@signature\BUPT@underline[2.5cm]\relax%
%     \BUPT@backdate\BUPT@underline[2.5cm]\relax
%   }%
}
% 独创性声明与授权说明
\newcommand{\BUPT@declaration}{%
  \begin{center}
    \sihao[1.5]\hei\BUPT@declaration@title
  \end{center}
  \par{%
    \parindent\CJKtwospaces\BUPT@declaration@body
  }
  \vskip1.2cm
  \par{%
    \parindent\CJKtwospaces
    \BUPT@authorsig@caption\BUPT@underline[38mm]\relax
    \qquad
    \BUPT@date@caption\BUPT@underline[38mm]\relax
  }%
}
\newcommand{\BUPT@authorization}{%
  \begin{center}
    \sihao[1.5]\hei\BUPT@authorization@title
  \end{center}
  \par{%
    \parindent\CJKtwospaces\BUPT@authorization@body
  }
  \vskip1.2cm
  \par{%
    \parindent\CJKtwospaces
    \BUPT@authorsig@caption\BUPT@underline[38mm]\relax
    \qquad
    \BUPT@date@caption\BUPT@underline[38mm]\relax
  }%
  \vskip1cm
  \par{%
    \parindent\CJKtwospaces
    \BUPT@supervisorsig@caption\BUPT@underline[38mm]\relax
    \qquad
    \BUPT@date@caption\BUPT@underline[38mm]\relax
  }%
}
% 生成声明与授权页
\newcommand{\BUPT@makedeclauth}{%
  \cleardoublepage
  \vfill
  \BUPT@declaration
  \vfill
  \BUPT@authorization
  \vfill
}
%% 索引
\long\def\@caption#1[#2]#3{%
  \par
  \addcontentsline{\csname ext@#1\endcsname}{#1}%
  { \protect\numberline{\csname #1name\endcsname\hskip0.5em\csname the#1\endcsname}%
    {\ignorespaces #2}
  }%
  \begingroup
  \@parboxrestore
  \if@minipage
  \@setminipage
  \fi
  \normalsize
  \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup
}
\def\BUPT@listof#1#2{%
  \@ifstar
  {\BUPT@chapter*[]{#1}\@starttoc{#2}}
  {\BUPT@chapter*{#1}\@starttoc{#2}}
}
\renewcommand\listoffigures{\BUPT@listof{\listfigurename}{lof}}
\renewcommand*\l@figure{\@dottedtocline{1}{0em}{4em}}
\renewcommand\listoftables{\BUPT@listof{\listtablename}{lot}}
\let\l@table\l@figure
\def\equcaption#1{%
  \addcontentsline{loe}{equation}%
  {\protect\numberline{\equationname\hskip0.5em #1}}}
\newcommand\listofequations{\BUPT@listof{\listequationname}{loe}}
\newcommand*\l@equation{\@dottedtocline{1}{0em}{4.2em}}
  
%% 导言区支持中文
\def\BUPT@active@cjk{
  % Activate all >128 characters.
  \count@=127
  \@whilenum\count@<255 \do{%
    \advance\count@ by 1
    \lccode`\~=\count@
    \catcode\count@=\active
    \lowercase{\def~{\kern1ex}}}}

%% 在文档模版结束后加载配置文件 BUPTthesis.cfg
\AtEndOfClass{\BUPT@active@cjk\input{BUPTthesis.cfg}}

%% 解决selectfont冲突
\def\BUPT@fixselectfont{%
  \DeclareRobustCommand{\selectfont}{%
    \ifx\f@linespread\baselinestretch 
    \else\set@fontsize\baselinestretch\f@size\f@baselineskip
    \fi
    \xdef\font@name{%
      \csname\curr@fontshape/\f@size\endcsname}%
    \pickup@font
    \font@name
    % CJK addition:
    \CJK@bold@false
    \csname \curr@fontshape\endcsname
    % everysel addition:
    \@EverySelectfont@EveryHook
    \@EverySelectfont@AtNextHook
    \gdef\@EverySelectfont@AtNextHook{}%
    % end additions
    \size@update
    \enc@update
  }
}

%% 启用CJK
\def\BUPT@beginCJK{%
  \BUPT@fixselectfont%
  \begin{CJK*}{UTF8}{song}%
    \sloppy\CJKindent\CJKtilde}
  \def\BUPT@endCJK{\clearpage\end{CJK*}}

\let\BUPT@begindocumenthook\@begindocumenthook
\let\BUPT@enddocumenthook\@enddocumenthook
\def\AtBeginDocument{\g@addto@macro\BUPT@begindocumenthook}
\def\AtEndDocument{\g@addto@macro\BUPT@enddocumenthook}
\def\@begindocumenthook{\BUPT@begindocumenthook\BUPT@beginCJK}
\def\@enddocumenthook{\BUPT@endCJK\BUPT@enddocumenthook}
\AtBeginDocument{\BUPT@item@space}

\newcommand{\upd}{\mathrm{d}}
\newcommand{\upj}{\mathrm{j}}
\newcommand{\upe}{\mathrm{e}}
\newcommand{\T}{\mathrm{T}}
\newcommand{\CT}{\mathrm{H}}
