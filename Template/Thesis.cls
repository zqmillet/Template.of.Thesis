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
\LoadClass[12pt, a4paper]{book}
\RequirePackage{xeCJK}
\RequirePackage{CJKfntef}
\RequirePackage{indentfirst}
\RequirePackage{ragged2e}
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt plus 2pt minus 1pt}
\linespread{1.2}
\RequirePackage{amsmath, amssymb, amsfonts, wasysym}
\RequirePackage[amsmath, amsthm, thmmarks, hyperref, thref]{ntheorem}
\RequirePackage{geometry}
\RequirePackage{longtable, tabu}

\setmainfont{Times New Roman}
\setmonofont{Consolas}
\setCJKmainfont[BoldFont = 黑体, ItalicFont = 仿宋]{宋体}
\setCJKmonofont{楷体}

\RequirePackage{xparse}
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
{ %if
  \equal{\Qiqi@Degree}{none}
}
{ %then
  \gdef\Qiqi@ApplyName@chs{学位论文}
  \gdef\Qiqi@ApplyName@eng{A Thesis Submitted in Partial Fulfillment of the Requirements for the Degree}
}
{ % else
}

\ifthenelse
{ %if
  \equal{\Qiqi@Degree}{fyp}
}
{ %then
  \gdef\Qiqi@ApplyName@chs{毕业设计论文}
  \gdef\Qiqi@ApplyName@eng{A Thesis Submitted in Partial Fulfillment of the Requirements for Final Year Project}
}
{ % else
}

\ifthenelse
{ %if
  \equal{\Qiqi@Degree}{bachelor}
}
{ %then
  \gdef\Qiqi@ApplyName@chs{学士学位论文}
  \gdef\Qiqi@ApplyName@eng{A Thesis Submitted in Partial Fulfillment of the Requirements for the Degree of Bachelor}
}
{ % else
}

\ifthenelse
{ %if
  \equal{\Qiqi@Degree}{master}
}
{ %then
  \gdef\Qiqi@ApplyName@chs{硕士学位论文}
  \gdef\Qiqi@ApplyName@eng{A Thesis Submitted in Partial Fulfillment of the Requirements for the Degree of Master}
}
{ % else
}

\ifthenelse
{ %if
  \equal{\Qiqi@Degree}{phd}
}
{ %then
  \gdef\Qiqi@ApplyName@chs{博士学位论文}
  \gdef\Qiqi@ApplyName@eng{A Thesis Submitted in Partial Fulfillment of the Requirements for the Ph.D}
}
{ % else
}

\def\maketitle{
  \newgeometry{
    top    = 1.2in,
    bottom = 1.2in,
    left   = 1.0in,
    right  = 1.0in
  }

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
  \normalsize
  \thispagestyle{empty}
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

}

