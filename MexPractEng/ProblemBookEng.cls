\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{ProblemBookEng}[2018/01/21]
\LoadClass[onecolumn, twoside, 14pt]{extbook}
%========================================================================================================
%
%										Налаштування опцій класу
%
%========================================================================================================
\newif\ifelectronic
\newif\ifbiblatex
\newif\ifmarginversioninfo

\DeclareOption{print}{
	\PassOptionsToPackage{colorlinks=false}{hyperref}
	\PassOptionsToPackage{pdfsubject={Version for Printing}}{hyperref}
	\electronicfalse
}

\DeclareOption{electronic}{\def\defcolor{\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}\definecolor{malina}{rgb}{0.6,0.0,0.0}}
	\PassOptionsToPackage{linkcolor=malina}{hyperref}
	\PassOptionsToPackage{colorlinks=true}{hyperref}
	\PassOptionsToPackage{urlcolor=blue}{hyperref}
	\PassOptionsToPackage{citecolor=green!60!black}{hyperref}
	\PassOptionsToPackage{pdfsubject={Electronic Version}}{hyperref}
	\electronictrue
}

\DeclareOption{marginversioninfo}{%
	\marginversioninfotrue
}

\DeclareOption{biblatex}{
	\biblatextrue
}

\ExecuteOptions{electronic}
\ProcessOptions\relax
\defcolor{}

%========================================================================================================
%
%										Геометрія сторінки
%
%========================================================================================================
\RequirePackage[%
	a4paper,%
	footskip=1cm,%
	headsep=0.3cm,% 
	top=2cm, %поле сверху
	bottom=2cm, %поле снизу
	left=2cm, %поле ліворуч
	right=2cm, %поле праворуч
]{geometry}

%========================================================================================================
%
%										Налаштування мови та компіляторів
%
%========================================================================================================

\RequirePackage{ifluatex,ifxetex}
\newif\ifxetexorluatex
\ifxetex
	\xetexorluatextrue
\else
	\ifluatex
		\xetexorluatextrue
	\else
		\xetexorluatexfalse
	\fi
\fi
\ifxetexorluatex
	\RequirePackage{fontspec}
	\setsansfont{CMU Sans Serif}%{Arial}
	\setmainfont{CMU Serif}%{Times New Roman}
	\setmonofont{CMU Typewriter Text}%{Consolas}
	\defaultfontfeatures{Ligatures={TeX}}
\else
	\RequirePackage[T2A,T1]{fontenc}
	\RequirePackage[utf8]{inputenc}
	\input{glyphtounicode}
	\pdfgentounicode=1
	%\RequirePackage{pscyr}
	\RequirePackage{cmap}
	\renewcommand{\sfdefault}{fos}
	\renewcommand{\bfdefault}{b}
\fi
\RequirePackage[russian, ukrainian, english]{babel}

%========================================================================================================
%
%										Налаштування типографських вимог
%
%========================================================================================================

\RequirePackage{microtype}
\RequirePackage[nosingleletter, hyphenation, lastparline]{impnattypo}
%\usepackage[all]{nowidow}
%\clubpenalty =1000
%\widowpenalty=1000

%========================================================================================================
%
%										Пакети
%
%========================================================================================================

\RequirePackage[overload]{textcase}
\let\MakeUppercase\MakeTextUppercase
\RequirePackage{indentfirst}
% ------------------------------------ Плаваючі об'єкти -------------------------------------------------
%\RequirePackage{subfig}
%\renewcommand\thesubfigure{\alph{subfigure}}
\RequirePackage{wrapfig}
% ------------------------------------ Таблиці ----------------------------------------------------------
\usepackage{colortbl}
\usepackage{longtable}
\usepackage{array,ragged2e}
\setlength\arrayrulewidth{1pt}
% ------------------------------------ Математика -------------------------------------------------------
\ifluatex
	\RequirePackage{lualatex-math}
	\RequirePackage{amsmath}
	\RequirePackage[math-style=TeX,bold-style=TeX]{unicode-math}
\else
	\RequirePackage{amsfonts}
	\RequirePackage{amssymb}
\fi
\RequirePackage{siunitx}
	\sisetup{per-mode = symbol-or-fraction}
	\sisetup{inter-unit-product =\cdot}
