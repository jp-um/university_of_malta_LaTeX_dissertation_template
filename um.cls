%% ****************************************************
%% **                                                **
%% **              University of Malta               **
%% **                                                **
%% **    LaTeX Template for Thesis/Dissertation/FYP  **
%% **                                                **
%% **              Dr Jean-Paul Ebejer               **
%% **            jean.p.ebejer@um.edu.mt             **
%% **                                                **
%% **     "Build something which will outlast you"   **
%% **          (... amongst other things)            **
%% **                                                **
%% ****************************************************

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{um}[2018/05/01-2018/12/14 v1.1.6 University of Malta, Dissertation/FYP/Thesis Template]


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\LoadClass[11pt,a4paper,final]{memoir}



%% **************** Packages (Start) *********************

\RequirePackage[utf8]{inputenc}      % Required for inputting international characters
\RequirePackage[T1]{fontenc}         % Output font encoding for international characters
\RequirePackage{mathpazo}            % Use the Palatino font by default
\RequirePackage[english]{babel}      % Load babel if you're unsure about the default language - mostly to be safe
\RequirePackage{xcolor}              % For named colors
\RequirePackage{eso-pic}                 % required to place huge uni logo at the back - on title page
\RequirePackage[pdftex]{graphicx}    % For pictures
\RequirePackage{amssymb}             % at least, for black squares in bullet list
\RequirePackage[pdfusetitle]{hyperref}            % for hyperreferences
\RequirePackage[authoryear,semicolon,square,sort]{natbib}     % for [Ebejer, 2012; Alba, 2013] kind of references

\usepackage[defaultsans]{lato}
\usepackage[printonlyused,withpage]{acronym}



%% ****************** Packages (End) *********************



%% ************ Document Options (Start) *****************

\OnehalfSpacing                                  % One and a half line spacing

\setlength{\headsep}{1.5cm}                      % Add space between the header and text

\nouppercaseheads								 % Don't convert titles to Uppercase
\makepagestyle{umpage}

												 % This travesty is due to a bug in memoir, see https://tex.stackexchange.com/questions/468922/oneside-in-memoir-causing-header-trouble
\makeevenhead{umpage}{\sffamily\small\leftmark}{}{\sffamily\small\rightmark}
\makeoddhead{umpage}{\sffamily\small\leftmark}{}{\sffamily\small\rightmark}
\makeevenfoot{umpage}{}{\thepage}{}  			 % UM pagestyle, put page at bottom
\makeoddfoot{umpage}{}{\thepage}{}
\makeheadrule{umpage}{\textwidth}{0.2pt}
\makepsmarks{umpage}{%
	\createmark{chapter}{left}{shownumber}{\@chapapp\ }{. \ }
	\createmark{section}{right}{shownumber}{}{. \ }
}

\setlrmarginsandblock{3.7cm}{2.5cm}{*}           % Set the page margins (for one and two sided docs) 
\checkandfixthelayout                            % Put layout into effect

\graphicspath{{./images/}}                       % Where to look for images (paths) ...
\DeclareGraphicsExtensions{.pdf,.jpeg,.png,.jpg} % Graphics extensions to load

\chapterstyle{ell} % how to draw the different chapters

\renewcommand*{\chapnumfont}{\normalfont\HUGE\bfseries}  % Chapter titles should be normal
\renewcommand*{\chaptitlefont}{\normalfont\HUGE\bfseries}

\newsubfloat{figure} % declares a new subfloat element which allows to use \subbottom commands

\renewcommand{\labelitemi}{\scriptsize$\blacksquare$}

\addto{\captionsenglish}{\renewcommand{\bibname}{References}} % because we are using babel we need this
                                                              % instead of just redefining bibname
\setlength{\bibitemsep}{\onelineskip}

