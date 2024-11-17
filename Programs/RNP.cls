\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{rnp}[2017/11/17]
\LoadClass[version=last,fontsize=16pt]{scrartcl}
\ProcessOptions\relax


%========================================================================================================
%
%										Геометрія сторінки
%
%========================================================================================================
\RequirePackage[%
	a4paper,%
	footskip=1cm,%
	headsep=0.3cm,% 
	top=1.5cm, %поле сверху
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
	\usepackage{fontspec}
	\setsansfont{Times New Roman}%{Arial}
	\setmainfont{Times New Roman}
	\setmonofont{CMU Typewriter Text}%{Consolas}
	\defaultfontfeatures{Ligatures={TeX}}
	\newfontfamily\sectionfont{Times New Roman}
	\newfontfamily\subsectionfont{Times New Roman}
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
\RequirePackage[english]{babel}
	

	%-------------Подавление висячих строк--------------------------------
	\clubpenalty =10000
	\widowpenalty=10000
	%-------------Інтервали-----------------------------------------------
	\setlength{\parskip}{0.5ex}%
	\setlength{\parindent}{2.5em}%
	\renewcommand{\baselinestretch}{1.1}
	%---------------------------------------------------------------------
%========================================================================================================
%
%										Пакети
%
%========================================================================================================
\RequirePackage{microtype}
\RequirePackage{tikz}
\usetikzlibrary{tikzmark, calc}
\RequirePackage{indentfirst}
\RequirePackage{mhchem}
\RequirePackage{titlesec}
\titlelabel{\thetitle.\quad}
%========================================================================================================
%
%										Таблиці
%
%========================================================================================================
\RequirePackage{multirow}
\RequirePackage{array}
\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
\RequirePackage{rotating}
\RequirePackage{makecell}
\RequirePackage{longtable}
\RequirePackage{colortbl}
\RequirePackage{spreadtab}
\newcounter{magicrownumbers}
\newcommand\rownumber{\stepcounter{magicrownumbers}\arabic{magicrownumbers}}
%========================================================================================================
%
%										Бібліографія
%
%========================================================================================================

\RequirePackage[%
backend=biber, 
style=draft,
babel=other, 
isbn=false, 
url=false,
doi=false]{biblatex}
\newbibmacro{string+doiurlisbn}[1]{%
  \iffieldundef{doi}{%
    \iffieldundef{url}{%
      \iffieldundef{isbn}{%
        \iffieldundef{issn}{%
          #1%
        }{%
          \href{http://books.google.com/books?vid=ISSN\thefield{issn}}{#1}%
        }%
      }{%
        \href{http://books.google.com/books?vid=ISBN\thefield{isbn}}{#1}%
      }%
    }{%
      \href{\thefield{url}}{#1}%
    }%
  }{%
    \href{http://dx.doi.org/\thefield{doi}}{#1}%
  }%
}
\AtEveryBibitem{%
  \clearlist{language}%
}
\DeclareFieldFormat{title}{\usebibmacro{string+doiurlisbn}{#1}} 
\AtEveryBibitem{\clearlist{language}}
\DeclareBibliographyCategory{Main}
\DeclareBibliographyCategory{Additional}
\DeclareFieldFormat{labelnumberwidth}{#1\adddot}
\setlength{\biblabelsep}{5pt}

%%============ Bibliography spacing ========================%%
\setlength{\bibitemsep}{.1\baselineskip plus .05\baselineskip minus .05\baselineskip}
\newlength{\bibparskip}\setlength{\bibparskip}{0pt}
\let\oldthebibliography\thebibliography
\renewcommand\thebibliography[1]{%
  \oldthebibliography{#1}%
  \setlength{\parskip}{\bibitemsep}%
  \setlength{\itemsep}{\bibparskip}%
}

%========================================================================================================
%
%										hyperref
%
%=======================================================================================================

\RequirePackage[colorlinks=false,
		citecolor = green!40!black,
		bookmarks = true,
		bookmarksnumbered=true,
		unicode,
		linktocpage = true,
		hypertexnames=false,
		pdftoolbar=false,
		pdfpagelayout=TwoPageRight,
		pdfauthor={Ponomarenko S.M.},
		pdfdisplaydoctitle=true,
		pdfkeywords={},
		pdfencoding=auto
]%
{hyperref}

%========================================================================================================
%
%										Переліки та списки
%
%========================================================================================================

\RequirePackage{enumitem}
\setlist[enumerate]{topsep=0pt,itemindent=2em,itemsep=0ex,partopsep=1ex,parsep=1ex}
\newlist{Rozdil}{enumerate}{2}    

\setlist[Rozdil,1]{itemsep=0ex, itemindent=3em, label={Chapter \arabic*.}, ref={\arabic*}} 
\setlist[Rozdil,2]{
labelsep=8pt,%                           
labelindent=0.5\parindent,%               
itemindent=0pt,%
leftmargin=*,%                          
listparindent=-\leftmargin,
label={\arabic{Rozdili}.\arabic*},ref={\arabic{Rozdili}.\arabic*}}

\RequirePackage{readarray}
\newread\readquastions
\newcommand{\loaditemsfromfile}[2][enumerate]{%
\IfFileExists{#2}{%
  \openin\readquastions=#2
  \begin{#1}  % Use an itemize enviroment with #1 as name of the env. 
    \loop\unless\ifeof\readquastions%
    \read\readquastions to \localvariable
    \ifeof\readquastions
    \else
  \item \localvariable
    \fi
    \repeat
  \end{#1} % close the environment
  \closein\readquastions%  \close the file
}{}%
}

\newcommand\Repeat[2]{
 \newcounter{i}
  \loop \ifnum\value{i} < #1
    #2%
    \stepcounter{i}%
  \repeat
}

%========================================================================================================
%
%										Команди для титульних сторінок
%
%========================================================================================================

\newcounter{tmark}\setcounter{tmark}{0}
\newcommand{\mfield}[5]{%
	\stepcounter{tmark}
	% #1 = total width
	% #2 = text on the left
	% #3 = text on the right
	% #4 = text above the rule
	% #5 = text below the rule
	#2\rule[-0.2\baselineskip]{#1}{0.5pt}\tikzmark{\thetmark}#3%
	\begin{tikzpicture}[overlay,remember picture]
	    \node at ([xshift=-(#1/2),yshift=.15\baselineskip]pic cs:\thetmark) {#4};
 	    \node at ([xshift=-(#1/2),yshift=-.6\baselineskip]pic cs:\thetmark) {\scriptsize #5};
	\end{tikzpicture}%
}



\newcommand{\field}[4]{%
	% #1 = total width
	% #2 = text on the left
	% #3 = text above the rule
	% #4 = text below the rule
	%\par\noindent
	\parbox{#1}{
	\makebox[#1][s]{#2\ \lowrule{\fill}\makebox[0pt]{#3}\lowrule{\fill}}\\*
	\makebox[#1][s]{\hphantom{#2}\ \hfill\makebox[0pt]{\scriptsize#4}\hfill}%
}
}

\newcommand{\datefield}[3]{%
	% #1 = total width
	% #3 = text on the right
	% #2 = text above the rule
	%\par\noindent
	\parbox{#1}{
	\makebox[#1][s]{\lowrule{\fill}\makebox[0pt]{#2}\lowrule{\fill} #3}\\*
}
}

\newcommand{\inlinefield}[4]{%
	% #1 = total width
	% #2 = text on the left
	% #3 = text above the rule
	% #4 = text below the rule
	%\par\noindent
	\parbox{#1}{
		\makebox[#1][s]{#2\ \lowrule{\fill}\makebox[0pt]{#3}\lowrule{\fill}}\\*
		\makebox[#1][s]{\hphantom{#2}\ \hfill\makebox[0pt]{\scriptsize#4}\hfill}%
}
}

\newcommand{\lowrule}[1]{%
	\leaders\hrule height \dimexpr-\dp\strutbox+0.4pt\relax depth \dp\strutbox\hskip#1\relax
}

\def\Ministry{Ministry of Education and Science of Ukraine}
\def\ntuu{National Technical University of Ukraine}
\def\kpi{Igor Sykorsky Kyiv Polytechnic Institute}
\def\ipt{Institute of Physics and Technology}



\endinput