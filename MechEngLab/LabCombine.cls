\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{LabCombine}[2015/05/09]
\LoadClass[twoside,a4paper,12pt]{book}

\DeclareOption{print}{
	\PassOptionsToPackage{linkcolor=black}{hyperref}
	\PassOptionsToPackage{colorlinks=false}{hyperref}
	\PassOptionsToPackage{urlcolor=black}{hyperref}
	\def\defcolor{\RequirePackage{xcolor}\definecolor{malina}{rgb}{0,0,0}}
	\gdef\flag{0}
	}


\DeclareOption{electronic}{\def\defcolor{\RequirePackage{xcolor}\definecolor{malina}{rgb}{0.6,0,0}}
	\PassOptionsToPackage{linkcolor=malina}{hyperref}
	\PassOptionsToPackage{colorlinks=true}{hyperref}
	\PassOptionsToPackage{urlcolor=blue}{hyperref}
	}
	
\DeclareOption{nocompile}{\def\cflag{1}}

\def\cflag{}
\gdef\flag{}
\ProcessOptions\relax

\defcolor
\RequirePackage{cmap}
\RequirePackage{ifluatex}
%----------For PAX-------------
\ifluatex
\RequirePackage{pdftexcmds}
\let\pdfescapename=\pdf@escapename
\let\pdfstrcmp=\pdf@strcmp
\RequirePackage{luacode}
\fi
\RequirePackage{pax}

%-----------------------------           


\RequirePackage[%
	a4paper,%
	footskip=1cm,%
	headsep=0.3cm,% 
	top=2cm, %поле сверху
	bottom=2cm, %поле снизу
	left=2cm, %поле ліворуч
	right=2cm, %поле праворуч
]{geometry}

\ifluatex
\RequirePackage{luacode}
\RequirePackage{polyglossia}
\setmainlanguage{english}
\setotherlanguage{russian}
\setotherlanguage{ukrainian}
\defaultfontfeatures{Mapping=tex-text, Ligatures={TeX}}
\setmainfont{CMU Serif}
\setsansfont{CMU Sans Serif}
\newfontfamily\cyrillicfont{CMU Serif}[Script=Cyrillic]
\newfontfamily\cyrillicfontsf{CMU Sans Serif}[Script=Cyrillic]
\setmonofont{CMU Typewriter Text}
\else
\RequirePackage[T1,T2A]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\renewcommand{\sfdefault}{fos}
\renewcommand{\sfdefault}{fos}
\renewcommand{\bfdefault}{b}
\RequirePackage[overload]{textcase} 
\let\MakeUppercase\MakeTextUppercase 
\fi

%---------------Подавление висячих строк-----
\clubpenalty =10000
\widowpenalty=10000

\RequirePackage{microtype}
\RequirePackage{ragged2e}
\RequirePackage{amsmath}
%\usepackage{authblk}
\RequirePackage{csquotes}
\RequirePackage{indentfirst}
\RequirePackage{pdfpages}
\RequirePackage{pifont}
\RequirePackage[most, many]{tcolorbox}
\RequirePackage{lastpage}
\RequirePackage{setspace}
	
\renewcommand{\cleardoublepage}{\clearpage}

\def\@makeschapterhead#1{%
	\vspace*{50\p@}%
	{\parindent \z@ \centering
		\normalfont
		\interlinepenalty\@M
		\Huge \bfseries  #1\par\nobreak
		\vskip 40\p@
	}}

\renewcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{1em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
	   \hrulefill\nopagebreak\par\medskip   
       \large \bfseries \vbox{\centering\sffamily\bfseries#1}%
       %\hfil \hb@xt@\@pnumwidth{\hss #2}
       }
       \nopagebreak\hrulefill\par
       \vspace*{1ex}
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
  
\def\partmark{}

\def\@part[#1]#2{%
	\renewcommand\partmark{\thepart\quad#1}
	\thispagestyle{empty}
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \Huge\bfseries \centerline\nobreakspace\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge\sffamily\bfseries #2\par}%
     \@endpart
     \setcounter{PaperNumber}{1}}

\def\@spart#1{%
	\renewcommand\partmark{#1}
	\thispagestyle{empty}
	\addcontentsline{toc}{part}{#1}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \sffamily\bfseries #1\par}%
    \@endpart
    \setcounter{PaperNumber}{1}}
    
\def\ps@labeadings{%
	\renewcommand{\@oddhead}%
	{\raisebox{0pt}[\headheight][0pt]{% начало блока
		\vbox{\hbox to\textwidth{\strut
			\small{\hfil\small\itshape\worknomber\hfil}}\hrule}}% конец блока
	}% конец макроопределения
	
	\renewcommand{\@evenhead}%
	{\raisebox{0pt}[\headheight][0pt]{% начало блока
		\vbox{\hbox to\textwidth{\strut
			\small{\hfil{\itshape\small\partmark}\hfil}}\hrule}}% конец блока
	}% конец макроопределения
	
	\renewcommand{\@oddfoot}%
	{\raisebox{0pt}[\headheight][0pt]{% начало блока
		\vbox{\hbox to\textwidth{\strut
			\small{\hfil\small\thepage}\hfil}}}% конец блока
	}% конец макроопределения
	
	\renewcommand{\@evenfoot}%
	{\raisebox{0pt}[\headheight][0pt]{% начало блока
		\vbox{\hbox to\textwidth{\strut
			\small{\hfil{\small\thepage}\hfil}}}}% конец блока
	}% конец макроопределения
}

\def\@endpart{\vfil\newpage
%              \if@twoside
%               \if@openright
%                \null
%                \thispagestyle{empty}%
%                \newpage
%               \fi
%              \fi
              \if@tempswa
                \twocolumn
              \fi}

\addto\captionsukrainian{\renewcommand{\contentsname}{Зміст}}
\renewcommand\tableofcontents{%
	\pagestyle{plain}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\sffamily\bfseries\contentsname
        	\@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }		
%----Precis-----
\newcommand{\chapterprecis}[1]{%
  \chapterprecishere{#1}
  \chapterprecistoc{#1}}
\newcommand{\chapterprecishere}[1]{%
  \vspace*{-2\baselineskip}
  \begin{quote}\textit{#1}\end{quote}}
\newcommand{\chapterprecistoc}[1]{\nopagebreak\addtocontents{toc}{%
	\protect\nopagebreak
   {\leftskip 0em\relax
   \advance\leftskip 1.5em\relax
   \rightskip \@tocrmarg\relax
   \textit{#1}\protect\par}}}
%---------------

\renewcommand*{\l@chapter}{%
  %\addvspace{\baselineskip}%
  \@dottedtocline{0}{0pt}{1.5em}% use chapter entries with dots
}%----Додавання точок "..." в зміст біля назви статті

%------------Команда вставки PDF---------------------
\newcommand\worktitle{}% initialize
\newcommand\worknomber{}% initialize
\newcommand{\thisworktitle}[1]{\renewcommand\worktitle{#1}}
\newcommand{\thisworknomber}[1]{\renewcommand\worknomber{#1}}

\newcommand{\insertwork}[1]%
{% #1 is the file name (without extension)
	\clearpage
	\renewcommand\worktitle{}% reinitialize
	\IfFileExists{#1.dat}{%
		\input{#1.dat}%
		\phantomsection
		\addcontentsline{toc}{chapter}{\textbf{Work~\worknomber.} \worktitle} 
		\includepdf[pages=-, link, pagecommand={\pagestyle{plain}}]{#1.pdf}%
	}{\typeout{--- File #1 not found ---}}% 
}

\newcommand{\insertadditional}[1]%
{% #1 is the file name (without extension)
	\clearpage
	\renewcommand\worktitle{}% reinitialize
	\IfFileExists{#1.dat}{%
		\input{#1.dat}%
		\phantomsection
		\addcontentsline{toc}{chapter}{\worktitle} 
		\includepdf[pages=-, link, pagecommand={\pagestyle{plain}}]{#1.pdf}%
	}{\typeout{--- File #1 not found ---}}% 
}
	
\def\InsertWorkHere#1{%
	\edef\fold{#1}
		\newwrite\flags
		\ifx\flag\@empty{%
		\immediate\openout\flags=\fold/flags.tex
		\immediate\write\flags{\string\PassOptionsToClass{electronic}{LabWork}}
		}%
		\else
		{
		\immediate\openout\flags=\fold/flags.tex
		\immediate\write\flags{\string\PassOptionsToClass{print}{LabWork}}
		}
		\fi
		\immediate\write\flags{\string\PassOptionsToClass{combined}{LabWork}}%
		\immediate\closeout\flags
		\def\compile
		{
		\immediate\write18{pdflatex.exe -interaction=nonstopmode -output-directory="\fold"  \fold}
		\ifluatex
		\luadirect{
		os.execute("e:/Projects/LaTeX/MyPackage/bin/pax.bat '\luatexluaescapestring{\fold/\fold.pdf}' ")
				  }
		\fi
		\insertwork{\fold/\fold}
		}
		\ifx\cflag\@empty
		\compile
		\else
		\IfFileExists{\fold/\fold.pdf}{\insertwork{\fold/\fold}}{\compile}
		\fi
		%\immediate\write18{e:/Projects/LaTeX/MyPackage/bin/pax.bat "\fold/\fold.pdf"}
		
		\immediate\write18{del /Q "\fold\/flags.tex"}
		}




%------------------------------------------------------------------------------------------
\RequirePackage[%colorlinks=true,
	%urlcolor = blue, %Colour for external hyperlinks
	%linkcolor  = malina, %Colour of internal links
	citecolor  = green, %Colour of citations
	bookmarks = true,
	bookmarksnumbered=true,
	unicode,
	linktoc = all,
	hypertexnames=false,
	pdftoolbar=false,
	pdfpagelayout=TwoPageRight,
	pdfauthor={Ponomarenko S.M. aka sergiokapone}]{hyperref}

\input{glyphtounicode}
\pdfgentounicode=1
\endinput