\newcommand{\ra}[1]{\renewcommand{\arraystretch}{#1}} % to set array stretch within tables

\hypersetup{%
    colorlinks=false,
%    linkcolor=UMRed,
%    citecolor=UMRed,
%    urlcolor=UMRed,
%    filecolor=magenta, 
    pdfborder={0 0 0},    
}

\feetbelowfloat % we want the footnotes below floats, not wierdly above

\setsecnumdepth{subsubsection}  % three level depth - chapter, section, subsection, subsubsection
\settocdepth{subsection}

\renewcommand*{\cftappendixname}{Appendix\space}


%% ************* Document Options (End) ******************



%% ************ UM Definitions (Start) *****************

\definecolor{OxfordBlue}{rgb}{0,0.106,0.329}   % Color
\definecolor{UMRed}{rgb}{0.73,0.09,0.19}   % UM Logo Color

% Setup choosen University of Malta crest/logo
\def\logo{{\includegraphics[width=32mm]{umlogo_red}}}

% The year and term the thesis is submitted 
\def\degreedate#1{\gdef\@degreedate{#1}}
% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}
% The name of your supervisor
\def\supervisor#1{\gdef\@supervisor{#1}}
% The name of your co-supervisor
\def\cosupervisor#1{\gdef\@cosupervisor{#1}}
% The name of your department (e.g. Computer Science, Statistics, Biochemistry, AI)
\def\department#1{\gdef\@department{#1}}
% The name of your faculty
\def\faculty#1{\gdef\@faculty{#1}}
% The name of your faculty
\def\subjectcode#1{\gdef\@subjectcode{#1}}
% The tagline
\def\tagline#1{\gdef\@tagline{#1}}
% The document type, e.g. a dissertation or a thesis
\def\doctype#1{\gdef\@doctype{#1}}

%% ************* UM Definitions (End) ******************



%% *************** Environments (Start) ******************

%% *** Title Page (Start) ***
% background image
% taken from http://tug.org/pracjourn/2008-1/mori/mori.pdf
\newcommand\AlCentroPagina[1]{%
\AddToShipoutPicture*{\AtPageCenter{%
\makebox(0,0){\includegraphics[width=0.7\paperwidth]{#1}}}}}

% The front page
\renewcommand{\maketitle}
{\begingroup
\AlCentroPagina{umlogo_gray}
\parbox[b][0.95\textheight][t]{0.2\textwidth}{\raggedleft\logo}
\hspace*{2ex}
\textcolor{UMRed}{\rule{2pt}{0.95\textheight}}
\hspace*{2ex}
\parbox[b][0.95\textheight][t]{0.7\textwidth}{
    \setlength{\parindent}{0pt}
    \fontfamily{pag}\selectfont
    {\Huge\bfseries{\begin{Spacing}{1.1}\fontfamily{ppl}\selectfont\textcolor{UMRed}{\@title}\end{Spacing}}
    }
    \vspace*{2ex}
    {\large\textit{\@tagline}}\\[1in]
    
    {\LARGE\bfseries \textsc{\@author}} \\[1cm]
    {\large Supervised by \@supervisor} 
    \@ifundefined{@cosupervisor}{}{\\[1ex]\large Co-supervised by \@cosupervisor}\\[1cm]
    {\large \@department} \\[1ex]
    {\large \@faculty} \\[1ex]
    {\large University of Malta} \\
    
    \vfill
    {\bfseries \@degreedate}\\[\baselineskip]
    {\small \textit{A \@doctype\ submitted in partial fulfilment of the requirements for the degree of \@degree}.}
}
\thispagestyle{empty}
\if@openright\cleardoublepage\else\clearpage\fi
\endgroup}
%% *** Title Page (End) ***

\newenvironment{acknowledgements}
{\renewcommand{\abstractname}{Acknowledgements}\abstract}
{\endabstract\if@openright\cleardoublepage\else\clearpage\fi}
       
\newenvironment{dedication}
  {\clearpage           % we want a new page
   \thispagestyle{empty}% no header and footer
   \vspace*{\stretch{1}}% some space at the top 
   \itshape             % the text is in italics
   \raggedleft          % flush to the right margin
   \textcolor{UMRed}
  }
  {\par % end the paragraph
   \vspace{\stretch{3}} % space at bottom is three times that at the top
   \if@openright\cleardoublepage\else\clearpage\fi
  }       
       

%%\renewenvironment{abstract}
%%{\begin{alwayssingle} \thispagestyle{empty}
%%\begin{center}
%%\vspace*{0.5cm}
%%{\large \bfseries \textcolor{UMRed}{Abstract}}
%%\end{center}
%%\singlespacing\enlargethispage{\baselineskip}}
%%{\end{alwayssingle}}

%%{\cleardoublepage\newgeometry{right=1.3cm,top=2.4cm,bottom=2cm}\pagestyle{empty}\begin{center}\bfseries\large\textcolor{OxfordBlue}\abstractname\end{center}\normalsize\onehalfspacing\begin{quotation}}{\end{quotation}\restoregeometry\cleardoublepage}


% STATEMENT OF ORIGINALITY
%
% The originality environment puts a large, bold, centered 
% "Statement of originality" label at the top of the page. The statement 
% of originality itself appears in a quote environment, i.e. tabbed in at 
% both sides, and on its own page.

\newenvironment{originality}
{\clearpage
\begin{center}
\vspace*{1.5cm}
{\large \bfseries \textcolor{UMRed}{Statement of Originality} \par}
\vspace*{1.5cm}
{I, the undersigned, declare that this is my own work unless where otherwise acknowledged and referenced. \par}
\vspace*{1.5cm}
\renewcommand\arraystretch{1.5}
\begin{tabular}{ll}
      {\bfseries Candidate} & \@author \\[15mm]
      {\bfseries Signed} & \makebox[1.5in]{\hrulefill} \\
      {\bfseries Date} & \today \\
\end{tabular}
\end{center}
\if@openright\cleardoublepage\else\clearpage\fi}



%% **************** Environments (End) *******************