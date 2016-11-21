\NeedsTeXFormat{LaTeX2e}[1999/12/01]
%\ProvidesClass{Thesis}
%[2016/06/01 v1.2 A Thesis Template for Huazhong University of Science and Technology]

\RequirePackage{ifthen}
\RequirePackage{xkeyval}
  \gdef\Qiqi@Degree{none}
  \DeclareOptionX{degree}[none]{
    \ifthenelse
    { % if
      \equal{#1}{none}     \OR 
      \equal{#1}{fyp}      \OR 
      \equal{#1}{bachelor} \OR 
      \equal{#1}{master}   \OR 
      \equal{#1}{phd}
    }
    { % then
      \gdef\Qiqi@Degree{#1}
    }
    { % else
      \ClassError{Thesis}
      {Option degree can only be 'none', 'fyp', 'bachelor', 'master' or 'phd'}
      {Try to remove option degree^^J}
    }
  }
  \DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
  \ProcessOptionsX
  \LoadClass[12pt, a4paper, openany]{book}

\RequirePackage{anyfontsize} % This package is used to remove the warning "Font shape ... in size ... not available"
\RequirePackage{xeCJK}
  \setmainfont{Times New Roman}
  \setmonofont{Consolas}
  \setCJKmainfont[BoldFont = 黑体, ItalicFont = 楷体]{宋体}
  \setCJKmonofont{仿宋}
  \xeCJKsetup{CJKspace=false}

\RequirePackage{CJKfntef}
\RequirePackage{indentfirst}
  \setlength{\parindent}{2em}
\RequirePackage{ragged2e}
  \setlength{\parindent}{2em}
  \setlength{\parskip}{0pt plus 2pt minus 1pt}
  \linespread{1.2}

\RequirePackage{listings}
  \lstset{
    language   = TeX,
    basicstyle = \ttfamily
  }
\RequirePackage{amsmath, amssymb, amsfonts, wasysym, mathrsfs}
\RequirePackage[amsmath, amsthm, thmmarks, hyperref]{ntheorem}
\RequirePackage[bookmarks = true, pdfborder = {0 0 0}]{hyperref}
\RequirePackage[titles]{tocloft}
  \newskip\old@cftbeforechapskip
  \old@cftbeforechapskip\cftbeforechapskip
  \let\old@l@chapter\l@chapter
  \let\old@l@section\l@section
  \def\l@chapter#1#2{\old@l@chapter{#1}{#2}\cftbeforechapskip0pt}% set your value here
  \def\l@section#1#2{\old@l@section{#1}{#2}\cftbeforechapskip\old@cftbeforechapskip}

\RequirePackage{geometry}
  \geometry{
    top        =  1.2in,
    bottom     =  1.2in,
    left       =  1.0in,
    right      =  1.0in,
    headsep    =  0.2in,
    headheight = 15.0pt,
    nomarginpar,
    % showframe
  }
\RequirePackage{enumitem}
  \setenumerate[1]{itemsep = 0pt, partopsep = 0pt, parsep = \parskip, topsep = 5pt}
  \setitemize[1]  {itemsep = 0pt, partopsep = 0pt, parsep = \parskip, topsep = 5pt}
  \setitemize[2]  {itemsep = 0pt, partopsep = 0pt, parsep = \parskip, topsep = 5pt}
  \setdescription {itemsep = 0pt, partopsep = 0pt, parsep = \parskip, topsep = 5pt}

\RequirePackage{tcolorbox}
  \newtcbox{\Tag}[1][black!50]{
    on line,
    arc          = 4pt,
    colback      = black!75,
    colframe     = black!75,
    before upper = {\rule[-3pt]{0pt}{10pt}},
    boxrule      = 1pt,
    fontupper    = \color{white}\bf,
    boxsep       = 0pt,
    left         = 2pt,
    right        = 2pt,
    top          = 2pt,
    bottom       = 0pt
  }

\RequirePackage[toc, indexonlyfirst, section = chapter, acronym, nomain]{glossaries}
  \newglossary[var]{variable}{vai}{vao}{符号表}
  \newglossary[hid]{hide}{hii}{hio}{符号表}
  \makeglossaries

\RequirePackage{longtable, tabu}
\RequirePackage{zhnumber}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
  \newcommand\subsubsubsection{\@startsection{paragraph}{4}{\z@}
    {-3.5ex \@plus -1ex \@minus -.2ex}%
    {1.3ex \@plus.2ex}%
    {\bfseries\normalsize}}
  \newcommand\subsubsubsubsection{\@startsection{subparagraph}{5}{\z@}
    {-3.5ex \@plus -1ex \@minus -.2ex}%
    {2ex \@plus.2ex}%
    {\bfseries\normalsize}}
  \titleformat{\chapter}
    {
      \bfseries
      \centering
      \fontsize{18pt}{23.4pt}\selectfont
    }
    {  
      \zhnumber{\thechapter}
    }{1em}{}
  \titlespacing*{\chapter}{0pt}{18pt}{6pt}
  \titleformat*{\section}{\bfseries\fontsize{16pt}{20.8pt}\selectfont}
  \titlespacing*{\section}{0pt}{18pt}{6pt}
  \titleformat*{\subsection}{\bfseries\fontsize{14pt}{18.2pt}\selectfont}
  \titlespacing*{\subsection}{0pt}{12pt}{6pt}
  \titleformat*{\subsubsection}{\bfseries\fontsize{13pt}{16.9pt}\selectfont}
  \titlespacing*{\subsubsection}{0pt}{12pt}{6pt}
  \setcounter{secnumdepth}{5}
  \setcounter{tocdepth}{5}
  \contentsmargin{2.0em}

\RequirePackage{fancyhdr}
  \pagestyle{fancy}
  \lhead{}
  \chead{\makebox[0.7\textwidth][s]{\it \Qiqi@University@chs\Qiqi@ApplyName@chs}}
  \rhead{}
  \lfoot{}
  \cfoot{\thepage}
  \rfoot{}
  \renewcommand{\headrulewidth}{2pt}
  \renewcommand{\footrulewidth}{0pt}

\RequirePackage{etoolbox}
  \patchcmd{\chapter}{\thispagestyle{plain}}{\thispagestyle{fancy}}{}{}


\RequirePackage{xparse}
  \DeclareDocumentCommand\newacronym{o m m m}{
    \IfNoValueTF{#1}
    {
      \def\acronymtype{acronym}
    }
    {
      \def\acronymtype{#1}
    }

    \ifthenelse{\equal{\acronymtype}{noacronym}}
    {
      \newglossaryentry{#2}
      {
        long        = {#3},
        description = {#4},
        type        = {hide},
        sort        = {L},
        text        = {\glsentrydesc{\glslabel}},
        name        = {\glslabel},  
        first       = {\glsentrydesc{\glslabel}(\glsentrylong{\glslabel})}
      }
    }
    {
      \newglossaryentry{#2}
      {
        long        = {#3},
        description = {#4},
        type        = {\acronymtype},
        sort        = {L},
        text        = {\glslabel},
        name        = {\glslabel},  
        first       = {\glsentrydesc{\glslabel}(\glsentrylong{\glslabel}, \glslabel)}
      }
    }    
  }

  \DeclareDocumentCommand\newvariable{m m m}{
    \newglossaryentry{#1}
    {      
      name        = {\ensuremath{#2}},
      description = {#3},
      sort        = {L},
      type        = {variable}
    }
  }

  \newglossarystyle{Acronym}{
  \renewenvironment{theglossary}
       {\small\begin{longtabu}{X[-1]XX[-1]X[c, -1]}\tabucline[1pt]{-}缩写 & 英文全称 & 中文含义 & 首次出现页码\\\hline}%
       {\tabucline[1pt]{-}\end{longtabu}}
    \renewcommand*{\glspostdescription}{}
    \renewcommand*{\glossaryheader}{}
    \renewcommand*{\glsgroupheading}[1]{}
    \renewcommand*{\glossaryentryfield}[5]{
      \glstarget{##1}{\glsentrytext{##1}} & \glsentrylong{##1} & ##3 & 第 ##5 页\\}
  }

  \newglossarystyle{Variable}{
  \renewenvironment{theglossary}
       {\begin{longtabu}{X[-1]XX[c, -1]}\tabucline[1pt]{-}符号 & 含义 & 首次出现页码\\\hline}%
       {\tabucline[1pt]{-}\end{longtabu}}
    \renewcommand*{\glspostdescription}{}
    \renewcommand*{\glossaryheader}{}
    \renewcommand*{\glsgroupheading}[1]{}
    \renewcommand*{\glossaryentryfield}[5]{
      \glstarget{##1}{\glsentrytext{##1}} & ##3 & 第 ##5 页\\}
  }

  \DeclareDocumentCommand\Author{o m}{
    \IfNoValueTF{#1}
    {
      \gdef\Qiqi@Author@chs{#2}
      \gdef\Qiqi@Author@eng{#2}
    }
    {
      \gdef\Qiqi@Author@chs{#2}
      \gdef\Qiqi@Author@eng{#1}
    }
  }

  \DeclareDocumentCommand\Address{o m}{
    \IfNoValueTF{#1}
    {
      \gdef\Qiqi@Address@chs{#2}
      \gdef\Qiqi@Address@eng{#2}
    }
    {
      \gdef\Qiqi@Address@chs{#2}
      \gdef\Qiqi@Address@eng{#1}
    }
  }

  \DeclareDocumentCommand\University{o m}{
    \IfNoValueTF{#1}
    {
      \gdef\Qiqi@University@chs{#2}
      \gdef\Qiqi@University@eng{#2}
    }
    {
      \gdef\Qiqi@University@chs{#2}
      \gdef\Qiqi@University@eng{#1}
    }
  }

  \DeclareDocumentCommand\Department{o m}{
    \IfNoValueTF{#1}
    {
      \gdef\Qiqi@Department@chs{#2}
      \gdef\Qiqi@Department@eng{#2}
    }
    {
      \gdef\Qiqi@Department@chs{#2}
      \gdef\Qiqi@Department@eng{#1}
    }
  }

  \DeclareDocumentCommand\Supervisor{o m}{
    \IfNoValueTF{#1}
    {
      \gdef\Qiqi@Supervisor@chs{#2}
      \gdef\Qiqi@Supervisor@eng{#2}
    }
    {
      \gdef\Qiqi@Supervisor@chs{#2}
      \gdef\Qiqi@Supervisor@eng{#1}
    }
  }

  \DeclareDocumentCommand\Date{o m}{
    \IfNoValueTF{#1}
    {
      \gdef\Qiqi@Date@chs{#2}
      \gdef\Qiqi@Date@eng{#2}
    }
    {
      \gdef\Qiqi@Date@chs{#2}
      \gdef\Qiqi@Date@eng{#1}
    }
  }

  \DeclareDocumentCommand\Title{o m}{
    \IfNoValueTF{#1}
    {
      \gdef\Qiqi@Title@chs{#2}
      \gdef\Qiqi@Title@eng{#2}
    }
    {
      \gdef\Qiqi@Title@chs{#2}
      \gdef\Qiqi@Title@eng{#1}
    }
  }

  \DeclareDocumentCommand\Abstract{+o +m}
  {
    \IfNoValueTF{#1}
    {
      \long\gdef\Qiqi@Abstract@chs{#2}
      \long\gdef\Qiqi@Abstract@eng{#2}
    }{
      \long\gdef\Qiqi@Abstract@chs{#2}
      \long\gdef\Qiqi@Abstract@eng{#1}
    }
  }

  \DeclareDocumentCommand\Keywords{o m}{
    \IfNoValueTF{#1}
    {
      \gdef\Qiqi@Keywords@chs{#2}
      \gdef\Qiqi@Keywords@eng{#2}
    }
    {
      \gdef\Qiqi@Keywords@chs{#2}
      \gdef\Qiqi@Keywords@eng{#1}
    }
  }

  \DeclareDocumentCommand\UniversityLogo{m}{
    \gdef\Qiqi@UniversityLogo{#1}
  }

  \DeclareDocumentCommand\UniversityTitle{m}{
    \gdef\Qiqi@UniversityTitle{#1}
  }

  \DeclareDocumentCommand\ClassificationCode{m}{
    \gdef\Qiqi@ClassificationCode{#1}
  }

  \DeclareDocumentCommand\UniversityCode{m}{
    \gdef\Qiqi@UniversityCode{#1}
  }

  \DeclareDocumentCommand\StudentID{m}{
    \gdef\Qiqi@StudentID{#1}
  }

  \DeclareDocumentCommand\SecurityLevel{m}{
    \gdef\Qiqi@SecurityLevel{#1}
  }

  \ifthenelse
  { % if
    \equal{\Qiqi@Degree}{none}
  }
  { % then
    \gdef\Qiqi@ApplyName@chs{学位论文}
    \gdef\Qiqi@ApplyName@eng{A Thesis Submitted in Partial Fulfillment of the Requirements for the Degree}
  }
  { % else
  }

  \ifthenelse
  { % if
    \equal{\Qiqi@Degree}{fyp}
  }
  { % then
    \gdef\Qiqi@ApplyName@chs{毕业设计论文}
    \gdef\Qiqi@ApplyName@eng{A Thesis Submitted in Partial Fulfillment of the Requirements for Final Year Project}
  }
  { % else
  }

  \ifthenelse
  { % if
    \equal{\Qiqi@Degree}{bachelor}
  }
  { % then
    \gdef\Qiqi@ApplyName@chs{学士学位论文}
    \gdef\Qiqi@ApplyName@eng{A Thesis Submitted in Partial Fulfillment of the Requirements for the Degree of Bachelor}
  }
  { % else
  }

  \ifthenelse
  { % if
    \equal{\Qiqi@Degree}{master}
  }
  { % then
    \gdef\Qiqi@ApplyName@chs{硕士学位论文}
    \gdef\Qiqi@ApplyName@eng{A Thesis Submitted in Partial Fulfillment of the Requirements for the Degree of Master}
  }
  { % else
  }

  \ifthenelse
  { % if
    \equal{\Qiqi@Degree}{phd}
  }
  { % then
    \gdef\Qiqi@ApplyName@chs{博士学位论文}
    \gdef\Qiqi@ApplyName@eng{A Thesis Submitted in Partial Fulfillment of the Requirements for the Ph.D}
  }
  { % else
  }

\RequirePackage{syntax}

\def\indexname          {索引}
\def\figurename         {图}
\def\tablename          {表}
\def\listingscaption    {代码}
\def\bibname            {参考文献}
\def\contentsname       {目\hspace{1em}录}
\def\contentsnamenospace{目录}
\def\appendixname       {附录}

\RequirePackage{cleveref}
\crefname{equation}{公式}{公式}
\Crefname{equation}{公式}{公式}
\crefname{appendix}{附录}{附录}
\Crefname{appendix}{附录}{附录}
\crefname{figure}{图}{图}
\Crefname{figure}{图}{图}
\crefformat{chapter}{第#2\zhnumber{#1}#3章}
\Crefformat{chapter}{第#2\zhnumber{#1}#3章}
\crefformat{section}{第 #2#1#3 小节}
\Crefformat{section}{第 #2#1#3 小节}
\crefformat{paragraph}{第 #2#1#3 小节}
\Crefformat{paragraph}{第 #2#1#3 小节}

\def\maketitle{
  % Page 1
  \thispagestyle{empty}
  \rule{0pt}{0pt}\\[15pt]
  \noindent\large
  \makebox[4em][s]{分类号}   \hspace{0.5em}\underline{\makebox[5em ][l]{\hspace{0.5em}\Qiqi@ClassificationCode}}\hfill
  \makebox[2em][s]{学号}     \hspace{0.5em}\underline{\makebox[11em][l]{\hspace{0.5em}\Qiqi@StudentID         }}\\[15pt]
  \makebox[4em][s]{学校代码} \hspace{0.5em}\underline{\makebox[5em ][l]{\hspace{0.5em}\Qiqi@UniversityCode    }}\hfill
  \makebox[2em][s]{密级}     \hspace{0.5em}\underline{\makebox[11em][l]{\hspace{0.5em}\Qiqi@SecurityLevel     }}\\[25pt]
  \centering
  \includegraphics[height = 1.5cm]{\Qiqi@UniversityTitle}\\[20pt]
  \scalebox{2.7}{\makebox[7.5em][s]{\bf \Qiqi@ApplyName@chs}}\\[80pt]
  {\LARGE\bf \Qiqi@Title@chs}\\[120pt]
  \Large
  \begin{tabular}{>{\begin{CJKfilltwosides}{5em}}l<{\end{CJKfilltwosides}}@{：\hspace{1em}}l}
    学位申请人 & \Qiqi@Author@chs     \\[10pt]
    学科专业   & \Qiqi@Department@chs \\[10pt]
    指导教师   & \Qiqi@Supervisor@chs \\[10pt]
    答辩日期   & \Qiqi@Date@chs       \\
  \end{tabular}

  % Page 2
  \clearpage
  \thispagestyle{empty}
  \centering
  \rule{0pt}{0pt}\\[12pt]
  \Qiqi@ApplyName@eng\\[80pt]
  {\LARGE\bf \Qiqi@Title@eng}\\[170pt]
  \begin{tabular}{l@{ : }l}
   Student    & \Qiqi@Author@eng    \\[10pt]
   Major      & \Qiqi@Department@eng\\[10pt]
   Supervisor & \Qiqi@Supervisor@eng\\
  \end{tabular}\\\vfill
  \large
  {\bf \Qiqi@University@eng}\\[15pt]
  {\bf \Qiqi@Address@eng}\\[15pt]
  {\bf \Qiqi@Date@eng}

  % Page 3
  \clearpage
  \thispagestyle{empty}
  \normalsize
  \justifying
  \begin{center}
    {\bf\large 独创性声明}
  \end{center}

  本人声明所呈交的学位论文是我个人在导师的指导下进行的研究工作及取得的研究成果。尽我所知，除文中已标明引用的内容外，本论文不包含任何其他人或集体已经发表或撰写过的研究成果。对本文的研究做出贡献的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律结果由本人承担。\\[30pt]
  
  \begin{flushright}
    \begin{tabular}{@{}r@{}}
      学位论文作者签名：\hspace{3em}\rule{0pt}{0pt}\\[5pt]
      日期：\hspace{2em}年\hspace{2em}月\hspace{2em}日
    \end{tabular}
  \end{flushright}\vspace{45pt}

  \begin{center}
    {\bf\large 学位论文版权使用授权书}
  \end{center}

  本学位论文作者完全了解学校有关保留、使用学位论文的规定，即：学校有权保留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权\Qiqi@University@chs{}可以将本学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本学位论文。\vspace{15pt}

  本论文属于
  \begin{tabular}{l}
    $\square$ 保密，在 \underline{\hspace{2em}} 年解密后适用本授权书。\\
    $\square$ 不保密。
  \end{tabular}\vspace{15pt}

  (请在以上方框内打``\checked'')\vspace{50pt}

  \noindent
  \begin{tabular}{@{}r@{}}
    学位论文作者签名：\hspace{3em}\rule{0pt}{0pt}\\[5pt]
    日期：\hspace{2em}年\hspace{2em}月\hspace{2em}日
  \end{tabular}\hfill
  \begin{tabular}{@{}r@{}}
    指导教师签名：\hspace{5em}\rule{0pt}{0pt}\\[5pt]
    日期：\hspace{2em}年\hspace{2em}月\hspace{2em}日
  \end{tabular}

  
  % Page 4
  \chapter*{摘要}
  \addcontentsline{toc}{chapter}{摘要}  
  \linespread{1.67}
  \pagenumbering{Roman}
  \normalsize
  \justifying
  \Qiqi@Abstract@chs

  \noindent{\bf 关键词：}\Qiqi@Keywords@chs

  % Page 5
  \chapter*{Abstract}
  \addcontentsline{toc}{chapter}{Abstract}
  \normalsize
  \justifying
  \Qiqi@Abstract@eng

  \noindent{\bf Key words:} \Qiqi@Keywords@eng

  % Page 5
  \newpage  
  \pdfbookmark{\contentsnamenospace}{\contentsnamenospace}
  \tableofcontents
  
  \newpage
  \printglossary[style = Acronym, title={缩写含义表}]

  \newpage
  \printglossary[style = Variable, type = variable, title={符号表}]

  \newpage
  %\setcounter{page}{1}
  %\renewcommand{\thepage}{\arabic{page}}
  \pagenumbering{arabic}
}