\RequirePackage{nicefrac}
\let\nfrac\nicefrac
\allowdisplaybreaks
% -------------------------------- Визначення математичних команд -----------------------------------
\def\EMF{\ifmmode\mathcal{E}\else$\mathcal{E}$\fi}
\newcommand{\vect}[1]{\symbf{#1}}
\def\Efield{\vect{E}}          % --- Визначення вектора електричного поля            --- 
\def\Dfield{\vect{D}}          % --- Визначення електричної індукції                 --- 
\def\Bfield{\vect{B}}          % --- Визначення вектора магнітногї індукції          --- 
\def\Hfield{\vect{H}}          % --- Визначення вектора напруженості магнітного поля --- 
\def\rot{\symbf{\nabla}\times} % --- Визначення ротора                               ---
\def\divg{\symbf{\nabla}\cdot} % --- Визначення дівергенції                          ---
\AtBeginDocument{%
	\let\phi\varphi
	\let\epsilon\varepsilon
	\DeclareMathOperator{\const}{const}
	\DeclareMathOperator{\inv}{inv}
	\newcommand{\Laplasian}{\Delta}
}

% ---------------------------------------- Таблиці ------------------------------------------------------
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\newcolumntype{R}{>{\footnotesize}r}
\newcolumntype{L}{>{\footnotesize}l}
\RequirePackage{varwidth}
\newcolumntype{M}[1]{>{\begin{varwidth}[t]{#1}}l<{\end{varwidth}}}
\newcommand{\centercell}[1]{\multicolumn{1}{c}{#1}}
\newcommand{\specialcell}[3][c]{%
	\begin{tabular}[#1]{@{}#2@{}}#3\end{tabular}}
\RequirePackage{colortbl}
\setlength{\aboverulesep}{0pt}
\setlength{\belowrulesep}{0pt}
\setlength{\extrarowheight}{0.75ex}
\RequirePackage[justification=centering,labelsep=period]{caption}
\RequirePackage{subcaption}
\RequirePackage{multirow}
\RequirePackage[version=4]{mhchem}
% ------------------------------------- Фалові операції -------------------------------------------------
\RequirePackage{currfile}
% ------------------------------------- Пакети LaTeX3 ---------------------------------------------------
\RequirePackage{xparse}
% -------------------------------------------------------------------------------------------------------
\RequirePackage{epigraph}
\setlength\epigraphwidth{.8\textwidth}
\setlength\epigraphrule{0pt}
\renewcommand{\textflush}{flushepinormal}
\RequirePackage{lastpage}
\RequirePackage[disable]{todonotes}
\RequirePackage{pdftexcmds}
\RequirePackage[most, many]{tcolorbox}

%========================================================================================================
%
%										Рисування
%
%========================================================================================================
\RequirePackage{cutwin}
\RequirePackage{tikz, pgfplots, tikz-3dplot}
%---------------------------------------------------
%\usetikzlibrary{external}
%\usepgfplotslibrary{external}
%\tikzexternalize[optimize=false, prefix=figures/]
%---------------------------------------------------
\usetikzlibrary{decorations.text, decorations.markings}
\usetikzlibrary{intersections}
\usetikzlibrary{arrows.meta}
\usetikzlibrary{shapes, shadows, snakes}
\usetikzlibrary{quotes,angles}
\pgfdeclarelayer{bg}    % declare background layer
\pgfsetlayers{bg,main}  % set the order of the layers (main is the standard layer)
\usetikzlibrary{shapes.geometric,calc}
\usepgfplotslibrary{fillbetween}
\pgfplotsset{
	%every tick label/.append style={scale=0.5},
	every axis label/.append style={font=\small},
	compat=newest,
}
\tikzset{every picture/.style={font=\small}}
\tikzset{
	partial ellipse/.style args={#1:#2:#3}{
			insert path={+ (#1:#3) arc (#1:#2:#3)}
		}
}

\tikzset{add reference/.style={insert path={%
			coordinate [pos=0,xshift=-0.5\pgflinewidth,yshift=-0.5\pgflinewidth] (#1 south west) 
			coordinate [pos=1,xshift=0.5\pgflinewidth,yshift=0.5\pgflinewidth]   (#1 north east)
			coordinate [pos=.5] (#1 center)                        
			(#1 south west |- #1 north east)     coordinate (#1 north west)
			(#1 center     |- #1 north east)     coordinate (#1 north)
			(#1 center     |- #1 south west)     coordinate (#1 south)
			(#1 south west -| #1 north east)     coordinate (#1 south east)
			(#1 center     -| #1 south west)     coordinate (#1 west)
			(#1 center     -| #1 north east)     coordinate (#1 east)   
}}}  

\tikzset{pt/.style={circle,fill=#1,inner sep=0mm,minimum size=4pt}}

\tikzset{%
	tangent/.style={
		decoration={
			markings,% switch on markings
			mark=
			at position #1
			with
			{
				\coordinate (tangent point-\pgfkeysvalueof{/pgf/decoration/mark info/sequence number}) at (0pt,0pt);
				\coordinate (tangent unit vector-\pgfkeysvalueof{/pgf/decoration/mark info/sequence number}) at (1,0pt);
				\coordinate (tangent orthogonal unit vector-\pgfkeysvalueof{/pgf/decoration/mark info/sequence number}) at (0pt,1);
			}
		},
		postaction=decorate
	},
	use tangent/.style={
		shift=(tangent point-#1),
		x=(tangent unit vector-#1),
		y=(tangent orthogonal unit vector-#1)
	},
	use tangent/.default=1
}

\tikzset{
	right angle quadrant/.code={
		\pgfmathsetmacro\quadranta{{1,1,-1,-1}[#1-1]}     % Arrays for selecting quadrant
		\pgfmathsetmacro\quadrantb{{1,-1,-1,1}[#1-1]}},
	right angle quadrant=1, % Make sure it is set, even if not called explicitly
	right angle length/.code={\def\rightanglelength{#1}},   % Length of symbol
	right angle length=2ex, % Make sure it is set...
	right angle symbol/.style n args={3}{
		insert path={
			let \p0 = ($(#1)!(#3)!(#2)$) in     % Intersection
			let \p1 = ($(\p0)!\quadranta*\rightanglelength!(#3)$), % Point on base line
			\p2 = ($(\p0)!\quadrantb*\rightanglelength!(#2)$) in % Point on perpendicular line
			let \p3 = ($(\p1)+(\p2)-(\p0)$) in  % Corner point of symbol
			(\p1) -- (\p3) -- (\p2)
		}
	}
}

% -------------------------------------- Електричні кола ------------------------------------------------
\usetikzlibrary{circuits.ee.IEC}
\tikzset{circuit ee IEC,
	every info/.style=red,
	semithick,
	every info/.style={font=\footnotesize},
	small circuit symbols,
	circuit declare symbol = ocontact,
	circuit declare symbol = multimeter,
	circuit declare symbol = ampermeter,
	circuit declare symbol = voltmeter,
	circuit declare symbol = galvanometer,
	circuit declare symbol = ac source,
	set ocontact graphic = {draw, fill = white, generic circle IEC, shape=circle, minimum size=1mm},
	set multimeter graphic = {draw,generic circle IEC, minimum size=5mm},
	set ampermeter graphic = {draw,generic circle IEC, minimum size=5mm,info=center:A},%
	set voltmeter graphic = {draw,generic circle IEC, minimum size=5mm,info=center:V},
	set galvanometer graphic = {draw,generic circle IEC, minimum size=5mm,info=center:G},
	set ac source graphic = ac source IEC graphic,
	ac source IEC graphic/.style=
		{
			transform shape,
			circuit symbol lines,
			circuit symbol size = width 3 height 3,
			shape=generic circle IEC,
			/pgf/generic circle IEC/before background=
				{
					\pgfpathmoveto{\pgfpoint{-0.575pt}{0pt}}
					\pgfpathsine{\pgfpoint{0.3pt}{0.3pt}}
					\pgfpathcosine{\pgfpoint{0.3pt}{-0.3pt}}
					\pgfpathsine{\pgfpoint{0.3pt}{-0.3pt}}
					\pgfpathcosine{\pgfpoint{0.3pt}{0.3pt}}
					\pgfusepathqstroke
				}
		}
}

% -------------------------------------- Паттерни -------------------------------------------------------
\usetikzlibrary{patterns}
\tikzstyle{ground}=[fill,pattern=north east lines,draw=none,minimum width=0.3,minimum height=0.6]

%========================================================================================================
%
%                                         Друк версії документу на полях
%
%========================================================================================================
\ifmarginversioninfo
	% http://tex.stackexchange.com/questions/54808/rotated-running-text-in-right-margin
	\RequirePackage[contents={},opacity=0.5,scale=1.5,color=gray]{background}
	\newcommand\Texta{\bf\large Version from \today} % odd page
	\newcommand\Textb{\bf\large Version from \today} % even pages
	%-----------------------------------------
	\AddEverypageHook{%
		\ifodd\value{page}
			\backgroundsetup{
				angle=90,
				position={-0.06\textwidth,-0.35\textheight},
				contents={\Texta}
			}%
		\else
			%-----------------------------------------
			\backgroundsetup{
				angle=90,
				position={0.68\textwidth,-0.35\textheight},
				contents={\Textb}
			}%
		\fi
		\BgMaterial}
\fi

%========================================================================================================
%
%										    Інтервали
%
%========================================================================================================
\RequirePackage{setspace}
\RequirePackage{parskip}
%\setlength{\parskip}{\medskipamount}
\setlength{\parskip}{0.5ex}%
\setlength{\parindent}{2.5em}%

%\renewcommand{\baselinestretch}{1.1}
\def\@textbottom{\vskip \z@ \@plus 1pt}
\let\@texttop\relax
\setlength{\emergencystretch}{3em}
\newlength{\@spase}
\setlength{\@spase}{0.5ex} % space between \@sectiontitlemark and \thesection
%========================================================================================================
%
%										   Рубрикація
%
%========================================================================================================
\let\cleardoublepage\clearpage
\def\@sectiontitlemark{\S}
\newcommand{\@secnum@dot}{.}
\newcommand{\@chapnum@dot}{.}
% ---------------------------------------- Верстка ДОДАТКІВ ---------------------------------------------
\newif\ifappendix
\renewcommand\appendix{\par
	\gdef\thesection{\@Alph\c@section}
	\@addtoreset{table}{section}
	\renewcommand\thetable%
	{\thesection.\@arabic\c@table}
	\setcounter{chapter}{0}%
	\setcounter{section}{0}%
	\clearpage\pagestyle{main}
	\def\@sectiontitlemark{\appendixname}
	\appendixtrue
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\chapter*{Additions}%
	\if@restonecol\twocolumn\fi
}
% ---------------------------------------- Верстка ВІДПОВІДЕЙ -------------------------------------------
\newif\ifanswers
\newcommand\answers{\par
	\def\anwername{Answers}
	\setcounter{chapter}{0}%
	\setcounter{section}{0}%
	\answerstrue
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\chapter*{\anwername}%
	\if@restonecol\twocolumn\fi
}
% ---------------------------------------- Кольори секцій -----------------------------------------------
\definecolor{titlebgdark}{RGB}{0,163,243}
\definecolor{titlebglight}{RGB}{191,233,251}
% ---------------------------------------- Лічильник зносок починаються з кожної сторінки ---------------
\@newctr{footnote}[page]
% ---------------------------------------- Верстка ЗМІСТУ------------------------------------------------
\newif\iftoc
\renewcommand\tableofcontents{%
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\toctrue
	\chapter*{\contentsname
		\@mkboth{%
			\MakeUppercase\contentsname}{\MakeUppercase\contentsname}}\hypertarget{tocpage}{}%
	\@starttoc{toc}%
	\if@restonecol\twocolumn\fi
	\tocfalse
}
% ---------------------------------------- Верстка ЗМІСТУ для Розділів ----------------------------------    

\renewcommand*\l@chapter[2]{%
	\ifnum \c@tocdepth >\m@ne
		\addpenalty{-\@highpenalty}%
		\vskip 1.0em \@plus\p@
		\setlength\@tempdima{1.5em}%
		\begingroup
		\parindent \z@ \rightskip \@pnumwidth
		\parfillskip -\@pnumwidth
		\leavevmode \bfseries
		\advance\leftskip\@tempdima
		\hskip -\leftskip
		#1\leaders\hbox to .5em{\hss.\hss}\hfil \nobreak\hb@xt@\@pnumwidth{\hss  #2}\par
		\penalty\@highpenalty%
		\endgroup
	\fi}

% ---------------------------------------- Верстка РОЗДІЛУ ----------------------------------------------
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{chapterpage}%
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter}

\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne%     #1 -- скорочена назва розділу, #2 -- повна назва розділу
		\if@mainmatter
			\refstepcounter{chapter}%                         При виклику команди \chapter змінювати лічильник на одиницю
			\addcontentsline{toc}{chapter}%                   
			{\@chapapp~\protect\numberline{\thechapter\@chapnum@dot~}#1}% Додати в зміст "Друк Розділ 1. Назва розділу", #1 -- аргумент команди \chapter"
		\else
			\addcontentsline{toc}{chapter}{#1}%
		\fi
	\else
		\addcontentsline{toc}{chapter}{#1}%
	\fi
	\chaptermark{#1}%                                 Додати "Назву розділу" для колонтитулів
	\addtocontents{lot}{\protect\addvspace{10\p@}}%
	\if@twocolumn
		\@topnewpage[\@makechapterhead{#2}]%
	\else
		\@makechapterhead{#2}%                            Створити вигляд розділу
		\@afterheading
	\fi}

\def\@schapter#1{%                                    Аналогічно до команди \@chapter, але для версії з зірочкою
	\if@twocolumn
		\@topnewpage[\@makeschapterhead{#1}]%
	\else
		\@makeschapterhead{#1}%
		\@afterheading
	\fi
	\chaptermark{#1}%
	\iftoc\relax\else
		\addcontentsline{toc}{chapter}{#1}
	\fi
}

\def\@makechapterhead#1{%
	\vspace*{50\p@}%
	{\parindent \z@ \centering \normalfont
		%\hrulefill\quad\raisebox{-0.5ex}{\large\@chapapp\space\thechapter}\quad\hrulefill\par
		%\vskip 10\p@
		\begin{tcolorbox}[
				enhanced,
				colback=titlebgdark,
				boxrule=0.25cm,
				colframe=titlebglight,
				arc=0pt,
				outer arc=0pt,
				leftrule=0pt,
				rightrule=0pt,
				fontupper=\color{white}\sffamily\bfseries\Large,
				enlarge left by=-1in-\hoffset-\oddsidemargin,
				enlarge right by=-\paperwidth+1in+\hoffset+\oddsidemargin+\textwidth,
				width=\paperwidth,
				left=1in+\hoffset+\oddsidemargin,
				right=\paperwidth-1in-\hoffset-\oddsidemargin-\textwidth,
				top=0.7cm,
				bottom=0.7cm,
				overlay={
						\node[%
							fill=titlebgdark,
							draw=titlebglight,
							line width=0.15cm,
							inner sep=0pt,
							text width=1.7cm,
							minimum height=1.7cm,
							align=center,
							font=\color{white}\sffamily\bfseries\fontsize{30}{36}\selectfont
						]
						(chapname)
						at ([xshift=-4cm]frame.north east)
						{\thechapter};
						\node[font=\small,anchor=south,inner sep=2pt] at (chapname.north)
						{\MakeTextUppercase{\sffamily\bfseries\@chapapp}};
					}
			]
			#1
		\end{tcolorbox}%
		%		\Large\bfseries  #1\par
		%		\hrulefill\par
		\nobreak
		\vskip 40\p@
	}}

\def\@makeschapterhead#1{%
	\vspace*{50\p@}%
	{\parindent \z@ \raggedright
		\normalfont
		\begin{tcolorbox}[
				enhanced,
				colback=titlebgdark,
				boxrule=0.25cm,
				colframe=titlebglight,
				arc=0pt,
				outer arc=0pt,
				remember as=title,
				leftrule=0pt,
				rightrule=0pt,
				fontupper=\color{white}\sffamily\bfseries\Large,
				enlarge left by=-1in-\hoffset-\oddsidemargin,
				enlarge right by=-\paperwidth+1in+\hoffset+\oddsidemargin+\textwidth,
				width=\paperwidth,
				left=1in+\hoffset+\oddsidemargin,
				right=\paperwidth-1in-\hoffset-\oddsidemargin-\textwidth,
				top=0.7cm,
				bottom=0.7cm,
			]
			#1
		\end{tcolorbox}%
		\vskip 40\p@
	}}

% ---------------------------------------- Верстка ЗМІСТУ для Секцій ----------------------------------- 
\newlength\@sectoctitle@len                                                           % Ширина мітки разом з номером для секції
\newlength\@chaptoclabel@len\settowidth\@chaptoclabel@len{\@chapapp}                  % Ширина мітки для розділу
\newlength\@sectiontitlemark@box\settowidth\@sectiontitlemark@box{\@sectiontitlemark} % Ширина мітки для секції
\advance\@chaptoclabel@len by -\@sectiontitlemark@box
\renewcommand*\l@section{\@dottedtocline{2}{\@chaptoclabel@len}{\@sectoctitle@len}}
% ---------------------------------------- Верстка ЗМІСТУ для Підсекцій --------------------------------- 

\newlength{\thesubsection@len}\settowidth{\thesubsection@len}{\thesubsection\ }
\newlength{\thesection@len}\settowidth{\thesection@len}{\thesection\ }
\renewcommand*\l@subsection{\@dottedtocline{2}{6em}{\thesubsection@len}}

% ---------------------------------------- Верстка СЕКЦІЇ------------------------------------------------
\renewcommand\section{\global\@topnum\z@
  \@afterindentfalse
  \secdef\@section\@ssection}
\def\@section[#1]#2{\refstepcounter{section}%
	\def\@sectoclabel@format{\@sectiontitlemark\hspace\@spase\thesection\@secnum@dot\space}
	\settowidth{\@tempdimb}{\@sectoclabel@format}
	\ifdim\@tempdimb=\@sectoctitle@len
		\relax
	\else
		\setlength\@sectoctitle@len{\@tempdimb}
		\addtocontents{toc}{\setlength\@sectoctitle@len{\the\@tempdimb}}
	\fi
	\addcontentsline{toc}{section}{\protect\numberline{\@sectoclabel@format}#1}%
	\sectionmark{#1}%
	\addtocontents{lof}{\protect\addvspace{10\p@}}%
	\addtocontents{lot}{\protect\addvspace{10\p@}}%
	\@makesectionhead{#2}%
	\@afterheading
}
\def\@makesectionhead#1{%
	\vspace*{10\p@}%
	{\parindent \z@ \raggedright \normalfont
		\sffamily\large\bfseries \@sectiontitlemark\hspace\@spase\thesection\@secnum@dot\hspace{1ex}#1\par\nobreak
		\vskip 10\p@
	}}
\def\@ssection#1{\refstepcounter{section}%
	\if@twocolumn
		\@topnewpage[\@makessectionhead{#1}]%
	\else
		\@makessectionhead{#1}%
		\@afterheading
		%\addcontentsline{toc}{section}{#1}% % 21/12/2017
		\sectionmark{#1}%
	\fi}
\def\@makessectionhead#1{%
	\vspace*{10\p@}%
	{\parindent \z@ \raggedright
		\normalfont
		\interlinepenalty\@M
		\sffamily\large\bfseries  #1\par\nobreak
		\vskip 10\p@
	}}
% ---------------------------------------- Верстка ПІДСЕКЦІЇ---------------------------------------------

\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\normalfont\normalsize\bfseries}}

%========================================================================================================
%
%										Колонтитули
%
%========================================================================================================

% ---------------------------------------- Колонтитули для РОЗДІЛУ --------------------------------------
\def\ps@chapterpage{%
	\renewcommand{\@oddhead}%
	{
	}% конец макроопределения

	\renewcommand{\@evenhead}%
	{
	}% 

	\renewcommand{\@oddfoot}%
	{\raisebox{0pt}[\headheight][0pt]{% 
			\vbox{\hbox to\textwidth{\strut
					\small{\hfil\small\hyperlink{tocpage}{\thepage}}\hfil}}}% конец блока
	}% 

	\renewcommand{\@evenfoot}%
	{\raisebox{0pt}[\headheight][0pt]{% 
			\vbox{\hbox to\textwidth{\strut
					\small{\hfil{\small\hyperlink{tocpage}{\thepage}}\hfil}}}}% конец блока
	}% ия
}

% ---------------------------------------- Колонтитули для основних сторінок ----------------------------

\def\ps@main{%	
\def\chaptermark##1{                       % ##1 - містить значення, яке сюди вкладують команди \@chapter та \@schapter
\markboth {%
	\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter%
			\ifappendix\relax      % Якщо сторінка додатків то друкувати "Додатки"
			\else
				\iftoc\relax                    % Якщо сторінка змісту то друкувати "Зміст"
				\else
					\ifanswers\relax             % Якщо сторінка з відповідями, друкувати "Відповіді"
					\else
						\protect\hyperlink{\@currentHref}{\@chapapp\ \thechapter\@chapnum@dot} \ % Якщо стрінка з задачими, друкувати "Розділ 1." (тут \@chapapp=Розділ)
					\fi
				\fi
			\fi
		\fi
	\fi
	##1}{\iftoc\contentsname\fi}}%
\def\sectionmark##1{%
	\ifanswers
		\markright {\anwername}
	\else
		\markright {%
			\ifnum \c@secnumdepth >\z@
				\protect\hyperlink{\@currentHref}{\@sectiontitlemark~\thesection\@secnum@dot}\ %\@sectiontitlemark = \S (для Розділів), інші значення встановлюються командами \appendix та \answers
			\fi
			##1}%
	\fi%
}

\renewcommand{\@oddhead}%
{\raisebox{0pt}[\headheight][0pt]{% начало блока
		\vbox{\hbox to\textwidth{\strut
				\small{\hfil\small\leftmark\hfil}}\hrule}}% конец блока
}% конец макроопределения

\renewcommand{\@evenhead}%
{\raisebox{0pt}[\headheight][0pt]{% начало блока
		\vbox{\hbox to\textwidth{\strut
				\small{\hfil{\small\rightmark}\hfil}}\hrule}}% конец блока
}% конец макроопределения

\renewcommand{\@oddfoot}%
{\raisebox{0pt}[\headheight][0pt]{% начало блока
		\vbox{\hbox to\textwidth{\strut
				\small{\hfil\small\hyperlink{tocpage}{\thepage}}\hfil}}}% конец блока
}% конец макроопределения

\renewcommand{\@evenfoot}%
{\raisebox{0pt}[\headheight][0pt]{% начало блока
		\vbox{\hbox to\textwidth{\strut
				\small{\hfil{\small\hyperlink{tocpage}{\thepage}}\hfil}}}}% конец блока
}% конец макроопределения
}

%========================================================================================================
%
%										Підписи під таблицями, рисунками та списки
%
%========================================================================================================
\RequirePackage{chngcntr}
\counterwithin{figure}{chapter}
%\def\tabcaption{\def\@captype{table}\caption}
%\def\figcaption{\def\@captype{figure}\caption}
\RequirePackage[inline]{enumitem}
\setlist{nolistsep}


% ------------------------------------------------ Відступи в формулах ----------------------------------

\g@addto@macro\normalsize{%
	\setlength\abovedisplayskip{1ex}
	\setlength\belowdisplayskip{1ex}
	\setlength\abovedisplayshortskip{1ex}
	\setlength\belowdisplayshortskip{1ex}
}

% ----------------------------------------- Відступ між написом та рисунком -----------------------------

\setlength{\textfloatsep}{5pt}

% ---------------------------------------- Підписи до рисунку (розмір тексту) ---------------------------

\captionsetup[figure]{font=small,labelfont=small}
\captionsetup[table]{font=small,labelfont=small}

% --------------------------------------------- Bibliography spacing ------------------------------------
\newlength{\bibitemsep}\setlength{\bibitemsep}{.1\baselineskip plus .05\baselineskip minus .05\baselineskip}
\newlength{\bibparskip}\setlength{\bibparskip}{0pt}
\let\oldthebibliography\thebibliography
\renewcommand\thebibliography[1]{%
	\oldthebibliography{#1}%
	\setlength{\parskip}{\bibitemsep}%
	\setlength{\itemsep}{\bibparskip}%
}

%========================================================================================================
%
%										            HYPERREF
%
%========================================================================================================

\RequirePackage[%
	bookmarks = true,
	bookmarksnumbered=true,
	unicode,
	linktocpage = true,
	hypertexnames=false,
	pdftoolbar=false,
	pdfpagelayout=TwoPageRight,
	pdfauthor={Ponomarenko S.M.},
	pdfdisplaydoctitle=true,
	pdfkeywords={Electrostatics, Magnetostatics, Electrodynamics, Current, Field},
	pdfencoding=auto
]%
{hyperref}
\RequirePackage[all]{hypcap}

% ------------------------------------ Патч для україомовної назви розділу для nameref ------------------ % 
\addto\extrasukrainian{%
	\renewcommand{\chapterautorefname}{}%
}
% ------------------------------------------------------------------------------------------------------- %

\AtBeginDocument{\hypersetup{pdftitle={\@title}}}

%========================================================================================================
%
%										Налаштування бібліографії
%
%========================================================================================================

\ifbiblatex
  \RequirePackage[backend=biber, bibstyle=gost-numeric, babel=other, isbn=true, url=false, defernumbers=true]{biblatex}
  \newbibmacro{string+url}[1]{%
  	\iffieldundef{url}{#1}{\href{\thefield{url}}{#1}}%
  }
  \DeclareFieldFormat{title}{\usebibmacro{string+url}{#1}}
  \RequirePackage{csquotes}

  \DefineBibliographyStrings{ukrainian}{%
  	bibliography = {Література},
  }
  \DeclareBibliographyCategory{Textbooks}
  \DeclareBibliographyCategory{Problems}
\else
    \renewcommand{\@biblabel}[1]{#1.}
    \addto\captionsukrainian{%
    \renewcommand{\bibname}{Література}%
    }
\fi

%========================================================================================================
%
%										Генеррування відповідей до задач
%
%========================================================================================================

\RequirePackage[amsmath]{ntheorem}
\RequirePackage{answers}
\newcommand{\probnum@dot}{.}
\newtheoremstyle{problemstyle}%
	{%	
	\hypertarget{problem:\@roman{##2}}{}%
	\ifcsname r@solution\@roman{##2}\endcsname
		\item[\theorem@headerfont{\hyperlink{solution:\@roman{##2}}{##2\probnum@dot}}]
	\else
		\item[\theorem@headerfont{##2\probnum@dot}]
	\fi
}%
{%
	\hypertarget{problem:\@roman{##2}}{}%
	\ifcsname r@solution\@roman{##2}\endcsname
		\item[\theorem@headerfont{\hyperlink{solution:\@roman{##2}}{##2\probnum@dot}}] (##3)
	\else
		\item[\theorem@headerfont{##2\probnum@dot}] (##3)
	\fi
}

\theorempostskip{1em}
%\theoremprework{\parindent=4em}
%\theoremseparator{\quad}
\theoremstyle{problemstyle}
\theoremheaderfont{\hspace{\parindent}\bfseries}
\theorembodyfont{\normalfont}

\newtheorem{problem}{}[chapter]
%\renewcommand{\theproblem}{\thechapter.\arabic{problem}}

\Newassociation{solution}{Solution}{answer}
\renewenvironment{Solution}[1]{%
	\par%
	\addpenalty{-\@lowpenalty}%
	\label{solution\@roman{#1}}%
	\hypertarget{solution:\@roman{#1}}{\noindent\hyperlink{problem:\@roman{#1}}{\bfseries #1\probnum@dot}}
}{%
}{%
	\par%
	\addpenalty{-\@lowpenalty}%
}
%========================================================================================================
%
%									Команда вставки задач та відповідей
%
%       https://tex.stackexchange.com/questions/382776/how-to-create-list-and-assign-it-to-variable
%========================================================================================================
\ExplSyntaxOn
% ---------------------------------------- Another good solution ----------------------------------------
%\NewDocumentCommand{\multiinclude}{ m O{} }
% {
%  \clist_map_inline:cn {chapter_list_#1_clist} { \InputIfFileExists{##1/##1#2}{}{}\par}
% }

%\NewDocumentCommand{\MakeChapterList}{ m m }
% {
%  \clist_set:cn {chapter_list_#1_clist} { #2 }
% } 
% -------------------------------------------------------------------------------------------------------
\NewDocumentCommand{\multiinclude}{ m O{} }
{
	\clist_set:Nx \l_Chapters_clist{ #1 }
	\clist_map_inline:Nn \l_Chapters_clist { \InputIfFileExists{##1/##1#2}{}{}\par}
}

\ExplSyntaxOff
%========================================================================================================

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      INSBOX --- macros for inserting pictures into paragraphs     %
%       Micha\l{} Gulczy\'nski, Szczecin, Jan 1996 / Feb 1998       %
%                     mgulcz@we.tuniv.szczecin.pl                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  version 2.2
%
%  available macros:
%    * \InsertBoxC{anybox}
%        insert a centered box (use int _inside_ a paragraph)
%    * \InsertBoxL{after_line}{anybox}[correction]
%    * \InsertBoxR{after_line}{anybox}[correction]
%        insert a box in the left/right after specified number of lines;
%        correction specified in square brackets is optional;
%        both macros should be called _before_ a paragraph
%    * \MoveBelowBox
%        start a new paragraph just below the current frame
%
%  see the demo.tex file for more information
%


%  Margin between the text and the box:
\newdimen\@InsertBoxMargin
\@InsertBoxMargin = 2mm
%
%  definition of \ParShape, an inproved version of plain \parshape
%
\newcount\@numlines    % sum: m_1+...+m_n
\newcount\@linesleft   % counter used when reading lines of \ParShape
\def\ParShape{%
	\@numlines = 0
	\def\@parshapedata{ }% here we'll collect data for plain \parshape
	\afterassignment\@beginParShape
	\@linesleft
}%
\def\@beginParShape{%
	\ifnum \@linesleft = 0
	\let\@whatnext = \@endParShape
	\else
	\let\@whatnext = \@readnextline
	\fi
	\@whatnext
}%
\def\@endParShape{%
	\global\parshape = \@numlines \@parshapedata
}%
\def\@readnextline#1 #2 #3 {% #1 #2 #3 are: m_i, leftskip_i, rightskip_i
	\ifnum #1 > 0
	\bgroup  % I want to keep changes of \dimen0 and \count0 local
	\dimen0 = \hsize
	\advance \dimen0 by -#2  % \parshape requires left skip and
	\advance \dimen0 by -#3  % _length_of_line_ (not right skip!)
	\count0 = 0
	\loop
	\global\edef\@parshapedata{%
		\@parshapedata    % add to \@parshapedata:
		#2                % left skip
		\space            % a space
		\the\dimen0       % length of line
		\space            % another space
	}%
	\advance \count0 by 1
	\ifnum \count0 < #1
	\repeat
	\egroup
	\advance \@numlines by #1
	\fi
	\advance \@linesleft by -1
	\@beginParShape
}%
%
%  \InsertBoxC, \InsertBoxL, \InsertBoxR
%
\newbox\@boxcontent     % box containing the picture to be inserted
\newcount\@numnormal    % number of leading lines to typeset normally
\newdimen\@framewidth   % width of the frame
\newdimen\@wherebottom  % position of frame's bottom
\newif\if@byframe       % true if we are just beside the frame
\@byframefalse
%
%
\def\InsertBoxC#1{%
	\leavevmode
	\vadjust{
		\vskip \@InsertBoxMargin
		\hbox to \hsize{\hss#1\hss}
		\vskip \@InsertBoxMargin
	}%
}%
\def\InsertBoxL#1#2{%
	\@numnormal = #1
	\setbox\@boxcontent = \hbox{#2}%
	\let\@side = 0
	\futurelet \@optionalparameter \@InsertBox
}
\def\InsertBoxR#1#2{%
	\@numnormal = #1
	\setbox\@boxcontent = \hbox{#2}%
	\let\@side = 1
	\futurelet \@optionalparameter \@InsertBox
}%
\def\@InsertBox{%
	\ifx \@optionalparameter [
	\let\@whatnext = \@@InsertBoxCorrection
	\else
	\let\@whatnext = \@@InsertBoxNoCorrection
	\fi
	\@whatnext
}%
\def\@@InsertBoxCorrection[#1]{%
	\ifx \@side 0
	\@@InsertBox{#1}{0}{{\the\@framewidth} 0cm}%
	\else
	\@@InsertBox{#1}{1}{0cm {\the\@framewidth}}%
	\fi
}%
\def\@@InsertBoxNoCorrection{%
	\@@InsertBoxCorrection[0]%
}%
\def\@@InsertBox#1#2#3{%
	\MoveBelowBox
	\@byframetrue
	% \@wherebottom = \pagetotal + (\@numnormal * \baselineskip) +
	%                 (height of \@boxcontent) + (2 * \@InsertBoxMargin)
	\@wherebottom = \baselineskip
	\multiply \@wherebottom by \@numnormal
	\advance \@wherebottom by 2\@InsertBoxMargin
	\advance \@wherebottom by \ht\@boxcontent
	\advance \@wherebottom by \pagetotal
	% I have no idea why, but \InsertBox called at the top of a page
	% calculates space for the box one line too big
	\ifdim \pagetotal = 0cm
	\advance \@wherebottom by -\baselineskip  % ^ reduction
	\fi
	% add the correction
	\advance \@wherebottom by #1\baselineskip
	% \@framewidth = (width of \@boxcontent} + \@InsertboxMargin
	\@framewidth = \wd\@boxcontent
	\advance \@framewidth by \@InsertBoxMargin
	%
	\bgroup  % to keep changes of \dimen0 local
	% check if the box fits in the page
	\ifdim \pagetotal = 0cm
	\dimen0 = \vsize
	\else
	\dimen0 = \pagegoal
	\fi
	\ifdim \@wherebottom > \dimen0
	% print a warning message ...
	\immediate\write16{+--------------------------------------------------------------+}%
	\immediate\write16{| The box will not fit in the page. Please, re-edit your text. |}%
	\immediate\write16{+--------------------------------------------------------------+}%
	% ... and mark this place in document with a black box
	\vrule width \overfullrule
	\fi
	\egroup
	\prevgraf = 0
	% insert the box in the left (if #2 = 0) or in the right (if #2 = 1)
	\vbox to 0cm{%
		\dimen0 = \baselineskip
		\multiply \dimen0 by \@numnormal
		\advance \dimen0 by -\baselineskip
		\setbox0 = \hbox{y}%
		\vskip \dp0
		\vskip \dimen0
		\vskip \@InsertBoxMargin
		\ifnum #2 = 1
		\vtop{\noindent \hbox to \hsize{\hss \box\@boxcontent}}%
		\else
		\vtop{\noindent \box\@boxcontent}%
		\fi
		\vss
	}%
	% I have no idea why, but this is really necessary
	\vglue -\parskip
	\vskip -\baselineskip
	% each following paragraph needs to be formatted properly
	\everypar = {%
		% are we already below the bottom of the box?
		\ifdim \pagetotal < \@wherebottom
		% no...
		\bgroup  % to keep some changes local
		% let's calculate parameters for \ParShape
		\dimen0 = \@wherebottom
		\advance \dimen0 by -\pagetotal
		\divide \dimen0 by \baselineskip
		\count1 = \dimen0
		\advance \count1 by 1
		\advance \count1 by -\@numnormal
		\ifnum #2 = 1
		\ParShape = 3
		{\the\@numnormal}   0cm   0cm
		{\the\count1}       0cm   {\the\@framewidth}
		1                   0cm   0cm
		\else
		\ParShape = 3
		{\the\@numnormal}   0cm                  0cm
		{\the\count1}       {\the\@framewidth}   0cm
		1                   0cm                  0cm
		\fi
		\egroup
		\else
		% yes!
		\@restore@    % it's time to end everything
		\fi
	}%
	% this definition isn't very necessary --- just in case the paragraph
	% following \InsertBoxL or \InsertBoxR has fewer lines that the
	% first argument of the macro
	\def\par{%
		\endgraf
		\global\advance \@numnormal by -\prevgraf
		\ifnum \@numnormal < 0
		\global\@numnormal = 0
		\fi
		\prevgraf = 0
	}%
}%
%
%  call this macro to move the current position just below the
%  current frame
%
\def\MoveBelowBox{%
	\par
	\if@byframe
	\global\advance \@wherebottom by -\pagetotal
	\ifdim \@wherebottom > 0cm
	\vskip \@wherebottom
	\fi
	\@restore@
	\fi
}%
%
%  normal settings are as follows:
%
\def\@restore@{%
	\global\@wherebottom = 0cm
	\global\@byframefalse
	\global\everypar = {}%
	\global\let \par = \endgraf
	\global\parshape = 1 0cm \hsize
}%
%
%  someone told me that in LaTeX there is no \pageno counter;
%  the counterpart is \c@page
%
\ifx \documentclass \@Dont@Know@What@It@Is@
\else
\let \pageno = \c@page
\fi

%=========================
\newcommand{\thindent}{%
	\setbox0\hbox{\rmfamily\bfseries\theproblem}% for getting the label width
	%\hspace*{\parindent}% undo parskip
	\hspace*{\wd0}%        width of label
	\hspace*{\labelsep}%
}

%\addpic{<num top lines>}[<correct indent>]{<width of image>}{<body>}

\DeclareDocumentCommand\addpic{m m m O{}}{%
		\leavevmode\vspace{-\baselineskip}%
		\InsertBoxR{#1}{%
		\begin{minipage}{#2}
			#3%
		\end{minipage}
}[#4]%
\thindent%
}

%=========================
%\correct[<correct indent>]{<width of image>}[<lines below>]

\DeclareDocumentCommand\correct{m O{}}{%
		\leavevmode\vspace{-\baselineskip}%
		\InsertBoxR{0}{\makebox[#1]{}}[#2]%
		\thindent%
		\hspace*{-1ex}
}
\endinput