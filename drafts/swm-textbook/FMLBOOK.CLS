%This is the base LaTeX class of "Fizmatlit" publisher (c) (www.fml.ru)
\NeedsTeXFormat{LaTeX2e}[2001/06/01]
\ProvidesClass{fmlbook}[2005/01/22]
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\if@compatibility
  \renewcommand\@ptsize{0}
\else
\DeclareOption{10pt}{\renewcommand\@ptsize{0}\renewcommand\baselinestretch{0.92}}
\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}\renewcommand\baselinestretch{0.88}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\DeclareOption{14pt}{\renewcommand\@ptsize{4}}
% Общеупотребительные форматы книг              набор        после о. Наука п.о.  до обр.
\DeclareOption{60x84/32}{\def\form@t{0}}  %  72- 81*108-117  100*140              105*150
\DeclareOption{60x90/32}{\def\form@t{1}}  %  77- 85*108-117  107*140              112*150
\DeclareOption{70x90/32}{\def\form@t{2}}  %  77- 85*130-140  107*165  103*165     112*175
\DeclareOption{75x90/32}{\def\form@t{3}}  %  77- 85*144-153  107*177              112*187
\DeclareOption{70x100/32}{\def\form@t{4}} %  86- 95*130-140  120*165  115*165     125*175
\DeclareOption{70x108/32}{\def\form@t{5}} %  99-108*130-140  130*165              135*175
\DeclareOption{84x108/32}{\def\form@t{6}} %  99-108*167-176  130*200  140*200     125*210
\DeclareOption{60x84/16}{\def\form@t{7}}  % 113-122*167-176  145*200  140*200     150*210
\DeclareOption{60x90/16}{\def\form@t{8}}  % 113-122*180-190  145*215  140*215     150*225
\DeclareOption{70x90/16}{\def\form@t{9}}  % 135-144*180-190  170*215  164*215     175*225
\DeclareOption{75x90/16}{\def\form@t{10}} % 149-158*180-190  182*215              187*225
\DeclareOption{70x100/16}{\def\form@t{11}}% 135-144*199-208  170*240  164*235     175*250
\DeclareOption{70x108/16}{\def\form@t{12}}% 135-144*217-226  170*260  164*260     175*270
\DeclareOption{84x108/16}{\def\form@t{13}}% 167-176*217-226  205*260  200*260     210*270
\DeclareOption{60x84/8}{\def\form@t{14}}  % 167-176*244-252  205*290  200*285     210*300
\DeclareOption{60x90/8}{\def\form@t{15}}  % 180-190*248-257  220*290  215*285     225*300
\DeclareOption{70x100/8}{\def\form@t{16}} % 207-271*298-307  245*340              255*350
\DeclareOption{70x108/8}{\def\form@t{17}} % 226-235*298-307  265*340              270*350
\DeclareOption{84x108/8}{\def\form@t{18}} % 226-235*365-374  265*410              270*420
%1pt = 0.376mm

% Наука
% 60x88/8   210*285
% 60x88/16  140*205
% 84x100/32 115*200


\DeclareOption{near}{\def\is@near{}}   % Две страницы рядом (удобно при 2-х страничном просмотре в yap)
\DeclareOption{plog}{\def\is@pictlog{}}% Протоколирует наличие и отсутствие рисунков в файл figs.log
\DeclareOption{frags}{\def\is@frags{}} % Автоматическое включение psfrag'ов перед рисунками (file.tex перед file.eps)
\DeclareOption{frame}{\def\is@frame{}} % Рисует рамку вокруг страницы

