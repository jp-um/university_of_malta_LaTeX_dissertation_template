%% ****************************************************
%% **                                                **
%% **              University of Malta               **
%% **                                                **
%% **    LaTeX Template for Thesis/Dissertation/FYP  **
%% **                                                **
%% **            Prof. Jean-Paul Ebejer              **
%% **            jean.p.ebejer@um.edu.mt             **
%% **                                                **
%% **     "Build something which will outlast you"   **
%% **          (... amongst other things)            **
%% **                                                **
%% ****************************************************

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{um}[2026/10/26 v4.0.0 University of Malta Dissertation/FYP/Thesis Template]

% This class requires LuaLaTeX
\RequirePackage{iftex}
\ifLuaTeX\else
  \ClassError{um}{This class requires LuaLaTeX}%
    {Run lualatex instead of pdflatex or xelatex.}
\fi


% ==================================================================
% Class options
% ==================================================================

% By default the title page follows the University's official
% dissertation cover layout (centred, Lato, full UM logo).
% Option `oldcover' restores the original template cover
% (red bar and crest).
\newif\if@umoldcover
\DeclareOption{oldcover}{\@umoldcovertrue}

% Any other option (e.g. oneside, twoside) is passed on to memoir
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax

\LoadClass[11pt,a4paper,final]{memoir}


% ==================================================================
% Packages
% ==================================================================

% ----- Fonts (LuaLaTeX) -----
\RequirePackage{fontspec}
\defaultfontfeatures{Ligatures=TeX}

% The main font is used at its true size (11pt); the sans and monospace
% fonts are scaled to match the x-height of the main font.
\setmainfont{TeX Gyre Pagella}                     % Palatino-like main font
\setsansfont{Lato}[Scale=MatchLowercase]           % sans serif (shipped with TeX Live)
\setmonofont{Inconsolata}[Scale=MatchLowercase]    % monospace

% Unscaled Lato for the official cover page (point sizes as per the UM cover),
% and a variant for the title, tagline and degree statement whose letter
% spacing can be adjusted (LetterSpace=0 is the font's default spacing).
\newfontfamily\umcoverfont{Lato}[Scale=1.0]
\newfontfamily\umcoverfontspaced{Lato}[Scale=1.0, LetterSpace=0]

% ----- Languages and dates -----
\RequirePackage[british]{babel}            % British English hyphenation and captions
\RequirePackage[useregional]{datetime2}
\DTMlangsetup[en-GB]{ord=omit}             % dates as 26 October 2026

% Babel loads Maltese on the fly for otherlanguage{maltese}, which biblatex
% only learns about at the end of each run, so it asks for a rerun on every
% build. Listing Maltese among babel's languages up front avoids this (after
% datetime2, which has no Maltese module and would otherwise warn).
\edef\bbl@loaded{\bbl@loaded,maltese}

% ----- Graphics, colour, hyperlinks -----
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{eso-pic}

\RequirePackage{hyperref}
\hypersetup{%
  colorlinks=false, % links are neither coloured ...
  pdfborder={0 0 0} % ... nor boxed
  % To colour links instead, use e.g.:
  % colorlinks=true, linkcolor=DissertationColor,
  % citecolor=DissertationColor, urlcolor=DissertationColor
}

% PDF metadata (title and author) from the data in the main document;
% line breaks in the title become spaces
\AtBeginDocument{%
  \pdfstringdefDisableCommands{\def\\{ }}%
  \hypersetup{pdftitle={\@title}, pdfauthor={\@author}}}

% ----- Bibliography: APA style with the biber backend -----
\RequirePackage{csquotes} % recommended by biblatex with babel
\RequirePackage[style=apa,backend=biber]{biblatex}
% biblatex has no Maltese localisation; without this mapping any Maltese text
% (e.g. otherlanguage{maltese}) makes biblatex ask for a rerun on every build
\DeclareLanguageMapping{maltese}{british-apa}

% ----- Maths, floats, tables, code, algorithms, acronyms -----
\RequirePackage{amsmath,amssymb}
\RequirePackage{amsthm}
\RequirePackage{floatpag}
\RequirePackage{longtable}
% Running heads on pages made by a long table: from LaTeX 2025-06-01 the
% running heads use LaTeX's new mark mechanism, which longtable before v4.24
% does not update, so the running head on those pages can name an earlier
% section (https://github.com/latex3/latex2e/issues/1814). The fix (v4.24)
% needs finite glue after the table foot (v4.25, issue 1907), otherwise
% newer expl3 stops with "Infinite glue shrinkage found in box being split".
% With LaTeX 2025-06-01 or later, apply whichever part of these two upstream
% fixes the loaded longtable lacks.
\IfFormatAtLeastTF{2025-06-01}{%
  \RequirePackage{etoolbox}%
  \@ifpackagelater{longtable}{2025/12/23}{}{% v4.25: finite glue after the foot
    \patchcmd{\LT@output}{\copy\LT@foot\vss}%
      {\copy\LT@foot\vskip\z@\@plus1fil\@minus\normalbaselineskip}{}%
      {\ClassWarningNoLine{um}{Could not patch longtable (foot glue)}}%
    \patchcmd{\LT@output}{\copy\LT@foot\vss}%
      {\copy\LT@foot\vskip\z@\@plus1fil\@minus\normalbaselineskip}{}%
      {\ClassWarningNoLine{um}{Could not patch longtable (foot glue)}}%
  }%
  \@ifpackagelater{longtable}{2025/10/13}{}{% v4.24: update the page marks
    \patchcmd{\LT@output}{\@makecol\@outputpage}%
      {\@makecol\@expl@@@mark@update@singlecol@structures@@\@outputpage}{}%
      {\ClassWarningNoLine{um}{Could not patch longtable (running heads)}}%
    \patchcmd{\LT@output}{\@makecol\@outputpage}%
      {\@makecol\@expl@@@mark@update@singlecol@structures@@\@outputpage}{}%
      {\ClassWarningNoLine{um}{Could not patch longtable (running heads)}}%
  }%
}{}
\RequirePackage{pdflscape}
\RequirePackage{listings}
\RequirePackage[ruled]{algorithm2e}
\RequirePackage[printonlyused,withpage]{acronym}


% ==================================================================
% UM definitions (colours and the data used on the cover page)
% ==================================================================

\definecolor{OxfordBlue}{rgb}{0,0.106,0.329}
\definecolor{UMRed}{rgb}{0.73,0.09,0.19}        % UM logo colour
\definecolor{UMCoverText}{HTML}{231F20}         % text colour on the official UM cover
\colorlet{DissertationColor}{UMRed}             % accent colour used throughout

% University of Malta crest (used on the `oldcover' title page)
\def\logo{{\includegraphics[width=30mm]{umlogo_crest_red}}}

