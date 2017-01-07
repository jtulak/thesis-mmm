% ----------------------------------------------------------------------------
% FIT thesis
% ----------------------------------------------------------------------------
% (C) 2007 Zdenek Vasicek, 2008 Michal Bidlo
% vim: set syntax=tex :
% encoding=latin2:
% ----------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jtulak}[2013/12/13 My own template]

%Vychozi hodnoty parametru
%\newif\ifczech \let\ifczech\iftrue
\newif\ifczech \let\ifczech\iffalse
\newif\ifcover \let\ifcover\iffalse
\newif\ifPrint \let\ifPrint\iffalse
\newif\ifNotPrint \let\ifNotPrint\iftrue
%\newif\ifWis   \let\ifWis\iftrue
\newif\ifzadani   \let\ifzadani\iffalse
\newif\iftwoside   \let\iftwoside\iffalse


%-----------------------------------------------------------------------------
%Parametry tridy
%-----------------------------------------------------------------------------
\DeclareOption{english}{\let\ifczech\iffalse}
\DeclareOption{czech}{\let\ifczech\iftrue}
\DeclareOption{cover}{\let\ifcover\iftrue}
\DeclareOption{print}{\let\ifPrint\iftrue \let\ifNotPrint\iffalse}
\DeclareOption{zadani}{\let\ifzadani\iftrue}
\DeclareOption{twoside}{\let\iftwoside\iftrue}

\DeclareOption*{}
\ProcessOptions\relax
%Jako vychozi pouzijeme tridu REPORT
\iftwoside
	\ifx\pdfoutput\undefined % nejedeme pod pdftexem
	\LoadClass[a4paper,twoside,onecolumn,11pt]{report}
	\else
	\LoadClass[pdftex,a4paper,twoside,onecolumn,11pt]{report}
	\fi
\else
	\ifx\pdfoutput\undefined % nejedeme pod pdftexem
	\LoadClass[a4paper,oneside,onecolumn,11pt]{report}
	\else
	\LoadClass[pdftex,a4paper,onside,onecolumn,11pt]{report}
	\fi
\fi


%-----------------------------------------------------------------------------
%Balicky
%-----------------------------------------------------------------------------

%\RequirePackage[loadonly]{titlesec}

%\titleformat{\chapter}[hang]{\Huge\bfseries}{\thechapter\hsp\textcolor{gray75}{|}\hsp}{0pt}{\Huge\bfseries}
%\titleformat{\section}[hang]{\Huge\bfseries}{\thesection\hsp\textcolor{gray75}{|}\hsp}{0pt}{\Huge\bfseries}
%\titleformat{\subsection}[hang]{\Huge\bfseries}{\thesubsection\hsp\textcolor{gray75}{|}\hsp}{0pt}{\Huge\bfseries}

\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{lastpage}
\usepackage{fancyhdr}
\usepackage{nameref}
\usepackage[]{opensans}
\usepackage[usenames,dvipsnames]{color}

\usepackage[hmarginratio=1:1]{geometry}

\usepackage{parskip} % paragraph indentation
\ifczech
  \usepackage[czech]{babel}
  \main@language{czech}
  \setlength{\parindent}{15pt} % Default is 15pt.
\else
  \usepackage[english]{babel}
  \main@language{english}
  \setlength{\parindent}{0cm} % Default is 15pt.
\fi

\usepackage[utf8]{inputenc} % enconding

\ifx\pdfoutput\undefined  % nejedeme pod pdftexem
  %\usepackage{graphics}
  \usepackage[dvips]{graphicx}
  \usepackage{epsfig}
\else % je to pdftex !
  \usepackage[pdftex]{graphicx}
\fi

%-----------------------------------------------------------------------------
% colors
\definecolor{dark-gray}{gray}{0.3}
\definecolor{gray}{gray}{0.5}
\definecolor{gray75}{gray}{0.75}