\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5\p@}\def\is@draft{}\let\is@frags\undefined}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{\z@}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility
\@openrighttrue
\else
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
\ExecuteOptions{10pt,twoside,onecolumn,final,openany,60x90/16}
\ProcessOptions
\input{bk1\@ptsize.clo}
\setlength\lineskip{\z@}
\setlength\normallineskip{\z@}
\setlength\parskip{\z@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{5}
\renewcommand\topfraction{.99}
\setcounter{bottomnumber}{5}
\renewcommand\bottomfraction{.99}
\setcounter{totalnumber}{10}
\renewcommand\textfraction{0.06}
\renewcommand\floatpagefraction{0.92}
\setcounter{dbltopnumber}{5}
\renewcommand\dbltopfraction{1}
\renewcommand\dblfloatpagefraction{0}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newskip\save@abovedisplayskip
\newskip\save@belowdisplayskip
\newcommand{\addtosurround}[1]{%
  \save@abovedisplayskip=\abovedisplayskip
  \save@belowdisplayskip=\belowdisplayskip
  \advance\abovedisplayskip by #1
  \advance\belowdisplayskip by #1}
  \newcommand{\restoresurround}{%
  \abovedisplayskip=\save@abovedisplayskip
  \belowdisplayskip=\save@belowdisplayskip}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%% Begin норма %%%%%%%%%%%%%%%%%%%%%%%%%
\@ifundefined{is@draft}{
  \chardef\dolyalista32 % Число страниц на печатном листе
  \chardef\gdepollista0 % На каком месте помещается поллиста
  \chardef\sdvignapollista0 % Сдвиг при вычислении остатка от деления на \dolyalista
  \def\@footinfo{%
    \@tempcnta=\c@page \advance\@tempcnta\number\sdvignapollista
    \@tempcntb=\@tempcnta
    \ifnum\@tempcnta>\dolyalista
      \divide\@tempcnta\dolyalista \multiply\@tempcnta\dolyalista
      \advance\@tempcntb-\@tempcnta \divide\@tempcnta\dolyalista \advance\@tempcnta1
      \ifnum\@tempcntb=1
        {\fontsize{8}{9}\selectfont\number\@tempcnta
        \ifnum\number\@tempcnta=\gdepollista \,\sby12\fi
        \enspace\expandafter{\footauthors}}%
      \else
        \ifnum\@tempcntb=3
          {\fontsize{7}{9}\selectfont\number\@tempcnta
          \ifnum\number\@tempcnta=\gdepollista \global\chardef\sdvignapollista8 \,\sby12\fi
          *}
        \fi
      \fi
    \fi
  }
  \def\@oddfootinfo{\raisebox{3mm}[\z@][\z@]{\@footinfo}\hfil}
}{
  \def\@oddfootinfo{}
}
%%%%%%%%%%%%%%%%%% End норма %%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%% Исправляем ошибку в latex.ltx %%%%%%%%%%%%
\def\leftmark{\expandafter\@leftmark\firstmark\@empty\@empty}
\def\rightmark{\expandafter\@rightmark\botmark\@empty\@empty}

%%%%%%%%%% Колонтитулы %%%%%%%%%%%%%%%
\def\ps@empty{%
  \let\@oddfoot\@oddfootinfo \let\@evenfoot\@empty
  \let\@oddhead\@empty \let\@evenhead\@empty
  \let\@mkboth\@gobbletwo
}
\def\ps@headings{%
  \let\@oddfoot\@oddfootinfo  \let\@evenfoot\@empty
  \def\@oddhead{\raisebox{\z@}[\headheight][\z@]{%
     \vbox{\hbox to\textwidth{\fontsize{9}{11}\selectfont\rightmark\hfil\strut\thepage}\hrule}}%
  }%
  \def\@evenhead{\raisebox{\z@}[\headheight][\z@]{%
     \vbox{\hbox to\textwidth{\fontsize{9}{11}\selectfont\thepage\strut\hfil\leftmark}\hrule}}%
  }%
  \let\@mkboth\markboth
  \iftrue
    \def\chaptermark##1{\markboth
        {{\itshape\ifnum\c@chapter>0 \schaptername\;\thechapter.\ \fi ##1}\hfil}%
        {\hfil{\itshape\ifnum\c@chapter>0 \schaptername\;\thechapter.\ \fi ##1}}%
    }%
    \def\sectionmark##1{\markright{%
       \hfil
       {\itshape
       \ifnum\c@chapter>0
         \ifnum\c@section>0 \textrm{\thesection}.\ \fi
       \else
         \ifnum\c@section>0 \textrm{\thesection}.\ \fi
       \fi
       ##1}}%
    }%
  \else
    \def\chaptermark##1{\markboth
        {{\itshape ##1}\hfil\ifnum\c@chapter>0 \textrm[\,\schaptername\;\thechapter\fi}%
        {\ifnum\c@chapter>0 \schaptername\;\thechapter\,\textrm]\fi\hfil{\itshape ##1}}%
    }%
    \def\sectionmark##1{\markright{%
       \ifnum\c@chapter>0
         \ifnum\c@section>0 \textrm{\thesection}\,]\fi
       \else
         \ifnum\c@section>0 \textrm{\arabic{section}}\,]\fi
       \fi
       \hfil{\itshape ##1}}%
    }%
  \fi
}
\def\ps@myheadings{%
  \let\@oddfoot\@empty \let\@evenfoot\@empty
  \def\@evenhead{%
    \vbox{\hbox to\textwidth{\thepage\hfil\slshape\leftmark}\hrule}}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
  \let\@mkboth\@gobbletwo
  \let\chaptermark\@gobble
  \let\sectionmark\@gobble
}
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{3}
\newcounter{part}
\newcounter{chapter}
\newcounter{section}[chapter]
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
\newcounter{figure}[chapter]
\newcounter{table}[chapter]
\renewcommand\thepart{\@Roman\c@part}
\renewcommand\thechapter{\@arabic\c@chapter}
\renewcommand\thesection{\ifnum\c@chapter>0 \thechapter.\else \fi\@arabic\c@section}
\renewcommand\thesubsection{\ifnum\c@section>0 \thesection.\fi\@arabic\c@subsection}
\renewcommand\thesubsubsection{\ifnum\c@subsection>0 \thesubsection.\fi\@arabic\c@subsubsection}
\renewcommand\theparagraph{\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph{\theparagraph.\@arabic\c@subparagraph}
\renewcommand\thefigure{\ifnum\c@chapter>0 \thechapter.\else \fi\@arabic\c@figure}
\renewcommand\thetable{\ifnum\c@chapter>0 \thechapter.\else \fi\@arabic\c@table}
\@addtoreset{equation}{chapter}
\renewcommand\theequation{\ifnum\c@chapter>0 \thechapter.\else \fi\@arabic\c@equation}

\newcommand\frontmatter{\cleardoublepage\@mainmatterfalse\pagenumbering{roman}}
\newcommand\mainmatter{\cleardoublepage\@mainmattertrue\pagenumbering{arabic}}
\newcommand\backmatter{\if@openright\cleardoublepage\else\clearpage\fi
 \@mainmatterfalse
}

\def\totoc#1#2{#2}% Первый аргумент идет в toc, а второй в заголовок
\def\protect@writetotoc{% Защищаем содержание от разного мусора
   \def\\{}%
   \def\footnotemark{}%
   \def\footnote##1{}%
   \def\totoc##1##2{##1}%
}
\newcommand\no@pagebreaks{%
   \def\\{\ifvmode\@nolnerr\else\unskip\vadjust{\nobreak}\break\fi}%
   \interlinepenalty=10000
}

\newcommand\part{%
  %\if@openright\cleardoublepage\else\clearpage\fi
  \clearpage
  \thispagestyle{empty}%
  \if@twocolumn\onecolumn\@tempswatrue\else\@tempswafalse\fi%\null\vfil
  \secdef\@part\@spart
}
\def\@part[#1]#2{%
    {\def\totoc##1##2{##1}%
      \ifnum \c@secnumdepth >-2\relax
        \refstepcounter{part}%
        \addcontentsline{toc}{part}{\partname \kern.6em \thepart.\hspace{1em}#2}%
      \else \addcontentsline{toc}{part}{#2}%
      \fi
    }
    \markboth{}{}%
    {\centering \interlinepenalty \@M \normalfont\bfseries
      \LARGE\advance\baselineskip2\p@
      \vspace*{40mm}
      \ifnum \c@secnumdepth >-2\relax \partname~~\thepart \par\vskip 25\p@ \fi
      \uppercase{#2}
      \clearpage\null\thispagestyle{empty}\newpage% \vskip7\p@ \hrule\par
    }\@endpart
}
\def\@spart#1{%
    {\centering \interlinepenalty \@M
     \normalfont \LARGE \bfseries \uppercase{#1}\par
    }\@endpart
}
\def\@endpart{\vskip2mm plus.4mm minus.1mm\forbidnewpagetrue
}
\newif\ifforbidnewpage % Позволяет запретить \newpage перед главой
\newcommand\chapter{\newpage
   %\ifodd\c@page \null\newpage\addtocounter{page}{-2}\null\newpage \fi %Для сборников статей
   %\ifforbidnewpage\else\newpage\fi \forbidnewpagefalse
  \thispagestyle{empty}
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter
  }
\def\@chapter[#1]#2{%
  \refstepcounter{chapter}%
  \typeout{-- Glava\space\thechapter\space --}%
  {\protect@writetotoc
    \ifappendix
       \addcontentsline{toc}{sectionb}{\chaptername\hskip.6em \thechapter\unskip.\kern.8em {#2}}%
    \else
       \addcontentsline{toc}{chapter}{\chaptername\kern.6em \thechapter.\kern.8em {\bfseries\boldmath #2}}%
    \fi
    \chaptermark{#1}%
  }%
%  \addtocontents{lof}{\protect\addvspace{10\p@}}\addtocontents{lot}{\protect\addvspace{10\p@}}%
  \if@twocolumn \@topnewpage[\@makechapterhead{#2}]\else \@makechapterhead{#2}\fi
  }
\def\@makechapterhead#1{%
  \vspace*{-10\p@}%
  {\parindent\z@ \centering \normalfont \large
    \chaptername\ \space \thechapter
    \vskip4mm\par \interlinepenalty\@M \large
    \spaceskip=.6em \baselineskip=1.4\baselineskip
    \bfseries
    \vbox to 7mm{\uppercase{#1}\vss}\par
    \vspace*{45\p@ plus 2\p@}
}}
\def\@schapter#1{%
  \if@twocolumn \@topnewpage[\@makeschapterhead{#1}]\else \@makeschapterhead{#1}\fi%\@afterheading
}
\def\@makeschapterhead#1{%
  \vspace*{-10\p@}%
  {\parindent \z@ \centering \normalfont \interlinepenalty\@M \bfseries\large\baselineskip=1.2\baselineskip
  \vbox to 7mm{\uppercase{#1}\vss}\par
  \vspace*{45\p@ plus 2\p@}
}}


\newlength\sectionskipa \newlength\sectionskipb \newlength\sectionskipc
\newlength\subsectionskip

\newcommand\sectionc[1]{%
  \penalty-450 \vskip\sectionskipa \vspace*{\sectionskipb}%
  \hspace*{-\parindent}%
  \parbox{\textwidth}{%
    \centering\normalfont\large\bfseries\boldmath\no@pagebreaks#1\par
  }%
  \nopagebreak\vskip\sectionskipc%
}
\newcommand\sectionb[2][*]{%
  \setcounter{chapter}{0}\setcounter{section}{0}\setcounter{equation}{0}%
  \setcounter{subsection}{0}\setcounter{figure}{0}\setcounter{table}{0}%
  \newpage\thispagestyle{empty}\vspace*{7mm}%
  \sectionc{#2}\vspace{5mm}%
  {\protect@writetotoc
    \ifx*#1\chaptermark{#2}\sectionmark{#2}\else\chaptermark{#1}\sectionmark{#1}\fi
    \addcontentsline{toc}{sectionb}{#2}%
  }%
  \nopagebreak\ignorespaces
}
\newcommand\sectiona[2][*]{%
  %\setcounter{equation}{0}\setcounter{subsection}{0}\setcounter{figure}{0}\setcounter{table}{0}%
  \sectionc{#2}%
  {\protect@writetotoc
    \ifnum\c@chapter<1
      \ifx*#1\chaptermark{#2}\else\chaptermark{#1}\fi
    \fi
    \ifx*#1\sectionmark{#2}\else\sectionmark{#1}\fi
    \addcontentsline{toc}{section}{\tocnumber{}#2}%
  }%
  \nopagebreak\ignorespaces
}

\newcommand\section[2][*]{\removelastskip
  \penalty-450\vspace{\sectionskipa}\vspace*{\sectionskipb}%
  \refstepcounter{section}
  {%
  \if01
    \normalfont\settowidth\@tempdima{\large\bfseries\thesection.\kern1ex}\hangindent\@tempdima\raggedright
  \else
    \centering
  \fi
  \large\bfseries\boldmath\thesection.\kern1ex{\no@pagebreaks#2}\par}%
  {\protect@writetotoc
    \ifx*#1\sectionmark{#2}\else\sectionmark{#1}\fi
    \addcontentsline{toc}{section}{\tocnumber{\thesection.}#2}%
  }%
  \nopagebreak\vskip\sectionskipc
  \ignorespaces
}
\newcommand\subsectionc[1]{%
  \removelastskip\penalty-250\vspace{\subsectionskip}\par
  \everypar{{\normalfont\normalsize\fontseries{bx}\selectfont\boldmath #1.}\hspace{.7em plus .3em}\everypar{}}%
}
\newcommand\subsection[1]{%
  \refstepcounter{subsection}%
  \subsectionc{\thesubsection.\hskip.5em plus 1em\relax #1}%
  {\protect@writetotoc
    \addcontentsline{toc}{subsection}{\thesubsection.\nobreak\hskip.3em plus .1em #1\nobreak\hskip.3em plus .1em}%
  }%
  \ignorespaces
}

\newcommand\subsec[1]{\vskip\subsectionskip\leavevmode{\bfseries #1}}%?
%\newcommand\appendix[1]{\smallskip\vspace{\subsectionskip}\rightline{{#1}}\nobreak\smallskip
%  \addcontentsline{toc}{subsection}{{\nobreak#1\nobreak\hskip.4em plus .1em}}%
%}
\newcommand\appendixa[1]{\smallskip\vspace{\subsectionskip}\rightline{{#1}}\nobreak\smallskip}%

\newcommand\subsubsection[1]{%\vspace{.5\subsectionskip}%
 \refstepcounter{subsubsection}%
 \par\smallskip\leavevmode{\normalfont\normalsize\bfseries\no@pagebreaks\relax #1.\hspace{.5em plus .2em}}%
 \nopagebreak
 \ignorespaces
}

% C проверкой последовательных заголовков в подбор.
%\newcommand\subsubsection[1]{%\vspace{.5\subsectionskip}
% \refstepcounter{subsubsection}%
% \edef\@tempdefa{\the\everypar}
% \ifx\@empty\@tempdefa \else\par\leavevmode \fi
% \everypar{{\normalfont\normalsize\itshape\bfseries\thesubsubsection. #1.\hspace{.3em}}\everypar{}}%
% \nopagebreak\par
%}


%\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
%     {-3ex\@plus -.8ex \@minus -.2ex}%
%     {-1.5ex \@plus -.4ex}%
%     {\normalfont\normalsize\itshape\centering}}
\newcommand\paragraph{%
  \@startsection{paragraph}{4}{\z@}{3.25ex \@plus1ex \@minus.2ex}{-1em}{\normalfont\normalsize\bfseries}%
}
\newcommand\subparagraph{%
  \@startsection{subparagraph}{5}{\parindent}{3.25ex \@plus1ex \@minus .2ex}{-1em}{\normalfont\normalsize\bfseries}%
}
%A4=594*840
\ifcase\form@t
   \textwidth=71mm  \textheight=112mm % 60x84/32    72- 81*108-117
\or\textwidth=76mm  \textheight=112mm % 60x90/32    77- 85*108-117
\or\textwidth=76mm  \textheight=135mm % 70x90/32    77- 85*130-140
\or\textwidth=76mm  \textheight=148mm % 75x90/32    77- 85*144-153
\or\textwidth=85mm  \textheight=135mm % 70x100/32   86- 95*130-140
\or\textwidth=98mm  \textheight=135mm % 70x108/32   99-108*130-140
\or\textwidth=98mm  \textheight=171mm % 84x108/32   99-108*167-176
\or\textwidth=112mm \textheight=171mm % 60x84/16   113-122*167-176
\or\textwidth=112mm \textheight=185mm % 60x90/16   113-122*180-190
\or\textwidth=134mm \textheight=185mm % 70x90/16   135-144*180-190
\or\textwidth=148mm \textheight=185mm % 75x90/16   149-158*180-190
\or\textwidth=134mm \textheight=203mm % 70x100/16  135-144*199-208
\or\textwidth=134mm \textheight=221mm % 70x108/16  135-144*217-226
\or\textwidth=166mm \textheight=221mm % 84x108/16  167-176*217-226
\or\textwidth=166mm \textheight=248mm % 60x84/8    167-176*244-252
\or\textwidth=179mm \textheight=252mm % 60x90/8    180-190*248-257
\or\textwidth=206mm \textheight=302mm % 70x100/8   207-271*298-307
\or\textwidth=225mm \textheight=302mm % 70x108/8   226-235*298-307
\or\textwidth=225mm \textheight=369mm % 84x108/8   226-235*365-374
\fi
\advance\textheight-18pt
\AtBeginDocument{%
 \@tempdima=\textheight\advance\@tempdima-\topskip\@tempdimb=\@tempdima
 \advance\@tempdima.5\baselineskip\divide\@tempdima\baselineskip\@tempcnta=\@tempdima
 \baselineskip=\@tempdimb\divide\baselineskip\@tempcnta
 \advance\baselineskip\z@ plus.06\p@ minus.03\p@
 \normalbaselineskip\baselineskip
% \advance\@tempcnta1 \errmessage{\the\@tempcnta \space lines per page}
}
\headsep=9\p@ \maxdepth=3pt
\marginparsep=6\p@ \marginparwidth=30\p@
\topskip=10pt

\hoffset=-1in \voffset=-1in
\paperwidth594\p@ \paperheight=840\p@
%\paperwidth145mm \paperheight=215mm % 60x90/16
%\paperwidth163mm \paperheight=235mm % 70x100/16
%\AtBeginDvi{%
%  \special{papersize=\the\paperwidth,\the\paperheight}%
%  %\special{/landplus90 true store}%
%}
%\evensidemargin=\paperwidth \advance\evensidemargin-\textwidth
%\advance\evensidemargin-\evensidemargin
%\usepackage[cam,dvips,vorigin=0mm,horigin=0mm]{crop}

\@ifundefined{is@near}
{%
  \oddsidemargin=\paperwidth \advance\oddsidemargin-\textwidth
  \oddsidemargin=.5\oddsidemargin
  \evensidemargin=\oddsidemargin
  \topmargin=\paperheight \advance\topmargin-\textheight
  \advance\topmargin-\headsep\advance\topmargin-\headheight
  \topmargin=.5\topmargin
}{%
  \oddsidemargin=10mm \topmargin=0mm
  \evensidemargin\oddsidemargin
}

\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
  {\list{}{\labelwidth\z@ \itemindent-\leftmargin\let\makelabel\descriptionlabel}}
  {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep\normalfont\bfseries #1}
\newenvironment{verse}{\let\\\@centercr
  \list{}{\itemsep\z@ \itemindent-1.5em \listparindent\itemindent\rightmargin\leftmargin \advance\leftmargin 1.5em}%
  \item\relax}
  {\endlist}
\newenvironment{quotation}{%
  \list{}{\listparindent1.5em \itemindent\listparindent \rightmargin\leftmargin \parsep\z@ \@plus\p@}%
  \item\relax}
  {\endlist}
\newenvironment{quote}{%
  \list{}{\rightmargin\leftmargin}%
  \item\relax}
  {\endlist}

\def\@Alphr#1{\ifcase #1\or A\or Б\or В\or Г\or Д\or Е\or Ж\or З\or И\or К\or Л\or М\or Н\or О\or П\or Р\or С\or Т\or
У\or Ф\or Х\or Ц\or Ч\or Ш\or Щ\or Ъ\or Ы\or ь\or Э\or Ю\or Я\else \@ctrerr\fi}
\newif\ifappendix \appendixfalse
\newcommand\appendix{\par
  \appendixtrue
  \addtocontents{toc}{\vskip5mm}%
  \setcounter{chapter}{0}\setcounter{section}{0}%
  \gdef\chaptername{\appendixname}\gdef\schaptername{Прил.}%
  \gdef\thechapter{\@Alphr\c@chapter}%
}
\setlength\arraycolsep{4\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins

% fbox
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}

\newcommand\padding[2][2pt]{%
  \setbox\@tempboxa\hbox{#2}%
  \expandafter\@getpadding#1,,,,\@nil
  \@tempdima=\ht\@tempboxa \advance\@tempdima\@tempdefa
  \@tempdimb=\dp\@tempboxa \advance\@tempdimb\@tempdefc
  \setbox\@tempboxa=\vbox{\kern\@tempdefa\hbox{\kern\@tempdefd\box\@tempboxa\kern\@tempdefb}\kern\@tempdefc}%
  \ht\@tempboxa\@tempdima
  \dp\@tempboxa\@tempdimb
  \box\@tempboxa
}
\def\@getpadding#1,#2,#3,#4,#5\@nil{%
  \def\@tempdefa{#1}%
  \def\@tempdefb{#2}%
  \def\@tempdefc{#3}%
  \def\@tempdefd{#4}%
  \ifx\@empty\@tempdefb \edef\@tempdefb{\@tempdefa}\edef\@tempdefc{\@tempdefa}\edef\@tempdefd{\@tempdefa}\else
     \ifx\@empty\@tempdefc \edef\@tempdefc{\@tempdefa}\edef\@tempdefd{\@tempdefb}\else
        \ifx\@empty\@tempdefd \edef\@tempdefd{\@tempdefb}%
        \fi
     \fi
  \fi
}
%example \fbox{\padding[10pt,30pt,100pt,211pt]{rr}}
%end fbox

\def\fps@figure{htbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\;\thefigure}
\newenvironment{figure}{\@float{figure}}{\end@float}
\newenvironment{figure*}{\@dblfloat{figure}}{\end@dblfloat}
\def\fps@table{htbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\kern1ex\thechapter.\thetable}
\newenvironment{table}{\@float{table}}{\end@float}
\newenvironment{table*}{\@dblfloat{table}}{\end@dblfloat}

\newlength\abovecaptionskip
\newlength\belowcaptionskip
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\small #1. #2}%
  \ifdim \wd\@tempboxa >\hsize
    {\small #1. #2}\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}
\pagestyle{headings}
\pagenumbering{arabic}
\newcommand\tableofcontents{{%
    \if@twocolumn\@restonecoltrue\onecolumn\else\@restonecolfalse\fi
    \parindent=\z@\petit\renewcommand\baselinestretch{.9}
    \thispagestyle{empty}\vspace*{28mm}
    \sectionc{\MakeUppercase{\contentsname}}\bigskip\par
    \chaptermark{\contentsname}\sectionmark{\contentsname}
    \brokenpenalty=0
    %\def~{ }
    \begingroup
       \lineskip=3pt%?
       \def\cite##1{\unskip}
       {\@starttoc{toc}}%
    \endgroup
    \if@restonecol\twocolumn\fi
    }}
%\newcommand*\l@part[2]{%
%  \ifnum \c@tocdepth >-2\relax
%    \addpenalty{-\@highpenalty}%
%    \addvspace{2.25em \@plus\p@}%
%    \begingroup
%      \parindent \z@ \rightskip \@pnumwidth
%      \parfillskip -\@pnumwidth
%      {\leavevmode
%       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
%       \nobreak
%         \global\@nobreaktrue
%         \everypar{\global\@nobreakfalse\everypar{}}%
%    \endgroup
%  \fi
%}
%\newcommand*\l@chapter[2]{%
%  \ifnum \c@tocdepth >\m@ne
%    \addpenalty{-\@highpenalty}%
%    \vskip 1.0em \@plus\p@
%    \setlength\@tempdima{1.5em}%
%    \begingroup
%      \parindent \z@ \rightskip \@pnumwidth
%      \parfillskip -\@pnumwidth
%      \leavevmode \bfseries
%      \advance\leftskip\@tempdima
%      \hskip -\leftskip
%      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
%      \penalty\@highpenalty
%    \endgroup
%  \fi
%}

\newskip\tlind \tlind=12\p@ % Отступ слева
\newskip\tpind \tpind=22.5\p@ % Отступ справа

\newcommand\vdotfill[1]{\hbox to0pt{\kern-.8\p@\raisebox{\z@}[\z@][\z@]{\vbox to#1{\leaders
   \vbox to 2\p@{\kern2.2\p@\tiny\hbox{.}\vss}\vfill\hbox{}}}}}
\renewcommand\dotfill{\nobreak\leaders\hbox to 6\p@{\rlap{.}\hfil\rlap{.}}\hskip 0pt plus 1fill minus1pt \hbox{}}
\DeclareRobustCommand\tocnumber[1]{\leavevmode\hbox to\tlind{\hss#1\kern2\p@}}

\newcommand*\l@part[2]{\par\addpenalty{-\@highpenalty}\vskip 8mm plus1mm minus.5mm \vspace*{0mm plus.2mm minus.1mm}%
       \hspace{\tlind}{\large\centering\textbf{#1}\par}%
       \penalty\@M \vskip0ex plus.5ex minus.25ex}
\newcommand*\l@chapter[2]{\par\addpenalty{-\@highpenalty}\vskip 4.5ex plus.4ex minus.2ex \vspace*{0mm}
     \leftskip=\z@ \rightskip\tpind \parindent\z@ \hangindent1.5\tlind \small
     \leavevmode#1\nobreak\dotfill\rlap{\hbox to\tpind{\hss{#2}}}\par % Для глав со страницами
     % \centering\leavevmode#1\par % Для глав без страниц
     \nopagebreak \vskip.25ex plus.05ex minus.025ex}
\newcommand*\l@section[2]{\par\vspace{.6ex plus.06ex minus.03ex}
     \leftskip=\tlind \rightskip\tpind \hangindent\leftskip \small
     \leavevmode#1\nobreak\dotfill\rlap{\hbox to\tpind{\hss{#2}}}\par
     \vskip.1ex plus.002ex minus.001ex }
\newcommand*\l@sectionb[2]{\par\vspace*{.5ex plus.4ex minus.2ex}
    \leftskip=\z@ \rightskip\tpind \hangindent\tlind \small
    \leavevmode#1\nobreak\dotfill\rlap{\hbox to\tpind{\hfil{#2}}}\par
    \vskip.1ex plus.05ex minus.025ex }
\newcommand*\l@subsection[2]{\leftskip=2\tlind\rightskip\tpind \small#1\kern.2em(#2).\ }

\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\newcommand\listoffigures{%
  \if@twocolumn\@restonecoltrue\onecolumn\else\@restonecolfalse\fi
  \chapter*{\listfigurename\@mkboth{\MakeUppercase\listfigurename}{\MakeUppercase\listfigurename}}%
  \@starttoc{lof}\if@restonecol\twocolumn\fi
}
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
  \if@twocolumn\@restonecoltrue\onecolumn\else\@restonecolfalse\fi
  \chapter*{\listtablename\@mkboth{\MakeUppercase\listtablename}{\MakeUppercase\listtablename}}%
  \@starttoc{lot}\if@restonecol\twocolumn\fi
}
\let\l@table\l@figure

\newdimen\bibindent
\setlength\bibindent{1.5em}

\newif\ifbibast
\def\@biblabel#1{#1\ifbibast$^*$\fi\global\bibastfalse.}
\def\bibitema#1{\bibasttrue\bibitem{#1}}

\newenvironment{thebibliography}[1]{%
     \list{
     \@biblabel{\@arabic\c@enumiv}
     }%
          {\settowidth\labelwidth{\@biblabel{#1}}%
           \parsep\z@\topsep\z@\partopsep\z@\parskip\z@\labelsep.3em
           \leftmargin\labelwidth
           \advance\leftmargin\labelsep
           \itemsep=1\p@ plus.2\p@ \parsep=\z@
           \@openbib@code
           \usecounter{enumiv}%
           \let\p@enumiv\@empty
           \renewcommand\theenumiv{\@arabic\c@enumiv}%
           \addtocontents{toc}{}%{\vskip4mm}
           \sectiona{\biblioname}%
     }%
     \sfcode`\.\@m
     \let\fio\refio
     \petit
     \exhyphenpenalty=10000
  }
  {\endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}{%
  \if@twocolumn\@restonecolfalse\else\@restonecoltrue\fi
  \columnseprule\z@ \columnsep25\p@
  \small\advance\baselineskip.3pt plus .1pt
  \begin{multicols}{2}[\sectionb{\indexname}]%
  \def\tire{\@ifnextchar,{---}{---\kern.33em}}
  \def\item##1 ##2 {\def\item@w{##1}\def\subitem@w{##2}\@idxitem##1 ##2 }%!
  %! \let\item\@idxitem
  \parindent\z@
  \advance\rightskip \z@ plus 5\p@
  \exhyphenpenalty=10000
  }
  {\end{multicols}}
\newcommand\@idxitem{\par\hangindent 15\p@}
\newif\ifbt
\def\bt@draft@box{\leavevmode\llap{\vrule width \overfullrule height 5\p@\ }}
\def\subitem{\@ifnextchar,\subitem@@\subitem@}
\def\subitem@#1 {\def\subitem@w{#1}\@idxitem \ifbt\bt@draft@box{\let\textbf\relax \item@w} \else \tire \fi #1 \btfalse}
\def\subitem@@, #1 {\def\subitem@w{#1}\@idxitem \ifbt\bt@draft@box{\let\textbf\relax \item@w} \else \tire,\fi #1 \btfalse}
\def\subsubitem{\@ifnextchar,\subsubitem@@\subsubitem@}
\def\subsubitem@{\@idxitem \ifbt\bt@draft@box{\let\textbf\relax \item@w\ \subitem@w} \else \tire\tire \fi \btfalse}
\def\subsubitem@@,{\@idxitem \ifbt\bt@draft@box{\let\textbf\relax \item@w\ \subitem@w} \else \tire\tire,\fi \btfalse}
%! \def\subitem{\@idxitem \tire}
%! \def\subsubitem{\@idxitem \tire\tire}
\def\indexspace#1\item{\par \vskip 15\p@ \@plus2\p@ \@minus1\p@ \item\textbf}
\def\see#1#2{\unskip, {см.} #1}

\renewcommand\footnoterule{\vskip\z@ plus1\p@\kern-3\p@\hrule\@width1in\kern2.6\p@}
\newcommand\@makefntext[1]{\parindent1.55em \petit\leavevmode\!\@makefnmark\;#1}
\renewcommand\@makefnmark{%
  \hbox{\:\@textsuperscript{\normalfont\@thefnmark}\kern-.1em\raisebox{.8\depth}[\z@][\z@]{\textmd{\upshape )}}}%
}
% Удобное сокращение
%\def\makefnmark#1{\def\@thefnmark{#1}\@makefnmark}

\skip\footins=1.2\bigskipamount % space added when footnote is present
\def\thefootnote{\arabic{footnote}}
%\renewcommand\thefootnote{\@fnsymbol\c@footnote}

\def\today{\ifcase\month\or January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi\space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{\z@}
\if@twocolumn \twocolumn\sloppy\flushbottom \else \onecolumn \fi
%% End of file `book.cls'

% В начале главного файла нужно написать: %& -translate-file=cp1251-.tcx
\usepackage[cp1251-]{inputenc}

%\uccode`\Ё=168\uccode`\ё=168\lccode`\Ё=184\lccode`\ё=184 % Для стандартного [cp1251]{inputenc}
%\lccode`\-=`\- \defaulthyphenchar=127 % Чтобы не использовать "= (T2A only)
\catcode`\ё=13
\catcode`\Ё=13
\def ё{е}
\def Ё{Е}

%%%%%%%%%%%%%% Заголовки теорем и пр. %%%%%%%%%%%%%%
\def\blacksqr{\quad\hbox{\footnotesize$\blacksquare$}}
\def\blacksq{\unskip\nobreak\hfill\blacksqr}
\def\whitesqr{\hbox{\footnotesize$\square$}}
\def\whitesqa{\unskip\nobreak\hfill\quad\hbox{\footnotesize$\square$}\par}
\def\whitesq{\unskip\nobreak\hfill\quad\hbox{\footnotesize$\square$}\par\vspace{4pt plus .2pt}}

\def\vsk{\@tempskipb=4pt plus .2pt \@xaddvskip}

\def\uprbf#1{\vskip3pt plus .2pt\textbf{#1}}

\def\zagrn{\vsk\leavevmode\@ifnextchar*\@zagrn\@@zagrn}
\def\@zagrn*#1#2{\soo{#1} #2\;}
\def\@@zagrn#1#2{\soo{#1} #2.\;}

\def\zagr{\vsk\leavevmode\@ifnextchar*\@zagr\@@zagr}
\def\@zagr*#1{\soo{#1}\;}
\def\@@zagr#1{\soo{#1}.\;}

\def\zagbn{\vsk\leavevmode\@ifnextchar*\@zagbn\@@zagbn}
\def\@zagbn*#1#2{\textbf{#1 #2}}
\def\@@zagbn#1#2{\textbf{#1 #2.}}

\def\zagb{\vsk\leavevmode\@ifnextchar*\@zagb\@@zagb}
\def\@zagb*#1{\textbf{#1}}
\def\@@zagb#1{\textbf{#1.}}
%%%%%%%%%%%%%% End Заголовки теорем и пр. %%%%%%%%%%%%%%

\usepackage[T2A]{fontenc}
\usepackage[intlimits]{amsmath} \let\nmlimits@\limits
\usepackage{amsfonts,amssymb}
%\usepackage{mathdmr}
\usepackage{pscyr}

\DeclareSymbolFont{digits}{T2A}{faq}{m}{n}
\SetSymbolFont{digits}{bold}{T2A}{faq}{b}{n}
\DeclareMathSymbol{1}{\mathalpha}{digits}{`1}
\DeclareMathSymbol{2}{\mathalpha}{digits}{`2}
\DeclareMathSymbol{3}{\mathalpha}{digits}{`3}
\DeclareMathSymbol{4}{\mathalpha}{digits}{`4}
\DeclareMathSymbol{5}{\mathalpha}{digits}{`5}
\DeclareMathSymbol{6}{\mathalpha}{digits}{`6}
\DeclareMathSymbol{7}{\mathalpha}{digits}{`7}
\DeclareMathSymbol{8}{\mathalpha}{digits}{`8}
\DeclareMathSymbol{9}{\mathalpha}{digits}{`9}
\DeclareMathSymbol{0}{\mathalpha}{digits}{`0}
\DeclareMathSymbol{,}{\mathpunct}{digits}{`,}
\DeclareMathSymbol{;}{\mathpunct}{digits}{`;}

\DeclareMathAlphabet{\mathsl}{T2A}{dmr}{m}{sl}
\newcommand\gsl{\ifmmode\textsl{g}\else g\fi}% В математике нужна g с хвостиком. Исправлено в фонтах dmr zmr

\usepackage[russian]{babel}
%
\usepackage[gr]{greekup}
%\usepackage{mathrsfs}%{\mathscr{H}}
%\usepackage[mathcal]{euscript}
%\usepackage{artscr}
%
\usepackage{array}
\usepackage{longtable}
\usepackage{tabularx}
\usepackage{dcolumn}
%\usepackage{slashbox}
%
\usepackage{footnpag}
\usepackage{rotate}
\usepackage{multicol}
\usepackage{letterspacing}
%\usepackage{afterpage}
%\usepackage{verbatim}
\usepackage{soul}
%
\usepackage{wrapfig}
\usepackage[dvips]{graphicx}
\usepackage{psfrag}
%\usepackage[dvips]{color}
\usepackage{pstricks} %\usepackage[dvips]{pst-all}
\usepackage[centerlast, small, rm, longtable]{caption2}
\usepackage{ulem}
%\usepackage{bm}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\usepackage{showkeys}
%\usepackage{fancyhdr}
%\usepackage{amscd}
%\usepackage{multirow}
%\usepackage{flafter}
%\usepackage{calc}
%\usepackage{ifthen}
%\usepackage{hhline}
%\usepackage[all]{xypic}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%\usepackage{mathptmx}
%%\usepackage{mathtime}
%%\usepackage{path}

\def\schaptername{Гл.}%  Для колонтитулов
\newcommand\biblioname{Список литературы}
\addto\captionsrussian{%
 \DeclareRobustCommand\tablename{Т\,а\,б\,л\,и\,ц\,а}%
 \DeclareRobustCommand\partname{Ч\,а\,с\,т\,ь}%
 \DeclareRobustCommand\chaptername{Г\,л\,а\,в\,а}%
 \DeclareRobustCommand\appendixname{П\,р\,и\,л\,о\,ж\,е\,н\,и\,е}%
% \DeclareRobustCommand\contentsname{СОДЕРЖАНИЕ}%
}

%\DeclareRobustCommand{ }{\leavevmode\penalty9000 \ }

%% Автоматические переносы в текстовых формулах.
\begingroup
\catcode`+\active
\gdef+{\mathchar"202B\nobreak\discretionary{}{\usefont{OT1}{cmr}{m}{n}\char43}{}}
\catcode`-\active
\gdef-{\mathchar"2200\nobreak\discretionary{}{\usefont{OMS}{cmsy}{m}{n}\char0}{}}
\catcode`=\active
\gdef={\mathchar"303D\nobreak\discretionary{}{\usefont{OT1}{cmr}{m}{n}\char61}{}}
\catcode`<\active
\gdef<{\mathchar"313C\nobreak\discretionary{}{\usefont{OML}{cmm}{m}{it}\char"3C}{}}
\catcode`>\active
\gdef>{\mathchar"313E\nobreak\discretionary{}{\usefont{OML}{cmm}{m}{it}\char"3E}{}}


\catcode`(\active \gdef({\ifmmode\char`(\else\ifhmode\/\fi\textup{\char`(}\fi}
\catcode`)\active \gdef){\ifmmode\char`)\else\ifhmode\/\fi\textup{\char`)}\fi}
\catcode`:\active \gdef:{\ifmmode\char`:\else\ifhmode\/\fi\textup{\char`:}\fi}
\catcode`;\active \gdef;{\ifmmode\char`;\else\ifhmode\/\fi\textup{\char`;}\fi}
\catcode`,\active \gdef,{\ifmmode\char`,\else\ifhmode\/\fi\textup{\char`,}\fi}
\catcode`.\active \gdef.{\ifmmode\char`.\else\ifhmode\/\fi\textup{\char`.}\fi}
\catcode`!\active \gdef!{\ifmmode\char`!\else\ifhmode\/\fi\textup{\char`!}\fi}
\catcode`?\active \gdef?{\ifmmode\char`?\else\ifhmode\/\fi\textup{\char`?}\fi}

%\catcode`0\active \gdef0{\ifmmode\char`0\else\ifhmode\/\fi\textup{\char`0}\fi}
%\catcode`1\active \gdef1{\ifmmode\char`1\else\ifhmode\/\fi\textup{\char`1}\fi}
%\catcode`2\active \gdef2{\ifmmode\char`2\else\ifhmode\/\fi\textup{\char`2}\fi}
%\catcode`3\active \gdef3{\ifmmode\char`3\else\ifhmode\/\fi\textup{\char`3}\fi}
%\catcode`4\active \gdef4{\ifmmode\char`4\else\ifhmode\/\fi\textup{\char`4}\fi}
%\catcode`5\active \gdef5{\ifmmode\char`5\else\ifhmode\/\fi\textup{\char`5}\fi}
%\catcode`6\active \gdef6{\ifmmode\char`6\else\ifhmode\/\fi\textup{\char`6}\fi}
%\catcode`7\active \gdef7{\ifmmode\char`7\else\ifhmode\/\fi\textup{\char`7}\fi}
%\catcode`8\active \gdef8{\ifmmode\char`8\else\ifhmode\/\fi\textup{\char`8}\fi}
%\catcode`9\active \gdef9{\ifmmode\char`9\else\ifhmode\/\fi\textup{\char`9}\fi}

\endgroup

%% Выпрямляем знаки препинания в курсиве. Надо бы сделать на уровне шрифта (виртуального?).
\def\uncatcodedelims{\catcode`(12 \catcode`)12 \catcode`.12 }
\def\activateit{\catcode`(13 \catcode`)13 \catcode`:13 \catcode`;13 \catcode`,13 \catcode`.13 \catcode`!13 \catcode`?13
%     \catcode`0=13 \catcode`1=13 \catcode`2=13 \catcode`3=13 \catcode`4=13
%     \catcode`5=13 \catcode`6=13 \catcode`7=13 \catcode`8=13 \catcode`9=13
     \everymath{\uncatcodedelims}\everydisplay{\uncatcodedelims}%
}
\long\def\takearg#1{#1\/\egroup}
\long\def\acit{\leavevmode\bgroup\itshape\activateit\takearg}
\long\def\acsl{\leavevmode\bgroup\slshape\activateit\takearg}
\newenvironment{actit}{\bgroup\itshape\activateit}{\/\egroup}
\newenvironment{actsl}{\bgroup\slshape\activateit}{\/\egroup}

\AtBeginDocument{\mathcode`+="8000\mathcode`-="8000\mathcode`=="8000\mathcode`<="8000\mathcode`>="8000}

%\def\times{\mathchar"2202\nobreak\discretionary{}{\usefont{OMS}{cmsy}{m}{n}\char2}{}}

\def\times{\mathchar"2202\nobreak\discretionary{}{\hbox{$\mathchar"2202$}}{}}
\def\*{\discretionary{\hbox{$\mskip\medmuskip\mathchar"2202$}}{\hbox{$\mathchar"2202 \mskip\medmuskip$}}{}}
\def\equiv{\mathchar"3211\nobreak\discretionary{}{\hbox{$\mathchar"3211$}}{}}

\def\subseteq{\mathchar"3212\nobreak\discretionary{}{\hbox{$\mathchar"3212$}}{}}
\def\supseteq{\mathchar"3213\nobreak\discretionary{}{\hbox{$\mathchar"3213$}}{}}
\def\subset{\mathchar"321A\nobreak\discretionary{}{\hbox{$\mathchar"321A$}}{}}
\def\supset{\mathchar"321B\nobreak\discretionary{}{\hbox{$\mathchar"321B$}}{}}
\def\prec{\mathchar"321E\nobreak\discretionary{}{\hbox{$\mathchar"321E$}}{}}
\def\succ{\mathchar"321F\nobreak\discretionary{}{\hbox{$\mathchar"321F$}}{}}

\def\sim{\mathchar"3218\nobreak\discretionary{}{\hbox{$\mathchar"3218$}}{}}
\def\simeq{\mathchar"3227\nobreak\discretionary{}{\hbox{$\mathchar"3227$}}{}}
\def\approx{\mathchar"3219\nobreak\discretionary{}{\hbox{$\mathchar"3219$}}{}}
\def\propto{\mathchar"322F\nobreak\discretionary{}{\hbox{$\mathchar"322F$}}{}}
\def\gtrsim{\mathchar"3426\nobreak\discretionary{}{\hbox{$\mathchar"3426$}}{}}
\def\lesssim{\mathchar"342E\nobreak\discretionary{}{\hbox{$\mathchar"342E$}}{}}
\def\in{\mathchar"3232\nobreak\discretionary{}{\hbox{$\mathchar"3232$}}{}}
\def\ne{\mathrel{\not\mathchar"303D}\nobreak\discretionary{}{\hbox{$\not\mathchar"303D$}}{}}
\def\le{\mathchar"3436\nobreak\discretionary{}{\hbox{$\mathchar"3436$}}{}}
\def\ge{\mathchar"343E\nobreak\discretionary{}{\hbox{$\mathchar"343E$}}{}}
\def\ll{\mathchar"321C\nobreak\discretionary{}{\hbox{$\mathchar"321C$}}{}}
\def\gg{\mathchar"321D\nobreak\discretionary{}{\hbox{$\mathchar"321D$}}{}}
\def\pm{\mathchar"2206\nobreak\discretionary{}{\hbox{$\mathchar"2206$}}{}}
\def\mp{\mathchar"2207\nobreak\discretionary{}{\hbox{$\mathchar"2207$}}{}}
\def\cap{\mathchar"225C\nobreak\discretionary{}{\hbox{$\mathchar"225C$}}{}}
\def\cup{\mathchar"225B\nobreak\discretionary{}{\hbox{$\mathchar"225B$}}{}}

\def\leftarrow{\mathchar"3220\nobreak\discretionary{}{\hbox{$\mathchar"3220$}}{}}
\def\rightarrow{\mathchar"3221\nobreak\discretionary{}{\hbox{$\mathchar"3221$}}{}}
\def\Leftarrow{\mathchar"3228\nobreak\discretionary{}{\hbox{$\mathchar"3228$}}{}}
\def\Rightarrow{\mathchar"3229\nobreak\discretionary{}{\hbox{$\mathchar"3229$}}{}}
\def\Leftrightarrow{\mathchar"322C\nobreak\discretionary{}{\hbox{$\mathchar"322C$}}{}}
\let\to=\rightarrow