% Commands for the data set in the preamble of the main document
\def\degreeName#1{\gdef\@degreeName{#1}}         % full (unabbreviated) name of the degree
\def\supervisor#1{\gdef\@supervisor{#1}}         % supervisor(s)
\def\cosupervisor#1{\gdef\@cosupervisor{#1}}     % co-supervisor(s), optional
\def\department#1{\gdef\@department{#1}}         % e.g. Computer Science, Statistics
\def\faculty#1{\gdef\@faculty{#1}}               % e.g. Faculty of ICT
\def\subjectcode#1{\gdef\@subjectcode{#1}}       % study-unit code (currently not used)
\def\tagline#1{\gdef\@tagline{#1}}               % subtitle, optional
\def\doctype#1{\gdef\@doctype{#1}}               % e.g. dissertation, thesis
\def\authorID#1{\gdef\@authorID{#1}}             % University identifier
\def\submissionDate#1{\gdef\@submissionDate{#1}} % month and year of submission


% ==================================================================
% Document layout and styles
% ==================================================================

% ----- Captions (memoir's own controls, not the caption package) -----
\captionnamefont{\small\bfseries}
\captiontitlefont{\small}
\captiondelim{: }
\setlength{\abovecaptionskip}{6pt}
\setlength{\belowcaptionskip}{6pt}
% Captions are 95% of the text width (set after the page layout, see below).
% LaTeX default: centred if the caption fits on one line, justified otherwise
\captionstyle[\centering]{}

% ----- Code listings -----
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

\lstdefinestyle{mystyle}{
  backgroundcolor=\color{backcolour},
  commentstyle=\color{codegreen},
  keywordstyle=\color{magenta},
  numberstyle=\tiny\color{codegray},
  stringstyle=\color{codepurple},
  basicstyle=\ttfamily\footnotesize,
  breakatwhitespace=false,
  breaklines=true,
  captionpos=b,
  keepspaces=true,
  numbers=left,
  numbersep=5pt,
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  tabsize=2,
  basewidth=0.5em  % character width of the monospace font (Inconsolata)
}
\lstset{style=mystyle}

% ----- Spacing -----
\OnehalfSpacing                         % one-and-a-half line spacing
\setlength{\headsep}{1.5cm}             % space between the header and the text

% ----- Page styles -----
\nouppercaseheads                       % do not convert running heads to upper case

% UM page style: chapter and section in the header, page number at the bottom.
% twoside: mirrored, chapter on the outside of left-hand pages and section on
%   the outside of right-hand pages.
% oneside: chapter on the left and section on the right of every page (even
%   and odd headers are identical because of a memoir bug with `oneside', see
%   https://tex.stackexchange.com/questions/468922/oneside-in-memoir-causing-header-trouble).
\makepagestyle{umpage}
\if@twoside
  \makeevenhead{umpage}{\color{gray}\sffamily\small\leftmark}{}{}
  \makeoddhead{umpage}{}{}{\color{gray}\sffamily\small\rightmark}
\else
  \makeevenhead{umpage}%
    {\color{gray}\sffamily\small\leftmark}{}{\color{gray}\sffamily\small\rightmark}
  \makeoddhead{umpage}%
    {\color{gray}\sffamily\small\leftmark}{}{\color{gray}\sffamily\small\rightmark}
\fi
\makeevenfoot{umpage}{}{\thepage}{}
\makeoddfoot{umpage}{}{\thepage}{}
\makeheadfootruleprefix{umpage}{\color{gray}}{}
\makeheadrule{umpage}{\textwidth}{\normalrulethickness}
\makepsmarks{umpage}{%
  \createmark{chapter}{left}{shownumber}{\@chapapp\ }{. \ }
  \createmark{section}{right}{shownumber}{}{. \ }
}

% Back matter page style: chapter on even pages, section on odd pages
\copypagestyle{umpageback}{umpage}
\makeevenhead{umpageback}{\color{gray}\sffamily\small\leftmark}{}{}
\makeoddhead{umpageback}{}{}{\color{gray}\sffamily\small\rightmark}

% ----- Page layout -----
\setlrmarginsandblock{3.7cm}{2.5cm}{*}  % page margins (one- and two-sided)
\checkandfixthelayout                   % put the layout into effect

% Caption width, now that \textwidth is final
\captionwidth{0.95\textwidth}
\changecaptionwidth
\setlength{\LTcapwidth}{\textwidth}  % longtable captions get the same width

% ----- Graphics -----
\graphicspath{{./images/}}                       % where to look for images
\DeclareGraphicsExtensions{.pdf,.jpeg,.png,.jpg} % in order of preference

% ----- Headings -----
% Other chapter styles: bianchi, bringhurst, brotherton, chappell, crosshead,
% culver, dash, demo2, demo3, dowding, ell, ger, komalike, lyhne, madsen,
% ntglike, pedersen, southall, tandh, thatcher, veelo, verville, wilsondob
\chapterstyle{ell}

\renewcommand*{\chapnumfont}{\sffamily\HUGE\bfseries\color{DissertationColor}}
\renewcommand*{\chaptitlefont}{\sffamily\HUGE\bfseries\color{DissertationColor}}
\setsecheadstyle{\sffamily\LARGE\bfseries\color{DissertationColor}}
\setsubsecheadstyle{\sffamily\Large\color{DissertationColor}}
\setsubsubsecheadstyle{\sffamily\large\color{DissertationColor}}
\setsecnumformat{\csname the#1\endcsname\enskip{\color{gray}\textbar}\enskip}

% Number down to subsubsection; list down to subsection in the ToC
\setsecnumdepth{subsubsection}
\settocdepth{subsection}

% Room for long front matter page numbers (e.g. xviii) in the ToC and lists
\setpnumwidth{2.2em}
\setrmarg{3.2em}

\renewcommand*{\cftappendixname}{Appendix\space}

% ----- Lists, floats, footnotes, bibliography -----
\renewcommand{\labelitemi}{\color{DissertationColor}\scriptsize$\blacksquare$}

\newsubfloat{figure}            % sub-figures, via \subbottom
\feetbelowfloat                 % footnotes below floats, not above them
\setlength{\bibitemsep}{\onelineskip} % space between references

% ----- Theorems -----
\newtheorem{theorem}{Theorem}[section]
\newtheorem{corollary}{Corollary}[theorem]
\newtheorem{lemma}[theorem]{Lemma}

% ----- Utility commands -----
% Set the array stretch within tables, e.g. \ra{1.3}
\newcommand{\ra}[1]{\renewcommand{\arraystretch}{#1}}

% Replace \\ by a space, e.g. to print a multi-line title on one line
\newcommand{\removelinebreaks}[1]{%
  \begingroup\def\\{ }#1\endgroup}


% ==================================================================
% Title pages
% ==================================================================

% ----- Original template cover (class option `oldcover') -----

% Background image centred on the page, taken from
% http://tug.org/pracjourn/2008-1/mori/mori.pdf
\newcommand{\AlCentroPagina}[1]{%
  \AddToShipoutPicture*{\AtPageCenter{%
      \makebox(0,-50){\includegraphics[width=0.5\paperwidth]{#1}}}}}

% Line ends below are significant (they put spaces between the boxes),
% so do not add or remove % at the end of lines in this macro.
\newcommand{\@umoldtitle}{%
  \begingroup
  % This cover deliberately extends into the right margin; do not report
  % the resulting over/underfull boxes (changes the log only, not the output)
  \hfuzz=50pt\hbadness=10000
  \AlCentroPagina{umlogo_crest_gray}
  % the 0.95 is important, otherwise the page overflows into the next one
  % the crest is slightly wider than its column and overhangs it on the right
  \parbox[b][0.95\textheight][t]{0.2\textwidth}{\makebox[\linewidth][l]{\logo}}
  \hspace*{2ex}
  \textcolor{DissertationColor}{\rule{2pt}{0.95\textheight}}
  \hspace*{2ex}
  \parbox[b][0.95\textheight][t]{0.8\textwidth}{
    \setlength{\parindent}{0pt}
    \sffamily
    {\Huge\bfseries{\begin{Spacing}{1.15}\textcolor{DissertationColor}{\@title}\end{Spacing}}}
    \vspace*{2ex}
    \@ifundefined{@tagline}{\vspace*{3.54cm}}{{\large\textit{\@tagline}}\\[2.54cm]}
    {\LARGE\bfseries \@author} \\[1cm]
    {\large Supervised by \@supervisor}
    \@ifundefined{@cosupervisor}{\\[2ex]}{\\[2ex]\large Co-supervised by \@cosupervisor}\\[1cm]
    {\large \@department} \\[1ex]
    {\large \@faculty} \\[1ex]
    {\large University of Malta} \\
    \vfill
    {\bfseries \@submissionDate} \\[\baselineskip]
    \parbox[t]{0.80\linewidth}{\footnotesize\textit{A \@doctype\ submitted in
        partial fulfilment of the requirements for the degree of \@degreeName}.}
  }
  \thispagestyle{empty}
  \if@openright\cleardoublepage\else\clearpage\fi
  \endgroup}

% ----- Official University of Malta cover (default) -----
% Font sizes and baseline-to-baseline distances are in bp (as in InDesign)
% and follow the official UM template: A4, Lato, text #231F20, logo 70mm
% wide and centred on the page. Departure from the template: the title is
% in UMRed.

\newsavebox{\@umcoverbox}
\newlength{\@umcoverwidth}
\setlength{\@umcoverwidth}{170mm} % text width, i.e. 20mm side margins

% Start a group of lines.
%   #1 = distance from the previous baseline, #2 = font size (bp), #3 = leading
\newcommand{\@umcovergroup}[3]{%
  \vspace{\dimexpr #1 - #3\relax}\fontsize{#2bp}{#3}\selectfont}

\newcommand{\@umnewtitle}{%
  \begingroup
  \sbox{\@umcoverbox}{%
    \parbox[t][596.8bp][t]{\@umcoverwidth}{%
      \umcoverfont\color{UMCoverText}\centering
      \def\baselinestretch{1}% ignore the document's one-and-a-half spacing
      \setlength{\parindent}{0bp}\setlength{\parskip}{0bp}%
      \lineskiplimit=-\maxdimen
      \includegraphics[width=70.1mm]{umlogo_full_red}\par
      {\@umcovergroup{106.2bp}{26}{32.4bp}\umcoverfontspaced\bfseries\color{UMRed}\@title\par}
      \@ifundefined{@tagline}{\vspace{26.9bp}}%
        {{\@umcovergroup{26.9bp}{13}{17bp}\umcoverfontspaced\itshape \@tagline\par}}
      {\@umcovergroup{85.2bp}{18}{22bp}\bfseries \@author\par}
      {\@umcovergroup{45.6bp}{12}{20.1bp}Supervised by \@supervisor
        \@ifundefined{@cosupervisor}{}{\\Co-supervised by \@cosupervisor}\par}
      {\@umcovergroup{40.1bp}{12}{20.1bp}\@faculty\\\@department\\University of Malta\par}
      \vfill
      {\fontsize{12bp}{20bp}\selectfont\bfseries \@submissionDate\par}
      {\@umcovergroup{33.1bp}{10}{16bp}\umcoverfontspaced\itshape A \@doctype\ submitted in
        partial fulfilment of the requirements\\
        for the degree of \@degreeName.\par}
      \kern-\prevdepth}}%
  % place the top of the logo 107.9bp from the top of the page, centred horizontally
  \AddToShipoutPictureFG*{\AtPageUpperLeft{%
      \put(\LenToUnit{\dimexpr(\paperwidth-\@umcoverwidth)/2\relax},\LenToUnit{-107.9bp}){%
        \usebox{\@umcoverbox}}}}%
  \null
  \thispagestyle{empty}
  \if@openright\cleardoublepage\else\clearpage\fi
  \endgroup}

\renewcommand{\maketitle}{%
  \if@umoldcover\@umoldtitle\else\@umnewtitle\fi}


% ==================================================================
% Front matter environments
% ==================================================================

\addto{\captionsbritish}{%
  \renewcommand{\abstractname}%
    {\Large\bfseries\sffamily\textcolor{DissertationColor}{Abstract}}}

\newenvironment{acknowledgements}
  {\renewcommand{\abstractname}%
     {\Large\bfseries\sffamily\textcolor{DissertationColor}{Acknowledgements}}%
   \abstract}
  {\endabstract\if@openright\cleardoublepage\else\clearpage\fi}

\newenvironment{dedication}
  {\clearpage             % start a new page
   \thispagestyle{empty}  % with no header and footer
   \vspace*{\stretch{1}}  % some space at the top
   \itshape               % italic text
   \raggedleft            % flush to the right margin
   \color{DissertationColor}% in the accent colour
  }
  {\par                   % end the paragraph
   \vspace{\stretch{3}}   % space at the bottom is three times that at the top
   \if@openright\cleardoublepage\else\clearpage\fi
  }

% Copyright page: UM logo, copyright notice, URL and edition date at the
% bottom of an otherwise empty page.
\newenvironment{copyrightenv}
  {\clearpage
   ~\vfill
   \thispagestyle{empty}

   \vspace{\intextsep}
   \noindent\includegraphics[width=2.5in]{umlogo_full_red}\par
   \vspace{\intextsep}

   \noindent Copyright \textcopyright\ \the\year\ University of Malta\par
   \vspace{\baselineskip}

   \noindent \textsc{www.um.edu.mt}\par
   \vspace{\baselineskip}

   \noindent \textit{First edition, \today}

   % Optional licence text, e.g.:
   % \noindent Licensed under the Creative Commons Attribution-NonCommercial 3.0
   % Unported License (the ``License''). You may not use this file except in
   % compliance with the License. You may obtain a copy of the License at
   % \url{http://creativecommons.org/licenses/by-nc/3.0}. Unless required by
   % applicable law or agreed to in writing, software distributed under the
   % License is distributed on an \textsc{``as is'' basis, without warranties or
   % conditions of any kind}, either express or implied. See the License for the
   % specific language governing permissions and limitations under the License.
   \if@openright\cleardoublepage\else\clearpage\fi}


% ==================================================================
% Other environments
% ==================================================================

% Conditions for equations, e.g. "where x = ..., y = ..."
\newenvironment{conditionsenv*}
  {\par\vspace{\abovedisplayskip}\noindent
   \tabularx{\columnwidth}{>{$}l<{$} @{${}={}$} >{\raggedright\arraybackslash}X}}
  {\endtabularx\par\vspace{\belowdisplayskip}}

\endinput
