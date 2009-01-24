%% BUPTThesis.bst
%%
%% 北京邮电大学研究生学位论文参考文献 BibTeX 样式
%% 
%% 项目主页：http://code.google.com/p/buptthesis/
%% 
%% 本样式基于 ThuThesis 修改而成，基本满足北京邮电大学研究生论文格式要求
%%
%% 作者：
%% 张煜 (email:dazzlezhang@gmail.com)
%%
%% 更新记录:
%% $LastChangedBy$
%% $LastChangedDate$
%% $LastChangedRevision$

ENTRY
  { address
    assignee
    author
    booktitle
    chapter
    day
    dayfiled
    edition
    editor
    howpublished
    institution
    journal
    key
    language
    month
    monthfiled
    nationality
    newsletter
    note
    number
    number2
    organization
    pages
    publisher
    refdate
    school
    series
    title
    translator
    type
    volume
    volume2
    year
    year2
    yearfiled
    url
  }
  {}
  { label }

INTEGERS { output.state before.all mid.sentence after.sentence after.block }

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

% 函数: 初始化状态常量
FUNCTION {init.state.consts}
{ #0 'before.all :=		%
  #1 'mid.sentence :=		%
  #2 'after.sentence :=		%
  #3 'after.block :=		%
}

STRINGS { s t thename }

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
    { add.period$ write$
      newline$
      "\newblock " write$
    }
    { output.state before.all =
        'write$
        { add.period$ " " * write$ }
      if$
    }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output.year}
{ 't :=
  number empty$
  volume empty$
  and
    { add.period$ write$ }
    { ", " * write$ }
  if$
  t
}

STRINGS {z}
FUNCTION {remove.dots}
{ 'z :=
  ""
  { z empty$ not}
  { z #1 #1 substring$
    z #2 global.max$ substring$ 'z :=
    duplicate$ "." = 'pop$
      { * }
    if$
  }
  while$
  %z
}

FUNCTION {bibinfo.check}
{ swap$
  duplicate$ missing$
    {
      pop$ pop$
      ""
    }
    { duplicate$ empty$
        {
          swap$ pop$
        }
        { swap$
          pop$
        }
      if$
    }
  if$
}

FUNCTION {format.note}
{
 note empty$
    { "" }
    { note #1 #1 substring$
      duplicate$ "{" =
        'skip$
        { output.state mid.sentence =
          { "l" }
          { "u" }
        if$
        change.case$
        }
      if$
      note #2 global.max$ substring$ * "note" bibinfo.check
    }
  if$
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem{" write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {fin.entry}
{ add.period$   
  write$
  %remove.dots
  newline$
}

% FUNCTION {fin.entry}
% { duplicate$ empty$
%     'pop$
%     'write$
%   if$
%   newline$
% }

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
    'skip$
    { after.sentence 'output.state := }
      if$
    }
  if$
}


FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}

FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "{\em " swap$ * "}" * }
  if$
}

INTEGERS { nameptr namesleft numnames lastnamecapitalized namelength charptr }

FUNCTION {bbl.etal}
{ "et~al." }

FUNCTION {bbl.cn.etal}
{ "等." }

FUNCTION {format.language}
{ language empty$
    'skip$
    'skip$
  if$
 }
