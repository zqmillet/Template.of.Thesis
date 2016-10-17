\NeedsTeXFormat{LaTeX2e}[1999/12/01]
%\ProvidesClass{Thesis}
%[2016/06/01 v1.2 A Thesis Template for Huazhong University of Science and Technology]

\LoadClass{article}

\RequirePackage{xeCJK}
\RequirePackage{CJKfntef}
\RequirePackage{amsmath, amssymb, amsfonts}
\RequirePackage[amsmath, amsthm, thmmarks, hyperref, thref]{ntheorem}
\RequirePackage{geometry}
\RequirePackage{longtable, tabu}

\setmainfont{Times New Roman}
\setmonofont{Consolas}
\setCJKmainfont[BoldFont = 黑体, ItalicFont = 仿宋]{宋体}
\setCJKmonofont{楷体}

\def\Author#1#2{
  \gdef\Qiqi@Author@chs{#1}
  \gdef\Qiqi@Author@eng{#2}
}

\def\University#1#2{
  \gdef\Qiqi@University@chs{#1}
  \gdef\Qiqi@University@eng{#2}
}

\def\UniversityLogo#1{
  \gdef\Qiqi@UniversityLogo{#1}
}

\def\UniversityTitle#1{
  \gdef\Qiqi@UniversityTitle{#1}
}

\def\ClassificationCode#1{
  \gdef\Qiqi@ClassificationCode{#1}
}

\def\UniversityCode#1{
  \gdef\Qiqi@UniversityCode{#1}
}

\def\StudentID#1{
  \gdef\Qiqi@StudentID{#1}
}

\def\SecurityLevel#1{
  \gdef\Qiqi@SecurityLevel{#1}
}

\def\Department#1#2{
  \gdef\Qiqi@Department@chs{#1}
  \gdef\Qiqi@Department@eng{#2}
}

\def\Supervisor#1#2{
  \gdef\Qiqi@Supervisor@chs{#1}
  \gdef\Qiqi@Supervisor@eng{#2}
}

\def\Date#1#2{
  \gdef\Qiqi@Date@chs{#1}
  \gdef\Qiqi@Date@eng{#2}
}

\def\Title#1#2{
  \gdef\Qiqi@Title@chs{#1}
  \gdef\Qiqi@Title@eng{#2}
}

\def\maketitle{
  \newgeometry{
    top    = 1.2in,
    bottom = 1.2in,
    left   = 1.0in,
    right  = 1.0in
  }
  \thispagestyle{empty}
  \rule{0pt}{0pt}\\[15pt]
  \noindent\Large
  \makebox[4em][s]{分类号}   \hspace{0.5em}\underline{\makebox[5em ][l]{\hspace{0.5em}\Qiqi@ClassificationCode}}\hfill
  \makebox[2em][s]{学号}     \hspace{0.5em}\underline{\makebox[11em][l]{\hspace{0.5em}\Qiqi@StudentID         }}\\[15pt]
  \makebox[4em][s]{学校代码} \hspace{0.5em}\underline{\makebox[5em ][l]{\hspace{0.5em}\Qiqi@UniversityCode    }}\hfill
  \makebox[2em][s]{密级}     \hspace{0.5em}\underline{\makebox[11em][l]{\hspace{0.5em}\Qiqi@SecurityLevel     }}\\[25pt]
  \centering
  \includegraphics[height = 1.5cm]{\Qiqi@UniversityTitle}\\[20pt]
  \scalebox{2.7}{\makebox[7.5em][s]{\bf 学士学位论文}}\\[80pt]
  {\huge\bf \Qiqi@Title@chs}\\[120pt]
  \LARGE
  \begin{tabular}{>{\begin{CJKfilltwosides}{5em}}l<{\end{CJKfilltwosides}}@{：\hspace{1em}}l}
    学位申请人 & \Qiqi@Author@chs     \\[10pt]
    学科专业   & \Qiqi@Department@chs \\[10pt]
    指导教师   & \Qiqi@Supervisor@chs \\[10pt]
    答辩日期   & \Qiqi@Date@chs       \\
  \end{tabular}
  \clearpage
}