%-----------------------------------------------------------------------------
%Sazebni obrazec
%-----------------------------------------------------------------------------
\setlength{\hoffset}{-0.7cm}
\setlength{\voffset}{-1.5cm}
\setlength{\textheight}{23.0cm}
\setlength{\textwidth}{15.2cm}

% =========================================================================


% \ref and \nameref together into \fullref

\ifNotPrint
  \newcommand*{\fullref}[1]{\hyperref[{#1}]{\autoref*{#1} \nameref*{#1}}}
  \newcommand*{\figref}[1]{\hyperref[{#1}]{figure~\ref*{#1}}}
  \newcommand*{\tableref}[1]{\hyperref[{#1}]{table~\ref*{#1}}}
  \newcommand*{\lstref}[1]{\hyperref[{#1}]{listing~\ref*{#1}}}
\else
  \newcommand{\fullref}[1]{\ref{#1} \nameref{#1}}
  \newcommand{\figref}[1]{figure~\ref{#1}}
  \newcommand{\tableref}[1]{table~\ref{#1}}
  \newcommand{\lstref}[1]{listing~\ref{#1}}
\fi



 % One single link


% pretty obvious :-)
\newcommand{\TODO}[1]{\noindent\textbf{TODO: #1}}

% =========================================================================

% Declare \lastpage command for print and non-print layout
\ifNotPrint
  \newcommand{\lastpage}{\pageref*{LastPage}}
\else
  \newcommand{\lastpage}{\pageref{LastPage}}
\fi


\renewcommand{\familydefault}{\sfdefault}


\fancypagestyle{plain}{%
\fancyhead{}
%\lhead{}
\renewcommand{\headrulewidth}{0pt}
}


\pagestyle{fancy}

\renewcommand{\chaptername}{}

\renewcommand{\chaptermark}[1]{%
\markboth{\textcolor{dark-gray}{\MakeUppercase{%
\chaptername\ \thechapter%
\ #1}}}{}}

\fancyhead{}
\fancyfoot{}

\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}


\fancyhead[LE,RO]{\slshape \leftmark}
%\fancyhead[LO,RE]{}
%\fancyhead[RE]{}


\fancyfoot[LE,RO]{{\Large\thepage}/\small\lastpage}




%------------------------------------------------------------------------------
% Chapter style
%------------------------------------------------------------------------------

\newcommand*{\ChapterNumberSize}{\@setfontsize\ChapterNumberSize{24.88pt}{6pt}}
\newcommand*{\ChapterTextSize}{\@setfontsize\ChapterTextSize{20pt}{6pt}}
\iftrue
\renewcommand{\@makechapterhead}[1]{%
    %\vspace*{30\p@}%
    {\parindent \z@ \normalfont
   % \vspace{10pt}%
    \ifnum \c@secnumdepth >\m@ne
        \color{gray75}\ChapterNumberSize\thechapter\textbar\hspace{1pt}
    \fi
    \interlinepenalty\@M
    \color{black}\ChapterTextSize\bfseries #1\par
    \vspace{5pt}%
    \hrule
    \vskip 30\p@
}}
\renewcommand{\@makeschapterhead}[1]{%
    %\vspace*{30\p@}%
    {\parindent \z@ 
    \normalfont
    %\hrule
    %\vspace{10pt}%
    \interlinepenalty\@M
    \ChapterTextSize\bfseries #1\par
    \vspace{5pt}%
    \hrule
    \vskip 30\p@
}}
\fi

%------------------------------------------------------------------------------
% Section style
%------------------------------------------------------------------------------
\renewcommand{\section}[1]{%
  \par
  \pagebreak[1]%
  \refstepcounter{section}%
      \addcontentsline{toc}{section}{%
        {\protect\makebox{\thesection} \hspace*{3pt}#1}}%
      \vspace{20pt}%
      {\Large\textbf{ {\color{gray75}\thesection \textbar}\space\space{#1} }}%
      \par
}

%------------------------------------------------------------------------------
% Subsection style
%------------------------------------------------------------------------------
\renewcommand{\subsection}[1]{%
  \par
  \pagebreak[2]%
  \refstepcounter{subsection}%
      \addcontentsline{toc}{subsection}{%
        {\protect\makebox{\thesubsection} \hspace*{3pt}#1}}%
      \vspace{5pt}%
      {\large\textbf{ {\color{gray75}\thesubsection \textbar}\space\space{#1} }}%
      \par
}

%------------------------------------------------------------------------------
% Subsubsection style
%------------------------------------------------------------------------------
\renewcommand{\subsubsection}[1]{%
  \par
  \pagebreak[2]%
  \refstepcounter{subsubsection}%
    %\everypar={%
      \addcontentsline{toc}{subsubsection}{%
        {\protect\makebox{\thesubsubsection} \hspace*{3pt}#1}}%
      \vspace{5pt}%
      \textbf{ {\color{gray75}\thesubsubsection \textbar}\space\space{#1} }%
      
      %\everypar={}%
    %}%
  %\ignorespaces
}
% =========================================================================
%-----------------------------------------------------------------------------
%Texty
%-----------------------------------------------------------------------------
\def\@vut@CS{Vysoké učení technické v~Brně}
\def\@vut@EN{Brno University of Technology}
\def\@fit@CS{Fakulta informačních technologií}
\def\@fit@EN{Faculty of Information Technology}
\def\@author@CS{Autor práce}
\def\@author@EN{Author}
\def\@supervisor@CS{Vedoucí práce}
\def\@supervisor@EN{Supervisor}
\def\@dep@CS{Ústav}
\def\@dep@EN{Department of}
\def\@abstract@CS{Abstrakt}
\def\@abstractext@CS{Rozšířený abstrakt}
\def\@abstract@EN{Abstract}
\def\@keywords@CS{Klíčová slova}
\def\@keywords@EN{Keywords}
\def\@cite@CS{Citace}
\def\@cite@EN{Citation}
% \def\@copyright@CS{Tato práce vznikla jako školní dílo na Vysokém učení technickém v Brně, Fakultě informačních technologií. 
% Práce je chráněna autorským zákonem a její užití bez udělení oprávnění autorem je nezákonné, s výjimkou zákonem definovaných případů.}
\def\@copyright@CS{This thesis was created as a school publication on Brno University of Technology, Faculty of Information Technology.
This publication is protected by copyright and its usage without permission of its author is prohibited, except situations defined in law.}
%\def\@tdecl@CS{Prohlášení}
\def\@tdecl@CS{Declaration}
%\def\@tackn@CS{Poděkování}
\def\@tackn@CS{Acknowledgement}

\newif\ifnasel
\def\ifEqString#1#2#3#4{\def\testa{#1}\def\testb{#2}%
  \ifx\testa\testb \def#4{#3} \naseltrue \fi%
}

%Vyber typu projektu
\newcommand{\set@project}[1]{%
 \naselfalse
 \ifEqString{#1}{BP}{Bakalářská práce}{\@projecttype@CS}%
 \ifEqString{#1}{BP}{Bachelor's thesis}{\@projecttype@EN}%
 \ifEqString{#1}{SP}{Semestrální projekt}{\@projecttype@CS}%
 \ifEqString{#1}{SP}{Term project}{\@projecttype@EN}%
 \ifEqString{#1}{DP}{Diplomová práce}{\@projecttype@CS}%
 \ifEqString{#1}{DP}{Master's thesis}{\@projecttype@EN}%
 \ifEqString{#1}{DR}{Disertační práce}{\@projecttype@CS}%
 \ifEqString{#1}{DR}{PhD thesis}{\@projecttype@EN}%
 \ifnasel
 \else
   \typeout{Spatny typ projektu! Moznosti: BP, SP, DP, DR}\set@project{BP}
 \fi
}

%Vyber ustavu
\newcommand{\set@department}[1]{%
 \naselfalse
 \ifEqString{#1}{UIFS}{informačních systémů}{\@department@CS}%
 \ifEqString{#1}{UIFS}{Information Systems}{\@department@EN}%
 \ifEqString{#1}{UPSY}{počítačových systémů}{\@department@CS}%
 \ifEqString{#1}{UPSY}{Computer Systems}{\@department@EN}%
 \ifEqString{#1}{UITS}{inteligentních systémů}{\@department@CS}%
 \ifEqString{#1}{UITS}{Intelligent Systems}{\@department@EN}%
 \ifEqString{#1}{UPGM}{počítačové grafiky a multimédií}{\@department@CS}%
 \ifEqString{#1}{UPGM}{Computer Graphics and Multimedia}{\@department@EN}%
 \ifnasel
 \else
   \typeout{Spatny ustav! Moznosti: UPSY, UIFS, UITS, UPGM}\set@department{UIFS}
 \fi
}

%Nazev ustavu (CS, EN)
\def\@departmentname@CS{\@dep@CS\ \@department@CS}
\def\@departmentname@EN{\@dep@EN\ \@department@EN}

%Nazev prace (v jazyce prace)
\def\@title{\ifczech\@title@CS\else\@title@EN\fi}

%Jmeno, prijmeni, tituly autora
\def\get@author{\ifx\undefined\@author@tp\else%
\@author@tp~\fi\MakeUppercase{\@author}\ifx\undefined\@author@ta\else,~\@author@ta\fi}
%Jmeno, prijmeni, tituly vedouciho
\def\get@supervisor{\ifx\undefined\@supervisor@tp\else%
\@supervisor@tp~\fi\MakeUppercase{\@supervisor}\ifx\undefined\@supervisor@ta\else,~\@supervisor@ta\fi}


%-----------------------------------------------------------------------------
% Projectinfo - parametrizace sablony
%-----------------------------------------------------------------------------
%Parametry 
\define@key{projinfo}{title.cs}{\global\def\@title@CS{#1}}
\define@key{projinfo}{title.en}{\global\def\@title@EN{#1}}
\define@key{projinfo}{department}{\set@department{#1}}
\define@key{projinfo}{project}{\set@project{#1}}
\define@key{projinfo}{year}{\def\@year{#1}}
\define@key{projinfo}{date}{\def\@date{#1}}
\define@key{projinfo}{author}{\def\@author{#1}}
\define@key{projinfo}{author.title.a}{\def\@author@ta{#1}}
\define@key{projinfo}{author.title.p}{\def\@author@tp{#1}}
\define@key{projinfo}{supervisor}{\def\@supervisor{#1}}
\define@key{projinfo}{supervisor.title.a}{\def\@supervisor@ta{#1}}
\define@key{projinfo}{supervisor.title.p}{\def\@supervisor@tp{#1}}
\define@key{projinfo}{keywords.cs}{\def\@tkeywords@CS{#1}}
\define@key{projinfo}{keywords.en}{\def\@tkeywords@EN{#1}}
\define@key{projinfo}{abstract.cs}{\def\@tabstract@CS{#1}}
\define@key{projinfo}{abstractext.cs}{\def\@tabstractext@CS{#1}}
\define@key{projinfo}{abstract.en}{\def\@tabstract@EN{#1}}
\define@key{projinfo}{declaration}{\def\@declaration{#1}}
\define@key{projinfo}{acknowledgment}{\def\@acknowledgment{#1}}

%Vychozi hodnoty
\setkeys{projinfo}{
  title.cs={Název práce (česky)},title.en={Název práce(anglicky)}, 
  date=\today, project=BP, department=UIFS, declaration=, 
  abstract.cs=, abstract.en=, keywords.cs=, keywords.en=,
  author=Jmeno Prijmeni, supervisor=Jmeno Prijmeni
}%

\def\projectinfo{\setkeys{projinfo}}

%Prohlaseni
\newcommand{\declaration}[1]{\def\@declaration{#1}}

%Podekovani
\newcommand{\acknowledgment}[1]{\def\@acknowledgment{#1}}

%Abstrakt
\renewcommand{\abstract}[2][cs]{%
 \ifEqString{#1}{cs}{#2}{\@tabstract@CS}%
 \ifEqString{#1}{en}{#2}{\@tabstract@EN}%
}

%Klicova slova
\newcommand{\keywords}[2][cs]{%
 \ifEqString{#1}{cs}{#2}{\@tkeywords@CS}%
 \ifEqString{#1}{en}{#2}{\@tkeywords@EN}%
}

%Rozsireny abstrakt / Extended abstract
%\newcommand{\extendedabstract}[1]{%
% \def\@textendedabstract{#1}%
%}

\newlength{\mkspc}
\setlength{\mkspc}{2pt}

\def\setfontsize#1{\renewcommand{\baselinestretch}{1.5}\fontsize{#1}{\f@baselineskip}\selectfont}
%text
\newcommand{\mktxt}[2]{\vbox{\setfontsize{#1}\noindent#2}\vspace\mkspc}
%text pro titulní list / text for title page
\newcommand{\mktxtt}[2]{\vbox{\setfontsize{#1}\fosfamily\bfseries\noindent#2}\vspace\mkspc}
%text pro desky / text for cover
\newcommand{\mktxtc}[2]{\vbox{\setfontsize{#1}\ifCOPEN\fosfamily\fi\ifCBOPEN\fosfamily\bfseries\fi\noindent#2}\vspace\mkspc}
%všechna velká / uppercase
\newcommand{\mkuctxt}[2]{\vbox{\setfontsize{#1}\noindent\MakeUppercase{#2}}\vspace\mkspc}
\newcommand{\mkuctxtt}[2]{\vbox{\setfontsize{#1}\fosfamily\bfseries\noindent\MakeUppercase{#2}}\vspace\mkspc}
\newcommand{\mkuctxtc}[2]{\vbox{\setfontsize{#1}\ifCOPEN\fosfamily\fi\ifCBOPEN\fosfamily\bfseries\fi\noindent\MakeUppercase{#2}}\vspace\mkspc}
%bold
\newcommand{\mktxt@b}[2]{\vbox{\setfontsize{#1}\noindent\bf#2}\vspace\mkspc}
%bold pro titulní list / bold for title page
\newcommand{\mktxtt@b}[2]{\vbox{\setfontsize{#1}\fosfamily\bfseries\noindent\bf#2}\vspace\mkspc}
%-----------------------------------------------------------------------------
%Desky \makecover
%-----------------------------------------------------------------------------
\newcommand\makecover{\thispagestyle{empty}\null%
%===================================================
\fontfamily{phv}\selectfont%
%  
\mkuctxt{24}{\@vut@CS}
\mkuctxt{11}{\@vut@EN}

\vspace{12mm}

\mkuctxt{14}{\@fit@CS}
\mkuctxt{14}{\@departmentname@CS}

\vspace{4mm}

\mkuctxt{11}{\@fit@EN}
\mkuctxt{11}{\@departmentname@EN}

\vfill

\mkuctxt{18}{\@title} %Nazev prace v jazyce v jakem je napsana

\vfill

\mkuctxt{14}{\@projecttype@CS}
\mkuctxt{10}{\@projecttype@EN}
\vspace{5mm}

\mktxt{14}{\MakeUppercase{\@author@CS} \hfill \get@author}
\mkuctxt{10}{\@author@EN}

\vspace{10mm}

\mktxt{11}{BRNO \@year}

%===================================================
\newpage\fontfamily{\familydefault}\selectfont%
}

%-----------------------------------------------------------------------------
%Abstrakt, klicovaslova \makeabstract
%-----------------------------------------------------------------------------
\newcommand\makeabstract{%
\thispagestyle{empty}\null%

\mktxt@b{16}{\@abstract@CS}\noindent\@tabstract@CS

\vfill

\mktxt@b{16}{\@abstract@EN}\noindent\@tabstract@EN

\vfill

\mktxt@b{16}{\@keywords@CS}\noindent\@tkeywords@CS

\vfill

\mktxt@b{16}{\@keywords@EN}\noindent\@tkeywords@EN

\vfill

\ifczech
\mktxt@b{16}{\@cite@CS}
\else
\mktxt@b{16}{\@cite@EN}
\fi
\noindent\@author: \@title, \MakeLowercase{\@projecttype@CS}, Brno, FIT VUT v~Brně, \@year
%===================================================
\newpage
}

%-----------------------------------------------------------------------------
%Rozšířený Abstrakt, \makeabstractext
%-----------------------------------------------------------------------------
\newcommand\makeabstractext{%
\thispagestyle{empty}\null%

\mktxt@b{16}{\@abstractext@CS}\noindent\@tabstractext@CS

\vfill

\mktxt@b{16}{\@cite@CS}
\noindent\@author: \@title, \MakeLowercase{\@projecttype@CS}, Brno, FIT VUT v~Brně, \@year
%===================================================
\newpage
}


%-----------------------------------------------------------------------------
%Prohlaseni, podekovani \makedeclaration
%-----------------------------------------------------------------------------
\newcommand\makedeclaration{
\thispagestyle{empty}%
\mktxt@b{18}{\@title}

\vspace{10mm}
\mktxt@b{16}{\@tdecl@CS}
\noindent\@declaration

  \begin{flushright}
      \makebox[4cm]{\dotfill} \\
      \@author\\
      \@date
  \end{flushright}

\ifx\undefined\@acknowledgment
\else
\vspace{20mm}
\mktxt@b{16}{\@tackn@CS}
\noindent\@acknowledgment
\fi

\vfill

\noindent\copyright\ \@author, \@year.\newline
{\em \@copyright@CS}
%===================================================
\newpage
}

%-----------------------------------------------------------------------------
%Uvodni stranky \maketitle
%-----------------------------------------------------------------------------
\renewcommand\maketitle{%
\ifcover\makecover\fi%
\thispagestyle{empty}\null%
\iftwoside
  \pagestyle{empty}\null%
\fi
%=====================================================
\fontfamily{qhv}\selectfont%
%\newsavebox{\@obrlogo}\newsavebox{\@rtext}\newlength{\@vyskartext}\newlength{\@vyskaobr}%
\newsavebox{\@obrlogo}\newsavebox{\@rtext}\newlength{\@vyskartext}\newlength{\@sirkartext}\newlength{\@vyskaobr}\newlength{\@sirkaobr}%


\ifPrint
  \savebox{\@obrlogo}{\hspace*{-0.6cm}\includegraphics[width=4.1cm,keepaspectratio,trim={1.2cm 1.2cm 1.2cm 1.2cm},clip]{template-fig/VUT_symbol_cernobile_CZ}}%symbol VUT
\else
  \savebox{\@obrlogo}{\hspace*{-0.6cm}\includegraphics[width=4.1cm,keepaspectratio,trim={1.2cm 1.2cm 1.2cm 1.2cm},clip]{template-fig/VUT_symbol_barevne_CMYK_CZ}}%symbol VUT
\fi

\savebox{\@rtext}{\vbox{\mkuctxt{18}{\ifczech\@vut@CS\else\@vut@EN\fi}\mkuctxt{11}{\ifczech\@vut@EN\else\@vut@CS\fi}}}%text VUT
\settoheight{\@vyskaobr}{\makebox{\usebox{\@obrlogo}}}% vyska loga / logo height
\settowidth{\@sirkaobr}{\makebox{\usebox{\@obrlogo}}}% vyska loga
\settoheight{\@vyskartext}{\makebox{\usebox{\@rtext}}}% vyska textu / text height
\settowidth{\@sirkartext}{\makebox{\usebox{\@rtext}}}% sirka textu / text width
\addtolength{\@vyskaobr}{-\@vyskartext}%odecteme od vysky loga vysku textu / we will subtract text height from logo height
\addtolength{\@sirkartext}{-\@sirkaobr}\addtolength{\@sirkartext}{-10pt}%sirka textu na radku s obrazkem a odsazenim / text width on row with picture and indentation

%\newtoggle{gray_used}
%\togglefalse{gray_used}


\usebox{\@obrlogo}
  
\vspace{10mm}
  
\mkuctxtt{18}{\ifczech\@vut@CS\else\@vut@EN\fi}
\mkuctxtt{11}{\ifczech\@vut@EN\else\@vut@CS\fi}

\vspace{5mm}

\mkuctxtt{14}{\ifczech\@fit@CS\else\@fit@EN\fi}
\mkuctxtt{11}{\ifczech\@fit@EN\else\@fit@CS\fi}


\vspace{5mm}

\mkuctxtt{14}{\ifczech\@departmentname@CS\else\@departmentname@EN\fi}
\mkuctxtt{11}{\ifczech\@departmentname@EN\else\@departmentname@CS\fi}


\vspace{5mm}

\vfill

\mkuctxtt{18}{\ifczech\@title@CS\else\@title@EN\fi}
\mkuctxtt{10}{\ifczech\@title@EN\else\@title@CS\fi}

\vfill

\mkuctxtt{14}{\ifczech\@projecttype@CS\else\@projecttype@EN\fi}
\mkuctxtt{10}{\ifczech\@projecttype@EN\else\@projecttype@CS\fi}

\vspace{5mm}

\mktxtt{14}{\MakeUppercase{\ifczech\@author@CS\else\@author@EN\fi} \hfill \get@author}
\mkuctxtt{10}{\ifczech\@author@EN\else\@author@CS\fi}


\vspace{5mm}

\mktxtt{14}{\MakeUppercase{\ifczech\@supervisor@CS\else\@supervisor@EN\fi} \hfill \get@supervisor}
\mkuctxtt{10}{\ifczech\@supervisor@EN\else\@supervisor@CS\fi}

\vspace{10mm}

\mktxtt{11}{BRNO \@year}

\iftwoside
  \newgeometry{left=3.46cm, text={15.2cm,23.0cm}, top=2.96cm}
\fi

%zadani / assignment
\ifzadani\includepdf[pages=-,offset=0.6cm -1.7cm]{zadani.pdf}\fi
%\ifzadani\includepdf[pages=-,offset=0.6cm -1.7cm]{assignment.pdf}\fi

\iftwoside
  \cleardoublepage
  \pagestyle{plain}
\else
  \newpage
\fi
\fontfamily{\familydefault}\selectfont%
%=================================================================================
\makeabstract\makedeclaration
\clearpage
\setcounter{tocdepth}{2}\setcounter{page}{1}
}

%=================================================================================
%\makeabstract
%\ifczech\else
%\makeabstractext
%\fi % ifczech
%\makedeclaration
%\clearpage
%\setcounter{tocdepth}{2}\setcounter{page}{1}
%}

%-----------------------------------------------------------------------------
\def\uv#1{\iflanguage{english}{``#1''}%
                              {\quotedblbase #1\textquotedblleft}}%
%\catcode`\"=\active
%\def"{\bgroup
%    \iflanguage{english}%
%        {``\def"{''\egroup}}%
%        {\quotedblbase\def"{\textquotedblleft\egroup}}}

% Now, switch on what is appropriate for czech:

% czech quotation marks
% \bq - begin quotation, \eq - end quotation
\def\bq{\mbox{\kern.1ex\protect\raisebox{-1.3ex}[0pt][0pt]{''}\kern-.1ex}}
\def\eq{\mbox{\kern-.1ex``\kern.1ex}}
%\setlanguage{\czech}

{%                                      % Begin a group for which " is active
\catcode`\"=\active                     % Make " an active character
\catcode`\@=11                          % Make @ an active character
%
%  \csdoublequoteson
%
%       This macro makes " an active character, resets the control sequence
%       \dblqu@te to L (left), and defines \dq as a replacement for ".
%
\gdef\csdoublequoteson{%                % \csdoublequoteson enables "
    \gdef"{\czechquotes}%               % Define " as \czechquotes
    \global\catcode`\"=\active%         % Make " an active character
    \global\chardef\dq=`\"%             % Double-quote char. via \dq
    \global\let\dblqu@te=L%             % Always start with a left double-quote
    }                                   % End of macro
%
%  \bq, \eq
%
%      These macros define default characters for czech left and right
%      double quotes. Czech opening quote is created from two commas with
%      kerning depending on fontdimen four parameter of current font.
%      Better solution should be specially designed character with
%      proper kernings; if you have such characters in fonts
%      (e.g. in DC-fonts), use it instead. (e.g. define
%      macros \bq and \eq e.g. \def\bq{\char"130 }
%      in your document/style file-- not in csquote.sty!)
%      Similar solution is used for czech right quote.
%
%      \cs existence test, stolen from TeXbook exercise 7.7
\def\ifundefined#1{\expandafter\ifx\csname#1\endcsname\relax }%
%
%      another macro to be more efficient in time and space
\global\chardef\f@@r=4
%
\ifundefined{bq}%
\gdef\bq{\kern-.25\fontdimen\f@@r\font,\kern-.8\fontdimen\f@@r\font,%
                \kern-.35\fontdimen\f@@r\font}%
\fi
\ifundefined{eq}%
\gdef\eq{\kern-.35\fontdimen\f@@r\font`\kern-.8\fontdimen\f@@r\font`%
                \kern-.25\fontdimen\f@@r\font}
\fi
%
% Macro \uv for other usage of \bq and \eq.
%
\ifundefined{uv}\iflanguage{czech}%
        \gdef\uv#1{\bq #1\eq}
\fi
%
% \testquotes macro gives warning if citation span this place
%
\gdef\testquotes{\if R\dblqu@te
        \message{Warning: You forgot right double quote!}%
        \let\dblqu@te=L\fi}
%
%  Define the macro that will be executed whenever " is encountered.
%
\gdef\czechquotes{\protect\czechqu@tes}
\gdef\czechqu@tes{%
        %  If the double-quote is the first character in a new paragraph,
        %  make sure it becomes a left double-quote.  This case can be
        %  detected by checking to see if TeX is currently in vertical mode.
        %  If so, the double-quote is at the beginning of the paragraph
        %  (since " hasn't actually generated any horizontal mode tokens
        %  yet, TeX is still in vertical mode).  If the mode is vertical,
        %  set \dblqu@te equal to L.
        %
        \ifinner\else\ifvmode\testquotes\fi\fi%
        %
        %  Now insert the appropriate left or right double-quote.
        %
        %  If \dblqu@te is L, insert an opening quote and set \dblqu@te to R.
        %
        \if L\dblqu@te\bq\global\let\dblqu@te=R%
        %
        %  Otherwise, save the current \spacefactor, insert '', set \dblqu@te
        %  to L, and reset the original \spacefactor.
        %
        \else%
           \let\xxx=\spacefactor%               % Save the \spacefactor
           \eq%                                 % Insert ending quote
           \global\let\dblqu@te=L%              % and reset \dblqu@te
           \spacefactor\xxx%                    % Reset the \spacefactor
        \fi%                                    % End of \if L\dblqu@te...
        }                                       % End of " macro
}                                               % End of group

\gdef\csdoublequotesoff{%
        \catcode`\"=12%                         % Set " back to other
        }
%
% Czech quotes are default
%
\csdoublequoteson




\endinput
%%
%% End of file `fitthesis.cls'.