FUNCTION {is.space}
{ chr.to.int$
  duplicate$ #32 =
    { pop$ #1 }
    { pop$ #0 }
  if$
}
FUNCTION {is.lower.char}
{
  chr.to.int$
  duplicate$ #96 >
    { #123 < 
	{ #1 }
	{ #0 }
      if$
    }
    { pop$ #0 }
  if$
}
FUNCTION {capitalize.last.name}
{ 
  'thename :=
%   % debug
%   "thename = " thename * warning$
%   % eod
  thename text.length$ 'namelength :=
%   % debug
%   "namelength = " namelength int.to.str$ * warning$
%   % eod
  #1 'charptr :=
  #0 'lastnamecapitalized :=
  ""

  { charptr #1 - namelength < 
%     % debug
%     duplicate$ int.to.str$ "( charptr + #1 > namelength ) == " swap$ * warning$ 
%     % eod
  }
  { 
%     % debug
%     "charptr = " charptr int.to.str$ * 
%     ", lastnamecapitalized = " * 
%     lastnamecapitalized int.to.str$ * warning$
%     % eod
    lastnamecapitalized #1 = 
      {	thename charptr namelength charptr - #1 + substring$ *
	namelength #1 + 'charptr := 
% 	% debug
% 	duplicate$ "top of the stack = " swap$ * warning$
% 	% eod
      }
      { thename charptr #1 substring$ 
% 	% debug
% 	duplicate$ "the char = " swap$ * warning$
% 	% eod
	duplicate$ is.lower.char 
% 	% debug
% 	duplicate$ int.to.str$ "is.lower.char = " swap$ * warning$
% 	  % eod
	  { "u" change.case$ * }
	  { duplicate$ is.space
% 	    % debug
% 	    duplicate$ int.to.str$ "is.space = " swap$ * warning$
% 	      % eod
	      { #1 'lastnamecapitalized :=
		*
	      }
	      { *
	      }
	    if$
	  }
	if$
% 	% debug
% 	duplicate$ "top of the stack = " swap$ * warning$
% 	% eod
	charptr #1 + 'charptr :=
      }
    if$
  }
  while$
}

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      %"{ff }{ll}"
      "{ll }{f}{, Jj}"    
      format.name$
      language empty$ 
	{ capitalize.last.name }
	'skip$
      if$
      %remove.dots
      %bibinfo bibinfo.check
      't :=
      nameptr #1 >
        {
          nameptr #3
          #1 + =
          numnames #3
          > and
            { "others" 't :=
              #1 'namesleft := }
            'skip$
          if$
          namesleft #1 >
            { ", " * t * }
            { numnames #2 >
              { "" * }
              'skip$
              if$
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              t "others" =
                {
                  language empty$
                    { ", " * bbl.etal * }
                    { language "Chinese" =
                       { ", " * bbl.cn.etal * }
                       'skip$
                      if$
                    }
                  if$
                }
                {
                  language empty$
                    { ", " * t * }
                    { language "Chinese" =
                       { ", " * t * }
                       'skip$                   
                     if$
                    }
                  if$
                } 
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.authors}
{ author empty$
    { "" }
    { author format.names remove.dots }
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    { editor format.names
%       editor num.names$ #1 >
%     { ", editors" * }
%     { ", editor" * }
%       if$
    }
  if$
}

FUNCTION {format.translators}
{ translator empty$
    { "" }
    { translator format.names
      ", 译" *
    }
  if$
}

FUNCTION {format.institution}
{ institution empty$
    { "" }
    { institution format.names }
  if$
}

FUNCTION {format.organization}
{ organization empty$
    { "" }
    { organization }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { title }
  if$
}

% 文献类型标志
FUNCTION {format.bib.type}
{
  % 取文献类型
  's :=
  "~["
  % 专利文献
  s "patent" =
    { "P" * }
    'skip$
  if$
  % 电子文献
  s "electronic" = 
    { "EB" * }
    'skip$
  if$
  % 电子文献载体
  howpublished empty$
    { "]" * }
    { howpublished "tape" =
	{ "/MT]" * }
	{ howpublished "disk" =
	    { "/DK]" * }
	    { howpublished "cd" = 
		{ "/CD]" * }
		{ howpublished "online" =
		    { "/OL]" * }
		    { "]" * }
		  if$
		}
	      if$
	    }
	  if$
	}
      if$
    }
  if$
}
% 格式化年月日``YYYY-MM-DD''
FUNCTION {format.year.month.day}
{ year "-" *
  month text.length$ #2 <
    { "0" * }
    'skip$
  if$
  month * "-" *
  day text.length$ #2 <
    { "0" * }
    'skip$
  if$
  day *
}
% patent的题名项: 
%   专利题名: 专利国别, 专利号~[文献类型标志]
FUNCTION {format.patent.title}
{ % 专利题名
  title empty$
    { "" }
    { title ": " * }
  if$
  % 专利国别, 专利号
  nationality empty$
    { % 专利国别为必备项
      "The nationality in " cite$ * " is missing." * warning$
    }
    { number empty$
      { % 专利号为必选项
	"The number in " cite$ * " is missing." * warning$
      }
      { % 产生``专利国别, 专利号''
	nationality * ", " * number *
      }
      if$
    }
  if$
  % 文献类型标志
  type$ format.bib.type *
}
% patent的出版项:
FUNCTION {format.patent.publication}
{
  format.year.month.day
  %% debug
  duplicate$ "End of format.patent.publication, top = " swap$ * warning$
  url empty$
    'skip$
    { refdate empty$
	{ "The refdate in " cite$ * " is missing." * warning$ }
	{ "~[" * refdate * "]" * }
      if$
    }
  if$
}
% electronic的主要责任者:
%   author 或 organization
FUNCTION {format.electronic.authors}
{
  author empty$
    { organization empty$
	{ " " }
	{ organization }
      if$
    }
    { format.authors }
  if$
}
% electronic的题名项:
%   题名: 其他题名信息~[文献类型标志]
FUNCTION {format.electronic.title}
{ % 题名: 其他题名信息
  title empty$
    { "" }
    { title }
  if$
  % 文献类型标志
  type$ format.bib.type *
}
% electronic的出版项
FUNCTION {format.electronic.publication}
{ % 出版地: 出版者
  address empty$
    { "" }
    { address 
      publisher empty$
	'skip$
	  { ": " * publisher * }
      if$
    }
  if$
  
  % 出版年
  year empty$
    'skip$
    { ", " * year * }
  if$

  % 更新或修改日期
  % To be added

  % 引用日期
  refdate empty$
    'skip$
    { "~[" * refdate * "]" * }
  if$
}

%% article的标题格式
FUNCTION {format.atitle}
{ title empty$
    { "" }
    { title 
      newsletter empty$
	{ "~[J" * }
	{ newsletter "yes" =
	    { "~[N" * }
	    { "~[J" * }
	  if$
	}
      if$
      url empty$
	{ "]" * }
	{ "/OL]" * }
      if$
    }
  if$
}
%% incollection的标题格式
FUNCTION {format.ictitle}
{ title empty$
    { "" }
    { title "~[M]~//~" * 
      editor format.names *
    }
  if$
}
%% inproceedings的标题格式
FUNCTION {format.iptitle}
{ title empty$
    { "" }
    { title "~[C]~//~" * 
      editor format.names *
    }
  if$
}

FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
    { t #1 #2 substring$ "--" = not
        { "--" *
          t #2 global.max$ substring$ 't :=
        }
        {   { t #1 #1 substring$ "-" = }
        { "-" *
          t #2 global.max$ substring$ 't :=
        }
          while$
        }
      if$
    }
    { t #1 #1 substring$ *
      t #2 global.max$ substring$ 't :=
    }
      if$
    }
  while$
}

% 年，卷（期）
FUNCTION {format.year.volume.number}
{
  %% debug
  "in format.year.volume.number" warning$
  %% eod
  year empty$
    { "" }
    { year 
      volume empty$
	'skip$
	{ ", " * volume * }
      if$
      number empty$
	'skip$
	{ "(" * number * ")" * }
      if$ 
      year2 empty$
	'skip$
	{ "--" * 
	  year2 "now" =
	    'skip$
	    { year2 * 
	      volume2 empty$
		'skip$
		{ ", " * volume2 * }
	      if$
	      number2 empty$
		'skip$
		{ "(" * number2 * ")" * }
	      if$
	    }
	  if$
	}
      if$
    }
  if$
  duplicate$ warning$
}
%
FUNCTION {format.date}
{ year empty$
    { month empty$
	{ "" }
	{ "there's a month but no year in " cite$ * warning$
	  month
	}
      if$
    }
    { month empty$
	'year
	{ month ", " * year * }
      if$
    }
  if$
}
function {format.year.year}
{ year empty$
    'skip$
    { year "--" *
    year2 empty$
      'skip$
      { year2 "now" =
	  'skip$
	  { year2 * }
	if$
      }
    if$
    }
  if$
}

% 专著标题格式
FUNCTION {format.btitle}
{ title "~[M" * %emphasize
  url empty$
    { "]" * }
    { "/OL]" * }
  if$
}
% 连续出版物标题格式
FUNCTION {format.jtitle}
{ title "~[J" * %emphasize
  url empty$
    { "]" * }
    { "/OL]" * }
  if$
}
% 标题格式
FUNCTION {format.stitle}
{ title "~[S]" * %emphasize
}
% 论文集标题格式
FUNCTION {format.ptitle.volume}
{ title 
  volume empty$
    { "~[C]" }
    { ": " volume * "~[C]" * }
  if$ *
  %emphasize
}
FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { language empty$
	{ "volume" volume tie.or.space.connect }
	{ volume }
      if$
      series empty$
    'skip$
    { " of " * series emphasize * }
      if$
      "volume and number" number either.or.check
    }
  if$
}

FUNCTION {format.number.series}
{ volume empty$
    { number empty$
    { series field.or.null }
    { output.state mid.sentence =
        { "number" }
        { "Number" }
      if$
      number tie.or.space.connect
      series empty$
        { "there's a number but no series in " cite$ * warning$ }
        { " in " * series * }
      if$
    }
      if$
    }
    { "" }
  if$
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { language empty$
	{ output.state mid.sentence =
	    { edition "l" change.case$ " ed" * }
	    { edition "t" change.case$ " ed" * }
	  if$
	}
	{ output.state mid.sentence =
	    { edition }
	    { edition }
	  if$
	}
      if$
    }
  if$
}


FUNCTION {format.url}
{ url empty$
    { "" }
    { new.block " {\url{" url * "}}" * }
  if$
}


INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
    { #1 'multiresult := }
    { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
    { "" pages n.dashify tie.or.space.connect }
    { "" pages tie.or.space.connect }
      if$
    }
  if$
}

FUNCTION {format.vol.num.pages}
{ volume field.or.null
  number empty$
    'skip$
    { "(" number * ")" * *
      volume empty$
	{ newsletter empty$
	    { "there's a number but no volume in " cite$ * warning$ }
	    'skip$
	  if$
	}
	'skip$
      if$
    }
  if$
  pages empty$
    'skip$
    { duplicate$ empty$
	{ pop$ format.pages }
	{ ":" * pages n.dashify * }
      if$
    }
  if$
  % duplicate$ "top of stack = " swap$ * warning$
  url empty$
    'skip$
    { refdate empty$ 
	{ "there's an url but no refdate  in " cite$ * warning$ }
	{ %duplicate$ "url and refdate is not empty, top of stack = " swap$ * warning$
	  "~[" * refdate * "]" * 
	}
      if$
      %duplicate$ "top of stack = " swap$ * warning$
    }
  if$
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    { "" }
    { type empty$
      { "chapter" }
      { type "l" change.case$ }
    if$
    chapter tie.or.space.connect
    pages empty$
      'skip$
      { ", " * format.pages * }
    if$
    }
  if$
}

FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
	{ language empty$
	    { " " booktitle * }
	    %        { "Proceedings of " booktitle * }
            { " " booktitle * }
	  if$
	}
	{ language empty$
%            { "In: " format.editors * ", Proceedings of " * booktitle * }
	    { " " booktitle * }
            { " " booktitle * }
	  if$
	}
      if$
    }
  if$
}

FUNCTION {format.in.ed.booktitle.volume}
{ booktitle empty$
    { "" }
    { editor empty$
	{ language empty$
%            { "Proceedings of " booktitle * }
	    { " " booktitle * }
            { " " booktitle * }
	  if$
	}
	{ language empty$
          %{ "In: " format.editors * ", Proceedings of " * booktitle * }
	    { " " booktitle * }
            { " " booktitle * }
	  if$
	}
      if$
      %% volume
      volume empty$
	'skip$
	{ language empty$
	    { "Vol." * volume * }
	    { ": 第" * volume * "卷" * }
	  if$
	}
      if$
    }  
  if$
}

FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type "t" change.case$
    }
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { "Technical Report" }
    'type
  if$
  number empty$
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}

FUNCTION {format.article.crossref}
{ key empty$
    { journal empty$
    { "need key or journal for " cite$ * " to crossref " * crossref *
      warning$
      ""
    }
    { "In {\em " journal * "\/}" * }
      if$
    }
    { "In " key * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.crossref.editor}
{ editor #1 "{ll }{f{~}}" format.name$
  editor num.names$ duplicate$
  #2 >
    { pop$ " et~al." * }
    { #2 <
    'skip$
    { editor #2 "{ll }{f{~}}" format.name$ "others" =
        { " et~al." * }
        { " and " * editor #2 "{ll }{f{~}}" format.name$ * }
      if$
    }
      if$
    }
  if$
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      "In "
    }
    { "Volume" volume tie.or.space.connect
      " of " *
    }
  if$
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
    { series empty$
        { "need editor, key, or series for " cite$ * " to crossref " *
          crossref * warning$
          "" *
        }
        { "{\em " * series * "\/}" * }
      if$
    }
    { key * }
      if$
    }
    { format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.incoll.inproc.crossref}
{ editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
    { booktitle empty$
        { "need editor, key, or booktitle for " cite$ * " to crossref " *
          crossref * warning$
          ""
        }
        { "In {\em " booktitle * "\/}" * }
      if$
    }
    { "In " key * }
      if$
    }
    { "In " format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.address.publisher}
{ address empty$
    { publisher empty$
    { "" }
    { "there's a publisher but no address in " cite$ * warning$
      publisher
    }
      if$
    }
    { publisher empty$
    'address
    { address ": " * publisher * }
      if$
    }
  if$
}

FUNCTION {format.address.school}
{ address empty$
    { school empty$
    { "" }
    { "there's a school but no address in " cite$ * warning$
      school
    }
      if$
    }
    { school empty$
    'address
    { address ": " * school * }
      if$
    }
  if$
}


FUNCTION {format.title.type}
{ title empty$
    { type empty$
        { "" }
        { "there's a type but no title in " cite$ * warning$
          type
        }
      if$
    }
    { type empty$
        'title
        { title ": " * type * }
      if$
    }
  if$
}

FUNCTION {book} { output.bibitem
  author empty$
    { format.editors "author and editor" output.check }
    { format.authors output.nonnull
      crossref missing$
	{ "author and editor" editor either.or.check }
	'skip$
      if$
    }
  if$
  new.block
  format.btitle "title" output.check
  new.block
%  duplicate$ "after format.btitle :" swap$ * warning$
  translator empty$
    'skip$
    { format.translators output.nonnull }
  if$
  new.block
  format.edition output
  crossref missing$
    { format.bvolume output
      new.block
      format.number.series output
      new.sentence
      format.address.publisher output
    }
    { new.block
      format.book.crossref output.nonnull
    }
  if$
  format.date "year" output.check
  new.block
  format.url output
  new.block
  note output
  fin.entry
}

% 专利文献
FUNCTION {patent}
{
  % 开始参考文献条目
  output.bibitem
  % 专利申请者或所有者
  format.authors output.nonnull
  % 题名项
  new.block
  format.patent.title output
  % 出版项
  new.block
  format.patent.publication output
  % 获取和访问路径
  new.block
  format.url output
  % 结束参考文献条目
  fin.entry
}

% 电子文献
FUNCTION {electronic}
{
  % 开始参考文献条目
  output.bibitem

  % 主要责任者
  format.electronic.authors output
  % 题名项
  new.block
  format.electronic.title output
  % 出版项
  new.block
  format.electronic.publication output
  % 获取和访问路径
  new.block
  format.url output

  % 结束参考文献条目
  fin.entry
}

FUNCTION {periodical} { 
  output.bibitem
  editor empty$
    { organization empty$
	{ " " output } 
	{ format.organization output.nonnull }
      if$
    }
    { format.editors "author and editor" output.check }
  if$
  new.block
  format.jtitle "title" output.check
  new.block
  format.year.volume.number output
  %format.edition output
  crossref missing$
    { % format.bvolume output
%       new.block
%       format.number.series output
      new.sentence
      format.address.publisher output
    }
    { new.block
      format.book.crossref output.nonnull
    }
  if$
  format.year.year output.nonnull
  new.block
  format.url output
  new.block
  note output
  fin.entry
}

FUNCTION {standard} { output.bibitem
  organization empty$
    { format.institution "organization and institution" output.check }
    { format.organization output.nonnull
      crossref missing$
	{ "organization and institution" institution either.or.check }
	'skip$
      if$
    }
  if$
  new.block
  format.stitle "title" output.check
  new.block
  translator empty$
    'skip$
    { format.translators output.nonnull }
  if$
  crossref missing$
    { format.bvolume output
      new.block
      format.number.series output
      new.sentence
      format.address.publisher output
    }
    { new.block
      format.book.crossref output.nonnull
    }
  if$
  format.edition output
  format.date "year" output.check
  new.block
  note output
  fin.entry
}

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.atitle "title" output.check
  new.block
  crossref missing$
    { %journal emphasize "journal" output.check
      journal "journal" output.check
      %format.date "year" output.check
      %new.block
      year 
      volume empty$
	'skip$
	{ ", " * }
      if$
      format.vol.num.pages * output.year
    }
    { format.article.crossref output.nonnull
      format.pages output
    }
  if$
  new.block
  format.url output
  new.block
  format.note output  
  fin.entry
}

FUNCTION {booklet}
{ output.bibitem
  format.authors output
  new.block
  format.title "title" output.check
  howpublished address new.block.checkb
  howpublished output
  address output
  format.date output
  new.block
  note output
  fin.entry
}

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check }
    { format.authors output.nonnull
      crossref missing$
    { "author and editor" editor either.or.check }
    'skip$
      if$
    }
  if$
  new.block
  format.btitle "title" output.check
  crossref missing$
    { format.bvolume output
      %format.chapter.pages "chapter and pages" output.check
      new.block
      format.number.series output
      new.sentence
      format.address.publisher output
      %publisher "publisher" output.check
%      address output
    }
    { format.chapter.pages "chapter and pages" output.check
      new.block
      format.book.crossref output.nonnull
    }
  if$
  format.edition output