\def\cdot{\mathchar"2201\nobreak\discretionary{}{\hbox{$\mathchar"2201$}}{}}
% Идея Сигова А.С.
%\let\cdotf\cdot
%\def\cdot{\mathchar"2201\nobreak\discretionary{%
%    \psset{fillcolor=white,framesep=3\p@}\rput*[b](0,.07){}\kern-.3em
%    \hbox{$\mathchar"2202$}}{\hbox{$\mathchar"2202$}}{}}



% old
%\def\dots{\nobreak\ldots\nobreak\discretionary{}{\hbox{\ldots}}{}}
%\def\textellipsis{.\kern.5\fontdimen3\font.\kern.5\fontdimen3\font.}
%\def\mathellipsis{\mathinner{\ldotp\kern-1\p@\ldotp\kern-1\p@\ldotp}}

% dvg
\let\savedots=\dots \let\saveldots=\ldots
\def\textellipsis{.\kern.5\fontdimen3\font.\kern.5\fontdimen3\font.}
\def\ldotp@{\hbox{.}}
\def\mathellipsis{\mathinner{\mathchoice%
  {\ldotp@\mkern2mu\ldotp@\mkern2mu\ldotp@}%
  {\ldotp@\mkern2mu\ldotp@\mkern2mu\ldotp@}%
  {\ldotp@\mkern.5mu\ldotp@\mkern.5mu\ldotp@}%
  {\ldotp@\ldotp@\ldotp@}%
}}
\def\ldots@{\ifmmode\def\ldots@@{\hbox{$\mathellipsis$}}\mathellipsis\else\let\ldots@@\textellipsis\textellipsis\fi}
\def\dots{\nobreak\ldots@\nobreak\discretionary{}{\ldots@@}{}}
\let\ldots=\dots
\def\@cdots{\mathinner{\cdotp\mkern-1mu\cdotp\mkern-1mu\cdotp}}


