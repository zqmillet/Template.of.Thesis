\NeedsTeXFormat{LaTeX2e}[1999/12/01]
%\ProvidesClass{Thesis}
%[2016/06/01 v1.2 A Thesis Template for Huazhong University of Science and Technology]

\LoadClass{article}

\RequirePackage{xeCJK}
\RequirePackage{amsmath, amssymb, amsfonts}
\RequirePackage[amsmath, amsthm, thmmarks, hyperref, thref]{ntheorem}

\def\author#1#2{
  \gdef\Qiqi@chsauthor{#1}
  \gdef\Qiqi@engauthor{#2}
}

\def\maketitle{
  作者: \Qiqi@chsauthor{}
  Author: \Qiqi@engauthor{}
}