%  format.date output 
%  new.block
%  format.pages output
  format.date ":" * format.pages * output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.ictitle "title" output.check
  new.block
  crossref missing$
    { %format.in.ed.booktitle "booktitle" output.check
      %format.bvolume output
      format.in.ed.booktitle.volume "booktitle" output.check
      format.number.series output
      format.chapter.pages output
      new.sentence
%      publisher "publisher" output.check
%      address output
      format.address.publisher output
      format.edition output
      format.date ":" * format.pages * output
      %format.date "year" output.check
    }
    { format.incoll.inproc.crossref output.nonnull
      format.chapter.pages output
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.iptitle "title" output.check
  new.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      %format.bvolume output
      %format.number.series output
      %format.pages output
      address empty$
	{ organization publisher new.sentence.checkb
	  organization output
	  publisher output
	  %format.date "year" output.check
	  %year output
	  format.date ":" * format.pages * output
	}
	{ %address output.nonnull
	  format.address.publisher output  
	  %format.date "year" output.check
	  % year output
	  format.date ":" * format.pages * output
	  new.sentence
	  organization output
	  %publisher output
	}
      if$
      new.block
      % pages output
      %remove.dots
    }
    { format.incoll.inproc.crossref output.nonnull
      format.pages output
    }
  if$
  new.block
  note output  
  fin.entry
}

FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem
  author empty$
    { organization empty$
    'skip$
    { organization output.nonnull
      address output
    }
      if$
    }
    { format.authors output.nonnull }
  if$
  new.block
  format.btitle "title" output.check
  author empty$
    { organization empty$
    { address new.block.checka
      address output
    }
    'skip$
      if$
    }
    { organization address new.block.checkb
      organization output
      address output
    }
  if$
  format.edition output
  format.date output
  new.block
  note output
  fin.entry
}

FUNCTION {masterthesis.type}
{ language empty$
    { "[Master Thesis]" }
    { "[硕士学位论文]" }
  if$
}

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" add.period$ output.check
  new.block
  format.title remove.dots ": " * masterthesis.type * output
  new.block
  format.address.school output
  %format.madd "address" output.check
  %school "school" output.check  
  format.date "year" output.check
  new.block
  note output
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
  title howpublished new.block.checkb
  format.title output
  howpublished new.block.checka
  howpublished output
  format.date output
  format.url output
  new.block
  note output
  fin.entry
  empty.misc.check
}

FUNCTION {phdthesis.type}
{ "~[D]" 
% language empty$
%     { "[PhD Thesis]" }
%     { "[博士学位论文]" }
%   if$ 
}

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" add.period$ output.check
  new.block
  format.title remove.dots " " * phdthesis.type * output
  new.block
  format.address.school output
  %address output
  %school "school" output.check  
  format.date "year" output.check
  new.block
  note output
  fin.entry
}