\let\old@min\-
\def\-{\ifmmode -\else\old@min\fi}
\let\old@plus\+
\def\+{\ifmmode +\else\old@plus\fi}
\let\old@equiv\=
\def\={\ifmmode =\else\old@equiv\fi}

\newdimen\curradvskip
\newcommand\normalskip{%
  %\spaceskip=.334em plus.167em minus .09em
  \abovedisplayskip 6\p@ \@plus1\p@ \@minus.3\p@
  \belowdisplayskip 6\p@ \@plus1\p@ \@minus.3\p@
  \abovedisplayshortskip -2\p@ \@plus.5\p@ \@minus.2\p@
  \belowdisplayshortskip 6\p@ \@plus1\p@ \@minus.3\p@
  \abovecaptionskip=\z@ plus 2\p@ minus 1\p@
  \belowcaptionskip=\abovecaptionskip
  \columnsep=5mm
  \intextsep=3mm plus .3mm minus .1mm
  \textfloatsep=\intextsep \floatsep=\intextsep
  % \extrarowheight=30\p@
  \sectionskipa=4.5ex \@plus .2ex \@minus .1ex
  \sectionskipb=-1ex \@plus .3ex \@minus .2ex
  \sectionskipc=1.5ex \@plus .1ex \@minus .1ex
  \subsectionskip=1ex \@plus .4ex \@minus .2ex
  \curradvskip\z@
}
\AtBeginDocument{\normalskip}
\newcommand\advskip[1]{%
   \ifdim\curradvskip=\z@ \else
      \@tempdima#1 \relax
      \ifdim\@tempdima=\z@ \else
         \typeout{Warning: advskip \curradvskip\space => #1}%
      \fi
      \normalskip
   \fi
   \curradvskip=#1
%!!!!!!!!!!!!!!!!!   \advance\baselineskip .05\curradvskip
   \advance\abovedisplayskip \curradvskip
   \advance\belowdisplayskip \curradvskip
   \advance\abovedisplayshortskip .5\curradvskip
   \advance\belowdisplayshortskip \curradvskip
   \advance\intextsep \curradvskip
   \advance\textfloatsep \curradvskip
   \advance\floatsep \curradvskip
   \advance\sectionskipa \curradvskip
   \advance\sectionskipb \curradvskip
   \advance\sectionskipc \curradvskip
   \advance\subsectionskip \curradvskip
}

\newcommand\fio[3][*]{{\ifx#1*#3~\hskip\z@ plus-1\p@ #2.\/\else#3~\hskip\z@ plus-1\p@ #1.{\kern.1em}#2.\/\fi}}  % Фамилия И.О.
\newcommand\io[3][*]{{\ifx#1*#2.~\hskip-1\p@ plus-1\p@ #3\/\else#1.{\kern.1em}#2.~\hskip-1\p@ plus-1\p@ #3\/\fi}}   % И.О. Фамилия
\newcommand\refio[3][*]{{\itshape\ifx#1*#3~\hskip\z@ plus-1\p@ #2.\/\else#3~\hskip\z@ plus-1\p@ #1.{\kern.1em}#2.\/\fi}} % \it Фамилия И.О.

\@ifundefined{is@draft}{\let\rhere\@gobble}{
   \newcommand\rhere[1]{\marginpar{\@ifundefined{color}{}{\color[rgb]{.6,.6,.6}}\footnotesize#1}}
}

\newcommand\di{\,d}
\newcommand\ab[1][a]{,\,{#1}}
\newcommand\parf{{\parfillskip=\z@\par}}
\newcommand\parb{{\brokenpenalty=\z@\par}}
\newcommand\vertic{\;|\;}

\newcommand\by[2]{{#1\mathord{\left/\vphantom{#1#2}\right.\kern-\nulldelimiterspace}#2}}
\newcommand\sby[2]{{\m@th\lower-1\p@\hbox{$\scriptstyle#1$}\kern-1\p@/\kern-1\p@\lower1\p@\hbox{$\scriptstyle#2$}}}

\newcount\@frfc \@frfc=\@ptsize \advance\@frfc 9
\newcommand\varfrac[3]{\bgroup%
  \ifdim\f@size\p@>10.9\p@\@frfc10\else%
    \ifdim\f@size\p@>9.9\p@\@frfc9\else%
      \ifdim\f@size\p@>8.9\p@\@frfc8\else%
        \ifdim\f@size\p@>7.9\p@\@frfc7%
  \fi\fi\fi\fi%
  \mathchoice{\hbox{\fontsize{\@frfc}{\@frfc}\selectfont$\displaystyle#1{\displaystyle#2}{\displaystyle#3}$}}
    {\hbox{\fontsize{\@frfc}{\@frfc}\selectfont$\displaystyle#1{\displaystyle#2}{\displaystyle#3}$}}
    {\hbox{\fontsize{\@frfc}{\@frfc}\selectfont$\textstyle#1{#2}{#3}$}}
    {\hbox{\fontsize{\@frfc}{\@frfc}\selectfont$\scriptstyle#1{#2}{#3}$}}%
\egroup}

\let\savefrac=\frac
\let\savegenfrac=\genfrac
\def\frac#1#2{\varfrac{\savefrac}{#1}{#2}}
\def\newatop#1#2{\varfrac{\genfrac{}{}{\z@}{0}}{#1}{#2}}
\def\newchoose#1#2{\left(\varfrac{\genfrac{}{}{\z@}{0}}{#1}{#2}\right)}
\let\fr=\frac
\def\Frac@#1/#2\nil{\frac{#1}{#2}} \newcommand\Frac[1]{\Frac@#1\nil}
\newcommand\ffrac[2]{#1/#2}
\newcommand\ffracb[2]{#1/(#2)}


\newcommand\petit{\fontsize{9}{11}\selectfont
  \advance\baselineskip\z@ plus.04\p@ minus.02\p@
  \advance\@frfc -1
  \abovedisplayskip 3\p@ \@plus.3\p@ \@minus.15\p@
  \belowdisplayskip 3\p@ \@plus.3\p@ \@minus.15\p@
  \abovedisplayshortskip -2\p@ \@plus.25\p@
  \belowdisplayshortskip 3\p@ \@plus.3\p@ \@minus.15\p@
  \abovecaptionskip=\z@ plus 1\p@ minus.5\p@
  \belowcaptionskip=\abovecaptionskip
  \columnsep=3.5mm
  \intextsep=2.5mm plus.25mm minus.1mm
  \textfloatsep=\intextsep \floatsep=\intextsep
}

\DeclareSymbolFont{EulerExtension}{U}{euexz}{m}{n}
\DeclareMathSymbol\intop\mathop{EulerExtension}{"52}
\DeclareMathSymbol\ointop\mathop{EulerExtension}{"48}
\def\intkern@{\mkern1mu\nonscript\mkern1mu}

\def\biggg{\bBigg@{3}}
\def\bigggl{\mathopen\biggg}
\def\bigggm{\mathrel\biggg}
\def\bigggr{\mathclose\biggg}
\def\Biggg{\bBigg@{3.5}}
\def\Bigggl{\mathopen\Biggg}
\def\Bigggm{\mathrel\Biggg}
\def\Bigggr{\mathclose\Biggg}

%%%%%%%%%%%%%%%% SOUL %%%%%%%%%
\@ifundefined{sodef}{}{
\setul{.5ex}{.1ex}
 \def\SOUL@soeveryhyphen{%
     \@tempskipa\SOUL@soletterskip
     \SOUL@hyphkern-\@tempskipa
     \discretionary{%
         \unkern
         \SOUL@setkern\SOUL@hyphkern
         \char\hyphenchar\font
     }{}{}%
 }
\sodef\sood{}{.18em plus .01em minus 0.005em}{.65em plus .1em minus .05em}{.6em plus .1em minus .05em}
\def\soo#1{{\sood{#1}}}

\sodef\gso{}{0em plus .01em}{.333em plus .167em minus .111em}{.333em plus .167em minus .111em}
\sodef\pso{}{.02em plus.001em}{.333em plus .16em minus .1em}{.33em plus .1em minus .1em}
\sodef\mso{}{-.01em}{.32em plus .1em minus .07em}{.3em plus .1em minus .07em}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%?\newcommand\ar[1]{\hbox{\arraycolsep=.7mm\fontsize{9}{10}\selectfont\def\fracfont{8}$\displaystyle#1$}}
% in amsmath exist analog

\def\@cite#1#2{{\rm \lbc{#1\if@tempswa , #2\fi}\rbc}}
\def\lbc{[}\def\rbc{]}
\def\bcite#1{{\def\lbc{}\def\rbc{}\cite{#1}}}

\let\ref@save\ref
\def\ref#1{\textup{\ref@save{#1}}}

\newcommand\loosehyph{{\doublehyphendemerits=0\hyphenpenalty=10\finalhyphendemerits=0\par}}
\newcommand\hardhyph{{\doublehyphendemerits=9900\hyphenpenalty=999\par}}
\newcommand\surfig{\petit\loosehyph\belowcaptionskip=\z@\abovecaptionskip=6\p@}
\renewcommand{\captionlabelfont}{}
\renewcommand{\captionfont}{\petit}

%%%%%%%%%%%%% plog %%%%%%%%%%%%%%%%%%%%%%%%%%%

\graphicspath{{eps/}}
\def\eps@ext{.eps}
\newtoks\Gin@logtoks

\def\Ginclude@graphics#1{%
  \begingroup
  % Метка с именем файла
  % \advance\c@figure1 \edef\@currentlabel{\thefigure}\label{f:#1}\advance\c@figure-1 % fml added
  \let\input@path\Ginput@path
  \filename@parse{#1}%
  \Gin@logtoks={}% fml added
  \ifx\filename@ext\relax
    \@for\Gin@temp:=\Gin@extensions\do{%
      \ifx\Gin@ext\relax
        \Gin@getbase\Gin@temp
      \fi}%
      \ifx\Gin@ext\relax
           \nopict@latex@error{File `#1.*' not found}%  fml change \@latex@error{File `#1' not found}%
           {I could not locate the file with any of these extensions:^^J%
            \Gin@extensions^^J\@ehc}%
       \fi
  \else
    \Gin@getbase{\Gin@sepdefault\filename@ext}%
    \ifx\Gin@ext\relax
       \nopict@latex@error{File `#1' not found}{I could not locate this file}%  fml change: \@warning{File `#1' not found}%
       \def\Gin@base{\filename@area\filename@base}%
       %\edef\Gin@ext{\Gin@sepdefault\filename@ext}%
    \fi
  \fi
  \ifx\Gin@ext\relax
  \else
     \ifx\Gin@ext\eps@ext \input@frags\fi % fml add
     \@ifundefined{Gin@rule@\Gin@ext}%
       {\ifx\Gin@rule@*\@undefined
          \@latex@error{Unknown graphics extension: \Gin@ext}\@ehc
        \else
          \expandafter\Gin@setfile\Gin@rule@*{\Gin@base\Gin@ext}%
         \fi}%
       {\expandafter\expandafter\expandafter\Gin@setfile
           \csname Gin@rule@\Gin@ext\endcsname{\Gin@base\Gin@ext}}%
  \fi
  \ifx\Gin@ext\relax \def\Gin@ext{.*}\fi
  \Gin@logtoks=\expandafter{\the\Gin@logtoks \filename@base\Gin@ext}% fml add
  \Gin@writelog% fml add
  \endgroup}

\def\verbprint{\bgroup\@verbprint}
\def\@verbprint{\futurelet\@tmpleta\@@verbprint}
\def\@@verbprint#1{%
   \ifx\@tmpleta\nill
      \let\next\egroup
   \else
      \if\@tmpleta\space
         \space#1%
      \else\if\@tmpleta$\char`\$
      \else\if\@tmpleta&\char`&
      \else\if\@tmpleta##\char`\#
      \else\if\@tmpleta^\char`\^
      \else\if\@tmpleta_\char`\_
      \else
        \@tmpleta
      \fi\fi\fi\fi\fi\fi
         \let\next\@verbprint
   \fi\next
}

\@ifundefined{is@frags}{\let\input@frags\relax}
{%
  \def\input@frags{\IfFileExists{\Gin@base.tex}{\input \Gin@base.tex \Gin@logtoks=\expandafter{\the\Gin@logtoks\space+ tex}}{}}%
  \input eps/clear_frags.tex
}

\@ifundefined{is@pictlog}
  {\let\nopict@latex@error=\@latex@error \let\Gin@writelog=\relax}
  {%
%    \newcounter{prevfig}% Если хотим пронумеровать по порядку
%    \newcounter{subfig}%
    \newwrite\Gout@handle
    \immediate\openout\Gout@handle figs.log\relax
    \def\nopict@latex@error#1#2{\Gin@logtoks=\expandafter{\the\Gin@logtoks ##- }\verbprint#1\@nill}%
    \def\Gin@writelog{%
      \addtocounter{figure}{1}%
%      \ifnum\c@prevfig=\c@figure
%        \global\advance\c@subfig1
%        \edef\@tempdefa{\thefigure\@alph\c@subfig}%
%      \else
%        \global\c@subfig=0
        \edef\@tempdefa{\thefigure}%
%      \fi
      \Gin@logtoks=\expandafter{\the\Gin@logtoks \space \@tempdefa }%
      \immediate\write\Gout@handle\expandafter{\the\Gin@logtoks}%
%      \global\c@prevfig=\c@figure
      \addtocounter{figure}{-1}%
    }%
  }

%%%%%%%%%%%%% end plog %%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\capt@{\vskip3mm\par}

\newif\ifcenterfig % Включает отступ рисунков \dfig от края полосы
\centerfigtrue

\newcommand\wfigside{o} % Outer для рисунков в оборку
\newcommand\wfig[3][]{%
  \setbox1=\hbox{\surfig\includegraphics#2}%
     \begin{wrapfigure}[#1]{\wfigside}{\wd1}%
  \surfig
  \box1#3\end{wrapfigure}%
\def\wfigside{o}\ignorespaces}

\newcommand\fig[3][htbp]{\begin{figure}[#1]\surfig\centering{\includegraphics#2}#3\end{figure}\ignorespaces}

\newcommand\figcs[3][htbp]{%
  \setbox1=\hbox{\surfig\includegraphics#2}%
  \@tempdima=\textwidth \advance\@tempdima-\wd1 \advance\@tempdima-5mm
  \begin{figure}[#1]\surfig\centering\leavevmode\box1\kern5mm\parbox[b]{\@tempdima}{#3}\end{figure}\ignorespaces
}

\newcommand\rotfig[3][p]{\begin{figure}[#1]\surfig\centering
  \rotatebox{90}{\parbox{\textheight}{\centering{\includegraphics#2}#3}}\end{figure}\ignorespaces
}

\newcommand\dfig[5][htbp]{\setbox1=\hbox{\surfig\includegraphics#2}%
\begin{figure}[#1]\surfig\ifcenterfig\centering\else\parfillskip\z@\fi
 \parbox[t]{\wd1}{\centering\box1#3}\nobreak\hfil\hfil
  \setbox2=\hbox{\surfig\includegraphics#4}%
 \parbox[t]{\wd2}{\centering\box2#5}%
\end{figure}\ignorespaces}

\newcommand\mfig[1][htbp]{\begin{figure}[#1]\surfig\ifcenterfig\centering\else\parfillskip\z@\fi\@mfig}
\def\@mfig{\@ifnextchar>\@mfigend\@mfigur}
\def\@mfigur#1#2{%
 \setbox1=\hbox{\includegraphics#1}%
 \parbox[t]{\wd1}{\centering\box1#2}\hfil\hfil
 \@mfig
}
\def\@mfigend>{\hfilneg\hfilneg\null\end{figure}\ignorespaces}

\newcommand\mabfig[1][htbp]{\begin{figure}[#1]\surfig\ifcenterfig\centering\else\parfillskip\z@\fi\@mabfig}
\def\@mabfig{%
  \@ifnextchar>\@mabfigend{\@ifnextchar=\@mabnewline\@mabfigur}%
}
\def\@mabnewline={\hfilneg\hfilneg\null\endgraf\vspace{2mm}\@mabfigur}
\def\@mabfigur#1#2{%
 \setbox1=\hbox{\includegraphics#1}%
 \parbox[t]{\wd1}{\centering\box1 #2\vskip3mm}\hfil\hfil
 \@mabfig
}
\def\@mabfigend>#1{\hfilneg\hfilneg\null\endgraf\vspace{-3mm}#1 \end{figure}\ignorespaces}

\newcommand\dwfig[5][0]{\setbox1=\hbox{\surfig\includegraphics#2}%
\setbox2=\hbox{\surfig\includegraphics#4}%
\@tempdima\wd1 \advance\@tempdima\wd2 \advance\@tempdima5mm
\if0#1 \begin{wrapfigure}{\wfigside}{\@tempdima}\else\begin{wrapfigure}[#1]{\wfigside}{\@tempdima}\fi\surfig
 \parbox[t]{\wd1}{\centering\box1#3}\kern5mm
 \parbox[t]{\wd2}{\centering\box2#5}%
\end{wrapfigure}\def\wfigside{o}\ignorespaces}

\newcommand\wldfig[6][2]{\unskip
\setbox1=\hbox{\surfig\includegraphics#2}%
\setbox2=\hbox{\surfig\includegraphics#4}%
\@tempdima=\ht2\advance\@tempdima-\ht1\advance\@tempdima#6\vspace{\@tempdima}
\hangindent=\wd1\advance\hangindent5mm\hangafter=#1\wdfig@parf
\begin{figure}[h]\surfig
\parbox[t]{\wd1}{\centering\box1\capt@{#3}}\kern3mm\hfill
 \parbox[t]{\wd2}{\centering\box2\capt@{#5}}\hfill\null
\end{figure}\noindent\ignorespaces}
%  \wldfig[3]{{2-21}}{К задаче 2.21}{{2-23}}{К задаче 2.23}{0mm}

\newcommand\wdfig[6]{\unskip
\setbox1=\hbox{\surfig\includegraphics#2}%
\setbox2=\hbox{\surfig\includegraphics#4}%
\wdfig@parf
{\@tempdima=\ht2\advance\@tempdima-\ht1
\ifnum\@tempdima>0 \multiply\@tempdima-1
  \rightskip=\wd2\advance\rightskip5mm\def\lgl{\hfill}\def\rgl{}
  \else\leftskip=\wd1\advance\leftskip5mm\def\lgl{}\def\rgl{\hfill\null}\fi
\parindent0pt\advance\@tempdima3mm\advance\@tempdima#6
\ignorespaces#1\wdfig@parf\vspace{\@tempdima}%
\begin{figure}[h]\surfig
\lgl\parbox[t]{\wd1}{\centering\box1\capt@{#3}}\kern3mm\hfill
 \parbox[t]{\wd2}{\centering\box2\capt@{#5}}\rgl%
\end{figure}\noindent}\ignorespaces}
%  \wldfig{Текст}{{2-21}}{К задаче 2.21}{{2-23}}{К задаче 2.23}{0mm}

%Рисунок на строке (с большой глубиной)
\newcommand\infig[1]{\setbox0=\hbox{\includegraphics{#1}}\@tempdima=\ht0
  \dp0=4mm\relax\advance\@tempdima-.6\baselineskip\lower\@tempdima\box0}

%\newcommand\exttext{\fontseries{sx}\selectfont}  %% расширенный шрифт
%\newcommand\condtext{\fontseries{sd}\selectfont} %% сжатый шрифт
%\newcommand\sccmr{\fontfamily{cmr}\fontshape{sc}\selectfont}

\topsep=1.5\topsep
\hbadness=9000 \vbadness=10000
\tolerance=1000 \emergencystretch=20\p@
\adjdemerits=100
\widowpenalty=10000 \clubpenalty=10000
\hyphenpenalty=300\doublehyphendemerits=9000\finalhyphendemerits=100
\displaywidowpenalty=9000
\interdisplaylinepenalty=9999
\binoppenalty=10000 \relpenalty=10000
\exhyphenpenalty=9999
\mathsurround=\z@
\multlinegap=\z@ \multlinetaggap10\p@
\delimitershortfall=5\p@
\delimiterfactor=851
\DeclareRobustCommand{\hardbreakspace}{\leavevmode\penalty10000 \ }
%\hfuzz=10\p@%0.5\p@
%\raggedbottom
%\mathindent=\parindent
\let\@outputpage@save\@outputpage
\def\@outputpage{\@outputpage@save\ifodd\c@page \global\brokenpenalty=0 \else\global\brokenpenalty=0 \fi}

\def \@begindvi{%
  \unvbox \@begindvibox
  \global\let \@begindvi \@everypagedvi
}
\@ifundefined{is@frame}{%
  \def\@everypagedvi{}%
}{%
  \def\@everypagedvi{%
        \moveright\@themargin%
        \vbox to\z@{\@ifundefined{color}{}{\color[rgb]{.8,.8,.8}}%
        \baselineskip\z@skip\lineskip\z@skip\lineskiplimit\z@%
        \vskip\topmargin\vbox to\z@{\vss\hrule width\textwidth}%
        \vskip\headheight\vbox to\z@{\vss\hrule width\textwidth}%
        \vskip\headsep\vbox to\z@{\vss\hrule width\textwidth}%
        \hbox to\textwidth{\llap{\vrule height\textheight}\hfil%
        \vrule height\textheight}%
        \vbox to\z@{\vss\hrule width\textwidth}%
        \vskip\footskip\vbox to\z@{\vss\hrule width\textwidth}%
        \vss}%
  }
}

\thinmuskip=3mu
\medmuskip=4mu plus 1mu minus .5mu
\thickmuskip=5mu plus 1.5mu minus .7mu

\newcommand\@sdvig{.13\p@}
\newcommand\thor[1]{\rlap{\kern-\@sdvig#1}\rlap{\kern\@sdvig#1}#1}
\newcommand\tver[2]{\setbox1=\hbox{\thor{\hbox{$#1#2$}}}%
  \rlap{\raisebox{\@sdvig}[0pt][0pt]{\copy1}}\rlap{\raisebox{-\@sdvig}[0pt][0pt]{\copy1}}\copy1}
\newcommand\mb[1]{\mathpalette\tver{#1}} % Полужирный для бедных

\newcommand\exam[2][1.3]{\leavevmode\letterspace to#1\naturalwidth{#2}\,} % Разрядка

\DeclareRobustCommand\ve[1]{{\makegreekvec\mathbf{#1}}}          % Вектор
\DeclareRobustCommand\op[1]{\mathop{\operator@font #1}\nolimits} % Математический оператор
\DeclareRobustCommand\up[1]{{\text{\upshape #1}}}                         % Текст в формуле

\newcommand\squar{\op{\square}}
\let\wt\widetilde     \let\wh\widehat
\let\ol\overline      \let\bar\overline
\let\hat\widehat      \let\tilde\widetilde
\let\uls\ul           \let\ul\uline
\let\>\rangle         \let\<\langle
\let\leq\le           \let\geq\ge
\let\ds\displaystyle  \let\ts\textstyle  \let\scs\scriptstyle
\let\vep\varepsilon   \let\epsilon\varepsilon
\let\kap\varkappa     %\let\kappa\varkappa
\let\phi\varphi       %\let\Phi\Phi@cmr
%\let\theta\vartheta   
\let\vec\ve
\let\emptyset\varnothing

\let\log\ln             \let\tan\tg
\let\tanh\th            \let\sinh\sh
\let\cosh\ch            \let\arctan\arctg
\let\neq\ne

%dvg
\def\Left#1\right{#1}
\def\aleft#1\right{\bigl #1\bigr}
\def\bleft#1\right{\Bigl #1\Bigr}
\def\cleft#1\right{\biggl #1\biggr}
\def\dleft#1\right{\Biggl #1\Biggr}
\def\eleft#1\right{\bigggl #1\bigggr}
\def\fleft#1\right{\Bigggl #1\Bigggr}

\newdimen\olitc@extr@space \olitc@extr@space.5ex
\newtoks\@temptkna \newtoks\@temptknb
\newcommand\olitco[2][\overline]{{\def\itc@cmd{#1}\mathpalette\@olitco{#2}}}
\newcommand\@olitco[2]{{%
  \setbox\@tempboxa=\hbox{$#2$}\@tempdima=\ht\@tempboxa
  \@tempdima=.25\@tempdima
  \setbox\@tempboxa=\hbox{$#1#2$}%
  \@tempdimb=\ht\@tempboxa \advance\@tempdimb\olitc@extr@space
  \setbox\@tempboxa=\hbox{$#1\kern\@tempdima
         \itc@cmd{\kern-\@tempdima#2}$}%
  \ht\@tempboxa=\@tempdimb
  \box\@tempboxa
}}

\newcommand\olitcon[3][\overline]{{\def\itc@cmd{#1}\def\@tempdefa{#2} \mathpalette\@olitcon{#3}}}
\newcommand\@olitcon[2]{{%
  \setbox\@tempboxa=\hbox{$#2$}\@tempdima=\ht\@tempboxa
  \@tempdima=.25\@tempdima
  \setbox\@tempboxa=\hbox{$#1#2$}%
  \@tempdimb=\ht\@tempboxa \advance\@tempdimb\olitc@extr@space
  \expandafter\@tempcnta\@tempdefa
  \loop
     \@temptkna=\expandafter{\the\@temptkna\itc@cmd\bgroup}
     \@temptknb=\expandafter{\the\@temptknb \egroup}
      \advance\@tempcnta-1
  \ifnum\@tempcnta>0 \repeat
  \edef\@tempdefa{\the\@tempcnta}
  \setbox\@tempboxa=\hbox{$#1\kern\@tempdima
         \the\@temptkna
         \kern-\@tempdima#2
         \the\@temptknb
         $}%
  \ht\@tempboxa=\@tempdimb
  \box\@tempboxa
}}


\newcommand\mathacc[2]{\overset{\raisebox{-0.25em}[0pt][0pt]{$\smash{\scriptscriptstyle#1}$}}{#2}}

\newcommand\lbar{\raisebox{.75ex}[\z@][\z@]{\hbox to \z@{\kern.75\p@\footnotesize--\hss}}\lambda}
\newcommand\prop{\mathbin{\hbox{\raisebox{1\p@}{\includegraphics{propto.eps}}}}}
\newcommand\0{{\leavevmode\phantom{0}}}
\newcommand\noscr[1]{{\lower-1\p@\hbox{\lefteqn{\scriptstyle\smash{{\mkern1mu}#1}}}}}
\newcommand\grdC{\;\hbox{$^\circ$\kern-.5\p@\fontshape{n}\selectfont C}}
\newcommand\grdK{\;\hbox{$^\circ$\kern-.5\p@\fontshape{n}\selectfont K}}
\def\AA{{\fontfamily{cmr}\selectfont\r A}}

\DeclareRobustCommand\rim[1]{\@xp\@rim#1\@nil}
\def\@rim#1{\ifx#1\@nil \let\do\relax\kern.04em \else\text{#1}\kern-.04em \let\do\@@rim\fi\do}
\def\@@rim#1{\@xp\@rim{#1}}

\newcommand\sqr[1]{\sqrt{\strut\raisebox{-1\p@}{$\smash{#1}$}}}
\let\sqrt@\sqrt
\renewcommand\sqrt[2][*]{\ifx#1*\sqrt@{#2}\else\sqrt@[#1]{#2}\fi\,}
\def\root#1\of{\setbox\rootbox\hbox{$\m@th\scriptstyle{#1}$}\mathpalette\r@@t}

\newcommand\surtab{\petit\centering\extrarowheight=1\p@ \def\arraystretch{1.4}\tabcolsep3.6\p@ \doublerulesep=0.09\p@%
     \advance\belowcaptionskip3\p@ \mathsurround\z@ \hyphenpenalty\z@ \doublehyphendemerits\z@ }
\newcommand\tcaption[2][0pt]{%
   \def\@tempa{#2}%
   \addtocounter{table}{1}\surtab\edef\@currentlabel{\thetable}%
   \ifx\@tempa\@empty \hfill \exam{Таблица} \thetable\kern#1 \else\exam{Таблица} \thetable. #2\fi
   \vskip3pt\par
}
\newcommand\ltcaption[2][0pt]{%
  \def\@tempa{#2}%
  \addtocounter{table}{1}\vskip12pt\surtab\edef\@currentlabel{\thetable}%
  \ifx\@tempa\@empty \hfill \exam{Таблица} \thetable\kern#1 \else\exam{Таблица} \thetable. #2\fi
  \vskip-6pt\par \addtocounter{table}{-1}%
}
%\multicolumn{2}{r@{}}{{Продолжение табл.} \thetable}\\\hline

\renewcommand\tabularxcolumn[1]{m{#1}}
\newcolumntype{x}[1]{>{\raggedleft\arraybackslash\setlength{\hsize}{#1\hsize}\hskip0pt\relax }X}
\newcolumntype{y}[1]{>{\centering\arraybackslash\setlength{\hsize}{#1\hsize}\hskip0pt\relax }X}
\newcolumntype{z}[1]{>{\raggedright\arraybackslash\setlength{\hsize}{#1\hsize}\hskip0pt\relax }X}
\newcolumntype{R}{>{\raggedleft\arraybackslash\hskip0pt\relax }m}
\newcolumntype{C}{>{\centering\arraybackslash\hskip0pt\relax }m}
\newcolumntype{L}{>{\raggedright\arraybackslash\hskip0pt\relax }m}
\newcolumntype{P}{>{\raggedleft\arraybackslash\hskip0pt\relax }p}
\newcolumntype{O}{>{\centering\arraybackslash\hskip0pt\relax }p}
\newcolumntype{I}{>{\raggedright\arraybackslash\hskip0pt\relax }p}

\def\PBS#1{\let\temp=\\%
  #1%
  \let\\=\temp
}


\@ifundefined{is@draft}{%
   \newcommand\rottab[1]{\noindent\hfil\rotatebox{90}{\parbox{\textheight}{#1}}}%
}{%
 \newcommand\rottab[1]{
   \hbox to \textwidth{%
     \hbox to \textwidth{\hss\vrule height.5\textwidth depth.5\textwidth
       \raisebox{-.5\textwidth}{\vbox to\textwidth{\hrule width\textheight\vfill\hrule width\textheight}}%
       \vrule height.5\textwidth depth.5\textwidth\hss}\hss%
    \lower2mm\hbox to \textwidth{\hss\parbox{\textheight}{#1}\hss}}%
    \@tempdima=\textheight \advance\@tempdima-\textwidth
    \vspace*{.9\@tempdima}%
 }%
}
\long\def\rottabul#1#2{\surtab\raggedright
                            \rotatebox{90}{\parbox{\textheight}{\centering
   \begin{tabular}{#1}#2\end{tabular}}}
}

% Modifies array
\def\eq@xarraycr{\@ifnextchar[\@xargarraycr{\ifnum 0=`{}\fi\@yargarraycr}}
\def\eq@xargarraycr[#1]{\ifnum0=`{}\fi\cr\noalign{\vskip3pt\vskip.5\prevdepth\vskip #1}\displaystyle}
\def\eq@yargarraycr{\cr\noalign{\vskip3pt\vskip.5\prevdepth}\displaystyle}
\def\eq@array{\let\@xarraycr\eq@xarraycr\let\@xargarraycr\eq@xargarraycr\let\@yargarraycr\eq@yargarraycr}

%\newcommand\bear{\begin{equation}\arraycolsep=0pt\eq@array\begin{array}{c}\displaystyle}
%\newcommand\eear{\end{array}\end{equation}}
%\newcommand\bearn{\begin{equation}\nonumber\arraycolsep=0pt\eq@array\begin{array}{c}\displaystyle}

%%%%%%%%%%%%%%%%%  Висячие абзацы %%%%%%%%%%%%%%%%%%
\newcommand\hang[2][]{%
  \def\@tempdefa{#1}%
  \leavevmode
  \ifx\@tempdefa\@empty
     \setbox\@tempboxa\hbox{#2 }%
  \else
     \ifdim#1>0pt
        \setbox\@tempboxa\hbox to#1{#2\hss }%
     \else
        \setbox\@tempboxa\hbox to-#1{\hss#2 }%
     \fi
  \fi
  \hangindent\wd\@tempboxa
  \advance\hangindent\parindent
  \box\@tempboxa\ignorespaces
}
%%%%%%%%%%%%%%%% End Висячие абзацы %%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%  Подправляем amsthm %%%%%%%%%%%%%%%%%%%%%%%%%
% После \begin{theorem}[Теорема о свойстве] точка должна быть того же
% шрифта, что и предыдущий текст.
\ifx\thm@style\undefined\else
   \def\thmhead@plain#1#2#3{%
     \thmname{#1}\thmnumber{\@ifnotempty{#1}{ }\@upn{#2}}%
     \thmnote{ \;\the\thm@notefont(#3)}}
   \let\thmhead\thmhead@plain
   \def\swappedhead#1#2#3{%
     \thmnumber{#2}%
     \thmname{\@ifnotempty{#2}{~}#1}%
     \thmnote{ \;\the\thm@notefont(#3)}}
   \def\th@plain{%
     \let\thm@indent\indent
     \thm@notefont{\mdseries\upshape}%
    % \thm@headfont{\mdseries}
     \thm@preskip\z@
     \thm@postskip\thm@preskip
     \em
   }
\fi
%%%%%%%%%%%%%%%%%  End Подправляем amsthm %%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%  Формулы вразрез %%%%%%%%%%%%%%%%%%%%%%
% Конец строки в mline
\def\@mlcrkv[#1]{{}\hfil\cr\noalign{\penalty\interdisplaylinepenalty\vskip#1\vskip\curradvskip}\hfil{}}
\def\@mlcr{{}\hfil\cr\noalign{\penalty\interdisplaylinepenalty\vskip\curradvskip}\hfil{}}

% Если не загружен wrapfig.
\@ifundefined{@@parshape}{\let\@@parshape\parshape}{}

\def\multline@align{%
  \renewcommand\*[1][\z@]{\times{}\\[##1] {}\times}%
  \renewcommand\+[1][\z@]{+{}\\[##1] {}+}%
  \renewcommand\-[1][\z@]{-{}\\[##1] {}-}%
  \renewcommand\=[1][\z@]{={}\\[##1] {}=}%
  \def\\{\@ifnextchar[\@mlcrkv\@mlcr}%
  \parindent=\z@ \parfillskip=\z@ plus-1fil
  \leftskip=\z@ plus 1fil \rightskip=\z@ plus 1fil
  \lineskiplimit=1.5ex \advance\lineskiplimit\curradvskip
  \lineskip=\lineskiplimit plus.1ex
  \baselineskip=2\lineskiplimit plus.1ex
  \halign to\displaywidth\bgroup\vbox{%
       \hsize=\displaywidth
       \hskip\z@ plus -1fil
       $\m@th\displaystyle ##$%
       \@@parshape1\z@\displaywidth
       \par
    }\cr\noalign{\nointerlineskip\ifdim\predisplaysize>-\maxdimen\vskip.5ex \else\vskip-.5ex \fi}%
}
\newenvironment{mline*}{\ifhmode\vadjust\fi{\penalty\displaywidowpenalty}%
  $$
    \multline@align
}{%
  \crcr\noalign{\nointerlineskip\vskip2\p@}\egroup
  $$\ignorespacesafterend
}
\newenvironment{mline}{\ifhmode\vadjust\fi{\penalty\displaywidowpenalty}%
  \addtocounter{equation}{1}%
$$
  \def\@currentlabel{\p@equation\theequation}%
  \def\tag##1{\def\@currentlabel{##1}\tag@in@align{##1}}%
  \def\eqno(##1){\tag{##1}}
  \global\tag@false \global\let\raise@tag\@empty
  \multline@align
}{%
  \vadjust{\vskip1ex}\hskip0ptplus -1fil\penalty1\hskip\the\multlinetaggap \null\hskip0ptplus 1fil
  \setbox\@tempboxa=\iftag@\hbox{\make@display@tag}\else\hbox{\upshape(\theequation)}\fi
  \ht\@tempboxa=\z@ \dp\@tempboxa=\z@
  \vbox to0pt{\raise@tag\box\@tempboxa\vss}%
  \crcr\noalign{\nointerlineskip\vskip\z@}\egroup
$$\ignorespacesafterend
}
%%%%%%%%%%%%%

\def\@earcrkv[#1]{{}\cr\noalign{\penalty\interdisplaylinepenalty\vskip\curradvskip\vskip#1}{}}
\def\@earcr{{}\cr\noalign{\penalty\interdisplaylinepenalty\vskip\curradvskip}{}}
\def\eqarray@align@vcenter{%
  \renewcommand\*[1][\z@]{\times{}\hfill\\[##1]\hfill {}\times}%
  \renewcommand\+[1][\z@]{+{}\hfill\\[##1]\hfill {}+}%
  \renewcommand\-[1][\z@]{-{}\hfill\\[##1]\hfill {}-}%
  \renewcommand\=[1][\z@]{={}\hfill\\[##1]\hfill {}=}%
  \def\\{\@ifnextchar[\@earcrkv\@earcr}%
  \parindent=\z@ \parfillskip=\z@
  \leftskip=\z@ plus 1fil \rightskip=\z@ plus 1fil
  \lineskiplimit=1.8ex \advance\lineskiplimit\curradvskip
  \lineskip=\lineskiplimit
  \baselineskip=2\lineskip
  \vcenter\bgroup
  \halign to\displaywidth\bgroup\vbox{%
       \hsize=\displaywidth
       $\m@th\displaystyle ##$%
       \@@parshape1\z@\displaywidth
       \par
    }\cr\noalign{\nointerlineskip\ifdim\predisplaysize>-\maxdimen\vskip-.5ex \else\vskip-1.3ex \fi}%
}
\def\eqarray@align{%
  \renewcommand\*[1][\z@]{\times{}\hfill\\[##1]\hfill {}\times}%
  \renewcommand\+[1][\z@]{+{}\hfill\\[##1]\hfill {}+}%
  \renewcommand\-[1][\z@]{-{}\hfill\\[##1]\hfill {}-}%
  \renewcommand\=[1][\z@]{={}\hfill\\[##1]\hfill {}=}%
  \def\\{\@ifnextchar[\@earcrkv\@earcr}%
  \parindent\z@ \parfillskip\z@
  \leftskip=\z@ plus 1fil \rightskip=\z@ plus 1fil
  \lineskiplimit=1.8ex \advance\lineskiplimit\curradvskip
  \lineskip=\lineskiplimit plus.2ex
  \baselineskip=2\lineskiplimit plus.1ex
  \halign to\displaywidth\bgroup\vbox{%
       \hsize=\displaywidth
       $\m@th\displaystyle ##$%
       \@@parshape1\z@\displaywidth
       \par
    }\cr\noalign{\nointerlineskip\ifdim\predisplaysize>-\maxdimen\vskip-.5ex plus-0ex \else\vskip-.7ex plus-0ex \fi}%
}
\newenvironment{eqarray*}{\ifhmode\vadjust\fi{\penalty\displaywidowpenalty}%
  $$
  \eqarray@align
}{%
  \crcr\noalign{\nointerlineskip\vskip2\p@}\egroup$$\ignorespacesafterend
}
\newenvironment{eqarray}{\ifhmode\vadjust\fi{\penalty\displaywidowpenalty}%
  \addtocounter{equation}{1}%
  \vspace{-1ex}%
$$
  \global\let\@currentlabel@save\@currentlabel
  \def\@currentlabel{\p@equation\theequation}%
  \def\tag##1{\gdef\@currentlabel{##1}\tag@in@align{##1}}%
  \def\eqno(##1){\tag{##1}}%
  \global\tag@false \global\let\raise@tag\@empty
  \eqarray@align@vcenter
}{%
  \crcr\noalign{\nointerlineskip\vskip.5ex}\egroup\egroup
  \setbox\@tempboxa=\iftag@\hb@xt@\z@{\hss\make@display@tag}\else\hb@xt@\z@{\upshape\hss(\theequation)}\fi
  \ht\@tempboxa=\z@ \dp\@tempboxa=\z@
  \vcenter to\z@{\vskip.1ex\raise@tag\box\@tempboxa\vss}%
$$\let\@currentlabel\@currentlabel@save
\ignorespacesafterend
}

\def\[{\relax\ifmmode\@badmath\else$$\fi}
\def\]{\relax\ifmmode$$\else\@badmath\fi}

%%%%%%%%%%%%%%%%%  End Формулы вразрез %%%%%%%%%%%%%%%%%%%%%%

% После заголовка точка не ставится.
% \captionv -- для пустых заголовков.
\newcommand\mydelim{.\hskip\z@ plus 1\p@}
\renewcommand\captionlabeldelim{\mydelim}
\newcommand\captionv{\def\mydelim{}\caption{}\def\mydelim{.\hskip\z@ plus 1\p@}}

%\newcommand\abstract[1]{{\petit#1\smallskip\par}}

% 1mu=1/18 em % 0.56\p@
% Используются, если подынтегральные выражения одноэтажные.
\newcommand\smathop[1]{\mathop{\hbox{\footnotesize$\displaystyle#1$}}\limits}
\newcommand\sint{\smathop{\int}}
\newcommand\soint{\smathop{\oint\,}}
\newcommand\siint{\smathop{\iint}}
\newcommand\soiint{\smathop{\oiint}}
\newcommand\ssum{\smathop{\sum}}
\newcommand\sprod{\smathop{\prod}}

\newcommand\oiint{\mathop{\displaystyle\lefteqn{\mkern1.1mu\subset\mkern-3mu\joinrel\supset}\int\mkern-5mu\int}\limits}
\newcommand\oiiint{\mathop{\displaystyle\lefteqn{\mkern2.5mu\subset\joinrel\supset}\int\mkern-6mu\int\mkern-6mu\int}\limits}
\newcommand\vpintl[1][-.5\p@]{\lefteqn{\lower-.7\p@\hbox{\small$\diagup$}}\kern#1\int\limits}
\newcommand\vpint{\lefteqn{\lower-.7\p@\hbox{\small$\diagup$}}\mkern0mu\int}
\newcommand\svpint{\lefteqn{\lower-.7\p@\hbox{\small$\diagup$}}\mkern.8mu\sint}

%\relax\mathchar"1350\displaylimits 1B52


%dvg Увеличенный \check
\let\savecheck=\check
\newcommand\widecheck[1]{%
  \bgroup%
    \setbox0=\hbox{$\displaystyle #1$}\wd0=0pt%над чем ставим "птичку"
    \setbox1=\hbox{$\displaystyle\widehat{\phantom{#1}}$}%
    \@tempdima\wd1\@tempdimb\ht1\@tempdimc\dp1%сохраняем размеры бокса (иначе они теряются)
    \@ifundefined{is@near}{%для ps (необходимо закомментировать опцию near)
      \setbox2=\hbox{\lower.25ex\hbox{\rotatebox[origin=ct]{180}{\box1}}}%поворачиваем (.25ex - коррекция)
    }{%для yap (т.\,е. будет \check, но размеры бокса как для ps)
      \setbox2=\hbox{$\displaystyle\savecheck{\phantom{#1}}$}%
    }%
    \wd2\@tempdima\ht2\@tempdimb\dp2\@tempdimc{\box0\box2}%присваиваем правильные размеру боксу и выводим
  \egroup%
}
\let\check=\widecheck


\declare@shorthand{russian}{"(}{\left(}
\declare@shorthand{russian}{")}{\right)}
\declare@shorthand{russian}{"[}{\left[}
\declare@shorthand{russian}{"]}{\right]}
\declare@shorthand{russian}{"~}{\futurelet\@let@token\nb@swa} % После этого дефиса перенос запрещен, но в слове -- разрешен
    \def\nb@swa{\ifx\@let@token~\let\reserved@a=\nb@entire\else\let\reserved@a=\nb@defis\fi\reserved@a}
    \def\nb@defis{\nobreak\hskip\z@\hbox{-}\nobreak\hskip\z@{}}
    \def\nb@entire~{\nobreak\hskip\z@\hbox{--}\nobreak\hskip\z@}
\declare@shorthand{russian}{"_}{\nobreak\hskip\z@\hbox{--}\hskip\z@}        % Двойной дефис, разрешающий перенос в слове (аналог "=)
\declare@shorthand{russian}{"!}{\nobreak\hskip\z@}                          % На этом месте перенос запрещен, но в слове -- разрешен

\newcommand{\ufrown}[1]{\overset{\kern1.5\p@\raisebox{-.23ex}[\z@][\z@]{$\smash{\scriptscriptstyle\frown}$}}{#1}\mathstrut}

\def\bibcite{\@newl@bel b} % Отменяем переопределение Бабеля
\global\let\bbl@cite@choice\relax

%%%%%%%%% From citesort.sty %%%%%%%%%%%%%%%%%%
% не добавлена команда \@safe@activesfalse ?

\newcount\@minsofar
\newcount\@min
\newcount\@tempcntc
\def\@citex[#1]#2{%
\if@filesw \immediate \write \@auxout {\string \citation {#2}}\fi
\@tempcntb\m@ne \let\@h@ld\relax \def\@citea{}%
\@min\m@ne%
\@cite{%
  \@for \@citeb:=#2\do {\@ifundefined {b@\@citeb}%
    {\@h@ld\@citea\@tempcntb\m@ne{\bf ?}%
    \@warning {Citation `\@citeb ' on page \thepage \space undefined}}%
{\@minsofar\z@ \@for \@scan@cites:=#2\do {%
  \@ifundefined{b@\@scan@cites}%
    {\@tempcntc\m@ne}
    {\@tempcntc\number\csname b@\@scan@cites \endcsname \relax}%
\ifnum\@tempcntc > \@min% select the next one to list
    \ifnum\@minsofar = \z@
      \@minsofar\number\@tempcntc
      \edef\@scan@copy{\@scan@cites}\else
    \ifnum\@tempcntc < \@minsofar
      \@minsofar\number\@tempcntc
      \edef\@scan@copy{\@scan@cites}\fi\fi\fi}\@tempcnta\@min
  \ifnum\@minsofar > \z@ % some more
    \advance\@tempcnta\@ne
    \@min\@minsofar
    \ifnum\@tempcnta=\@minsofar %   Number follows previous--hold on to it
      \ifx\@h@ld\relax
        \edef \@h@ld{\@citea\csname b@\@scan@copy\endcsname}%
      \else \edef\@h@ld{\ifmmode{-}\else\hbox{--}\fi\csname b@\@scan@copy\endcsname}%
      \fi
    \else \@h@ld\@citea\csname b@\@scan@copy\endcsname
          \let\@h@ld\relax
  \fi % no more
\fi}%
\def\@citea{,\penalty9999 \ }}\@h@ld}{#1}}

%%%%%%%%%%% End from cite.sty %%%%%%%%%%%%%%%%%

%%%%%%%%%%% From bk10.clo %%%%%%%%%%
% Вертикальные пробелы в списках не нужны
\def\@listi{\leftmargin\leftmargini
            \parsep \z@
            \topsep \z@
            %\itemsep4\p@ \@plus2\p@ \@minus\p@
            \itemsep\z@
            }
\let\@listI\@listi
\@listi
%%%%%%%%%%% End from bk10.clo %%%%%%%%%%%%%


%%%%%%%%%%% Вариации на тему list %%%%%%%%%%
\newenvironment{enumhang}[2][.]{%
 \begin{list}{\addtocounter{enumi}{1}\arabic{enumi}#1}{%
  \setcounter{enumi}{0}%
  \itemindent\z@
  \settowidth{\labelwidth}{#2#1 \ }%
  \labelsep0.5em
   \leftmargin\labelwidth
    \advance\leftmargin\labelsep
  \rightmargin\z@
  \listparindent\z@
  \topsep\z@
  \partopsep\z@
  \parsep\z@
  \itemsep\z@
  }%
 }
{\end{list}}

\newenvironment{itemhang}[1][\indent---]{%
 \begin{list}{#1}{%
  \itemindent\z@
  \settowidth{\labelwidth}{#1}%
  \labelsep.5em
  \leftmargin\labelwidth
    \advance\leftmargin\labelsep
  \rightmargin\z@
  \listparindent\z@
  \topsep\z@
  \partopsep\z@
  \parsep\z@
  \itemsep\z@
  }
 }
{\end{list}}

\newenvironment{enumpar}[1][.]{%
  \setcounter{enumi}{0}%
  \def\item{\par\addtocounter{enumi}{1}\arabic{enumi}#1\hskip.5em }%
  \ignorespaces
}{\par}

\newenvironment{itempar}[1][---]{%
  \def\item{\par#1\hskip.5em }%
  \ignorespaces
}{\par}
%%%%%%%%%%% End Вариации на тему list %%%%%%%%%%

%%%%%%%%%%%%%% Заголовки теорем и пр. %%%%%%%%%%%%%%
\def\zagrn{\leavevmode\@ifnextchar*\@zagrn\@@zagrn}
\def\@zagrn*#1#2{\soo{#1} #2\;}
\def\@@zagrn#1#2{\soo{#1} #2.\;}

\def\zagr{\leavevmode\@ifnextchar*\@zagr\@@zagr}
\def\@zagr*#1{\soo{#1}\;}
\def\@@zagr#1{\soo{#1}.\;}
\def\blacksq{\unskip\nobreak\quad\hbox{\footnotesize$\blacksquare$}}

\def\zagbn{\leavevmode\@ifnextchar*\@zagbn\@@zagbn}
\def\@zagbn*#1#2{\textbf{#1 #2}}
\def\@@zagbn#1#2{\textbf{#1 #2.}}

\def\zagb{\leavevmode\@ifnextchar*\@zagb\@@zagb}
\def\@zagb*#1{\textbf{#1}}
\def\@@zagb#1{\textbf{#1.}}
%%%%%%%%%%%%%% End Заголовки вразрядку %%%%%%%%%%%%%%

\endinput

%%%%%%%%%%%%%  From amsart.cls %%%%%% \Uppercasenonmath %%%%%%%%%%%%%
\newcommand\uppercasenonmath[1]{\toks@\@emptytoks
  \@xp\@skipmath\@xp\@empty#1$$%
  \edef#1{\@nx\protect\@nx\@upprep\the\toks@}%
}
\newcommand\@upprep{%
  \spaceskip1.3\fontdimen2\font plus1.3\fontdimen3\font
  \upchars@}
\newcommand\upchars@{%
  \def\ss{SS}\def\i{I}\def\j{J}\def\ae{\AE}\def\oe{\OE}\def\o{\O}\def\aa{\AA}\def\l{\L}}
\newcommand\@skipmath{}
\long\def\@skipmath#1$#2${%
  \@xskipmath#1\(\)%
  \@ifnotempty{#2}{\toks@\@xp{\the\toks@$#2$}\@skipmath\@empty}}%
\newcommand\@xskipmath{}
\long\def\@xskipmath#1\(#2\){%
  \uppercase{\toks@\@xp\@xp\@xp{\@xp\the\@xp\toks@#1}}%
  \@ifnotempty{#2}{\toks@\@xp{\the\toks@\(#2\)}\@xskipmath\@empty}}%
\newcommand\Uppercasenonmath[1]{\gdef\Uppercasenonmath@{#1}\uppercasenonmath\Uppercasenonmath@\Uppercasenonmath@}
%%%%%%%%%%%%%  End from amsart.cls %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%% Буквица %%%%%%%%%%%%%%%%%%%%%
\def\bukvica#1{
 \setbox\@tempboxa=\hbox{\def\f@size{28}\selectfont#1\,}%
 \@tempdima=\hsize\advance\@tempdima-\wd\@tempboxa
 \parshape3 \wd\@tempboxa \@tempdima \wd\@tempboxa \@tempdima 0pt \hsize
 \noindent\llap{\raisebox{-1\baselineskip}[0pt][0pt]{\box\@tempboxa}}%
 \ignorespaces
}
%%%%%%%%%%%%%% End Буквица %%%%%%%%%%%%%%%%

%%%%%%%%%%%%%% Рамка поверх бокса %%%%%%%%%%%%%%
\definecolor{fbgray}{gray}{.5}
\def\postfbox#1{%
    \setlength\fboxsep{-.4\p@}\setlength\fboxrule{1\p@}%
    \color{fbgray}\setbox0=\hbox{#1}\setbox1=\hbox{}%
    \wd1=\wd0 \ht1=\ht0 \dp1=\dp0 \@tempdima=\wd0
    \hbox{\rlap{\box0}\hbox to\@tempdima{\hss\fbox{\box1}\hss}}%
}
%%%%%%%%%%%%%% End Рамка поверх %%%%%%%%%%%%%%%%


%%%%%%%%%%%%%% Книга из нескольких кусков %%%%%%%%%%%%%%
\def\importaux#1{{%
    \def\@writefile##1##2{}%
    \def\newlabel##1##2{}%
    \def\bibcite##1##2{}%
    \def\@setckpt##1{}%
    \makeatletter
    \input #1
}}
%%%%%%%%%%%%%% End Книга из нескольких кусков %%%%%%%%%%%%%%%%


%%%%%%%%%%%%%% Debugging %%%%%%%%%%%%%%
\def\fixedbox#1{\mbox{\hbox to.055\textwidth{#1}}}
\def\numfixedbox#1{\fixedbox{\hss#1\;\vrule width .2pt height 10pt depth 3pt }}%
\def\showallmath{${}$%
 \advance\count18 1
 \count1=0
 {\loop
   \par\pagebreak[3]\vskip3mm plus 6mm \hrule\medskip fam \the\count1:\ \expandafter\string\the\textfont\the\count1  \par\smallskip
   \count4=0
   {\parindent0pt
     \numfixedbox{\hss0}%
     \loop
     \count2=\count1
     \multiply\count2 256
     \advance\count2 \count4
     \fixedbox{\hss$\mathchar\the\count2$\hss}%
     % делим на строки
     \count2=\count4
     \divide\count2 16
     \count3=\count2 \advance\count3 1
     \multiply\count2 16
     \advance\count2 -\count4
     \ifnum\count2 = -15 \ifnum\count4 < 255
        \par \numfixedbox{\the\count3}%
     \fi\fi
     \advance\count4 1
   \ifnum\count4<256
   \repeat}%
 \advance\count1 1
 \ifnum\count1 <\count18
 \repeat}%
 \advance\count18 -1
}
%%%%%%%%%%%%%% End Debugging %%%%%%%%%%%%%%

%%%%%%%%%%%%%% Старые окружения %%%%%%%%%%%%%%
\renewenvironment{cases}{\left\{\vcenter\bgroup\openup1.5\jot\halign\bgroup $##$\hfill\null&\quad ##\hfill\null\cr}{\cr\egroup\egroup\right.}
%%%%%%%%%%%%%% End Старые окружения %%%%%%%%%%%%%%



%??
\def\lastlbr{\@testopt{\@no@lastlnbk-}4}
\def\@no@lastlnbk #1[#2]{%
  \ifvmode
    \@nolnerr
  \else
    \@tempskipa\lastskip
    \unskip
    \penalty #1\@getpen{#2}%
    \ifdim\@tempskipa>\z@
      \hskip\@tempskipa
      \ignorespaces
    \fi
  \fi
  \vspace{-\baselineskip}
}

%??
\newdimen\mathindent
\mathindent\z@
\newenvironment{fleqn}%
    {\@beginparpenalty\predisplaypenalty
     \@endparpenalty\postdisplaypenalty
     \refstepcounter{equation}%
     \trivlist \item[]\leavevmode
       \hb@xt@\linewidth\bgroup $\m@th% $
         \displaystyle
         \hskip\mathindent}%
        {$\hfil % $
         \displaywidth\linewidth\hbox{\@eqnnum}%
       \egroup
     \endtrivlist}
\newenvironment{fleqn*}%
    {\@beginparpenalty\predisplaypenalty
     \@endparpenalty\postdisplaypenalty
     \trivlist \item[]\leavevmode
       \hb@xt@\linewidth\bgroup $\m@th% $
         \displaystyle
         \hskip\mathindent}%
        {$\hfil % $
       \egroup
     \endtrivlist}

%\Макроопределния для дуг, аналогичных \overbrace, \underbrace, но,
%соответственно, без <<\пимпочек>> посередине (требуются для обозначения
%<<спаривания>> операторов рождения/уничтожения):
\newcommand{\downarcfill}{$\m@th \setbox\z@\hbox{$\braceld$}%
  \braceld\leaders\vrule height\ht\z@ depth\z@\hfill\bracerd$}
\newcommand{\uparcfill}{$\m@th \setbox\z@\hbox{$\braceld$}%
  \bracelu\leaders\vrule height\ht\z@ depth\z@\hfill\braceru$}
\newcommand{\overarc}[1]%
     {\mathop{\vbox{\m@th\ialign{##\crcr\noalign{\kern3\p@}
      \downarcfill\crcr\noalign{\kern3\p@\nointerlineskip}
      $\hfil\displaystyle{#1}\hfil$\crcr}}}\limits}
\newcommand{\underarc}[1]%
     {\mathop{\vtop{\m@th\ialign{##\crcr
      $\hfil\displaystyle{#1}\hfil$\crcr\noalign{\kern3\p@\nointerlineskip}
      \uparcfill\crcr\noalign{\kern3\p@}}}}\limits}
%%% То же, но для пунктирных дуг (\eq:77_4); очевидно, что можно придумать
%%% некую универсальную конструкцию для всех видов дуг (а не подвторять
%%% много раз практически одно и тоже); здесь мы далеки от идеала:
\newsavebox{\tmpppb}
\newcommand{\downdashedfill}[1]{$\m@th
   %параметр (эмпирический) --- для подгонки равномерности распределения штрихов
   \savebox{\tmpppb}[#1]{\lower0.23ex\hbox{{-}}}
  {\scriptstyle\braceld}\leaders\copy\tmpppb\hfill
  {\scriptstyle\bracerd}$}
\newcommand{\updashedfill}[1]{$\m@th
   \savebox{\tmpppb}[#1]{\lower0.46ex\hbox{{-}}}%
  {\scriptstyle\bracelu}\leaders\copy\tmpppb\hfill
  {\scriptstyle\braceru}$}
\newcommand{\overdashed}[2]%
     {\mathop{\vbox{\m@th\ialign{##\crcr\noalign{\kern3\p@}
      \downdashedfill{#1}\crcr\noalign{\kern3\p@\nointerlineskip}
      $\hfil\displaystyle{#2}\hfil$\crcr}}}\limits}
\newcommand{\underdashed}[2]%
     {\mathop{\vtop{\m@th\ialign{##\crcr
      $\hfil\displaystyle{#2}\hfil$\crcr\noalign{\kern3\p@\nointerlineskip}
      \updashedfill{#1}\crcr\noalign{\kern3\p@}}}}\limits}
%%%То же, но для дуг со стрелками (\eq:77_4):
\newcommand{\downarctorightfill}{$\m@th \setbox\z@\hbox{$\braceld$}%
  \braceld\leaders\vrule height\ht\z@
  depth\z@\hfill\lefteqn{\bracelu}
  \lefteqn{\braceld}\leaders\vrule height\ht\z@ depth\z@\hfill\bracerd$}
\newcommand{\downarctoleftfill}{$\m@th \setbox\z@\hbox{$\braceld$}%
  \braceld\leaders\vrule height\ht\z@
  depth\z@\hfill\righteqn{\braceru}
  \righteqn{\bracerd}\leaders\vrule height\ht\z@ depth\z@\hfill\bracerd$}
\newcommand{\uparctorightfill}{$\m@th \setbox\z@\hbox{$\braceld$}%
  \bracelu\leaders\vrule height\ht\z@
  depth\z@\hfill\lefteqn{\bracelu}
  \lefteqn{\braceld}\leaders\vrule height\ht\z@ depth\z@\hfill\braceru$}
\newcommand{\uparctoleftfill}{$\m@th \setbox\z@\hbox{$\braceld$}%
  \bracelu\leaders\vrule height\ht\z@
  depth\z@\hfill\righteqn{\braceru}
  \righteqn{\bracerd}\leaders\vrule height\ht\z@ depth\z@\hfill\braceru$}
\newcommand{\overarctoright}[1]{\mathop{\vbox{\m@th\ialign{##\crcr\noalign{\kern3\p@}
      \downarctorightfill\crcr\noalign{\kern3\p@\nointerlineskip}
      $\hfil\displaystyle{#1}\hfil$\crcr}}}\limits}
\newcommand{\overarctoleft}[1]{\mathop{\vbox{\m@th\ialign{##\crcr\noalign{\kern3\p@}
      \downarctoleftfill\crcr\noalign{\kern3\p@\nointerlineskip}
      $\hfil\displaystyle{#1}\hfil$\crcr}}}\limits}
\newcommand{\underarctoright}[1]{\mathop{\vtop{\m@th\ialign{##\crcr
      $\hfil\displaystyle{#1}\hfil$\crcr\noalign{\kern3\p@\nointerlineskip}
      \uparctorightfill\crcr\noalign{\kern3\p@}}}}\limits}
\newcommand{\underarctoleft}[1]{\mathop{\vtop{\m@th\ialign{##\crcr
      $\hfil\displaystyle{#1}\hfil$\crcr\noalign{\kern3\p@\nointerlineskip}
      \uparctoleftfill\crcr\noalign{\kern3\p@}}}}\limits}

 \newcommand{\widecheck}[1]{\mathop{\vbox{\m@th\ialign{##\crcr
             $\@mathmeasure\z@\textstyle{#1}%
             \hbox to\wd\z@{\hss
                \ifdim\wd\z@>\tw@ em%
                    \scalebox{1}[-1]{$\mathchar"0\hexnumber@\symAMSb 5B$}%
                \else
                   \scalebox{1}[-1]{$\mathchar"0362$}%
                \fi
              \hss}$%
              \crcr\noalign{\kern1\p@\nointerlineskip}%
         $\displaystyle #1$%
         \crcr}}}\nolimits}

%End from zh

%\count1=0
%\loop $\mathchar\count1$ \advance\count1 by 1 \ifnum\count1<3328\repeat
%\loop \char\count1\ \advance\count1 by 1 \ifnum\count1<255\repeat

%Introducing dependence of interline space
\renewcommand\normalsize{%
   \@setfontsize\normalsize\@xpt\@xipt          %%\@xiipt
   \abovedisplayskip 4\p@ \@plus1.5\p@ \@minus1.5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 4\p@ \@plus1.5\p@ \@minus1.5\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
\renewcommand\small{%
   \@setfontsize\small\@ixpt{10}                %%{11}%
 \abovedisplayskip 6\p@ \@plus1.5\p@ \@minus1.5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus1.5\p@ \@minus1.5\p@
   \belowdisplayskip \abovedisplayskip
      \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   }
\renewcommand\footnotesize{%
   \@setfontsize\footnotesize\@viiipt{9}%       %%{9.5}
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\renewcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\renewcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\renewcommand\large{\@setfontsize\large\@xiipt{14}}
\renewcommand\Large{\@setfontsize\Large\@xivpt{18}}
\renewcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\renewcommand\huge{\@setfontsize\huge\@xxpt{25}}
\renewcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}

%New column types
\newcolumntype{,}{D{,}{,}{-1}}\newcolumntype{.}{D{.}{,}{1}}
\newcolumntype{d}{D{,}{,}{-2}}\newcolumntype{e}{D{.}{,}{2}}
\newcolumntype{d}[1]{D{,}{,}{#1}}
\newcolumntype{Y}{>{\centering\arraybackslash}X}
\renewcommand\tabularxcolumn[1]{m{#1}}

\newenvironment{bulletlist}[1][$\bullet$]{%
 \begin{list}{#1}{%
  \settowidth{\labelwidth}{#1}
  \setlength{\labelsep}{0.5em}
%  \setlength{\leftmargin}{\z@}
%  \setlength{\itemindent}{0.5em+\labelwidth+\labelsep}
  \setlength{\leftmargin}{0.5em+\labelwidth+\labelsep}
 \setlength{\itemindent}{0pt}
%
  \setlength{\itemsep}{\z@}
  \setlength{\parsep}{\z@}
  \setlength{\topsep}{\z@}
  \setlength{\partopsep}{\z@}
  }
 }
{\end{list}}

%% Расподчинение счетчика параграфов:
\def\expand@elt#1{%
  \def\@tempb{#1}%
  \ifx\@tempa\@tempb \relax\else \@addtoreset{#1}{@stub}\fi%
  }
\def\release#1#2{%
  \begingroup
  \def\@tempa{#1}%
  \let\@elt=\expand@elt
  \let\cl@@stub=\@empty
  \csname cl@#2\endcsname
  \global\expandafter\let\csname cl@#2\endcsname\cl@@stub
  \endgroup}
\release{section}{chapter}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