FUNCTION {proceedings}
{ output.bibitem
  editor empty$
    { organization output }
    { format.editors output.nonnull }
  if$
  new.block
  format.ptitle.volume "title" output.check
  % format.bvolume output
  format.number.series output
  new.sentence
  format.address.publisher output
  format.date "year" output.check
%   address empty$
%     { editor empty$
% 	{ publisher new.sentence.checka }
% 	{ organization publisher new.sentence.checkb
% 	  organization output
% 	}
%       if$
%       publisher output
%       format.date "year" output.check
%     }
%     { address output.nonnull
%       format.date "year" output.check
%       new.sentence
%       editor empty$
% 	'skip$
% 	{ organization output }
%       if$
%       publisher output
%     }
%   if$
  new.block
  note output
  fin.entry
}

FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  format.tr.number output.nonnull
  institution "institution" output.check
  address output
  format.date "year" output.check
  format.url output
  new.block
  note output
  fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  note "note" output.check
  format.date output
  fin.entry
}

FUNCTION {default.type} { misc }

MACRO {jan} {"January"}

MACRO {feb} {"February"}

MACRO {mar} {"March"}

MACRO {apr} {"April"}

MACRO {may} {"May"}

MACRO {jun} {"June"}

MACRO {jul} {"July"}

MACRO {aug} {"August"}

MACRO {sep} {"September"}

MACRO {oct} {"October"}

MACRO {nov} {"November"}

MACRO {dec} {"December"}

MACRO {acmcs} {"ACM Computing Surveys"}

MACRO {acta} {"Acta Informatica"}

MACRO {cacm} {"Communications of the ACM"}

MACRO {ibmjrd} {"IBM Journal of Research and Development"}

MACRO {ibmsj} {"IBM Systems Journal"}

MACRO {ieeese} {"IEEE Transactions on Software Engineering"}

MACRO {ieeetc} {"IEEE Transactions on Computers"}

MACRO {ieeetcad}
 {"IEEE Transactions on Computer-Aided Design of Integrated Circuits"}

MACRO {ipl} {"Information Processing Letters"}

MACRO {jacm} {"Journal of the ACM"}

MACRO {jcss} {"Journal of Computer and System Sciences"}

MACRO {scp} {"Science of Computer Programming"}

MACRO {sicomp} {"SIAM Journal on Computing"}

MACRO {tocs} {"ACM Transactions on Computer Systems"}

MACRO {tods} {"ACM Transactions on Database Systems"}

MACRO {tog} {"ACM Transactions on Graphics"}

MACRO {toms} {"ACM Transactions on Mathematical Software"}

MACRO {toois} {"ACM Transactions on Office Information Systems"}

MACRO {toplas} {"ACM Transactions on Programming Languages and Systems"}

MACRO {tcs} {"Theoretical Computer Science"}

%%%%%%%%%%
%% 主程序
%%%%%%%%%%

READ

STRINGS { longest.label }

INTEGERS { number.label longest.label.width }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #1 'number.label :=
  #0 'longest.label.width :=
}

FUNCTION {longest.label.pass}
{ number.label int.to.str$ 'label :=
  number.label #1 + 'number.label :=
  label width$ longest.label.width >
    { label 'longest.label :=
      label width$ 'longest.label.width :=
    }
    'skip$
  if$
}

% 初始化最长的标号
EXECUTE {initialize.longest.label}
% 处理最长的标号
ITERATE {longest.label.pass}

%
FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{"  longest.label  * "}" * write$ newline$
}

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}
