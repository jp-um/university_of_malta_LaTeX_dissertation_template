%% ****************************************************
%% **                                                **
%% **              University of Malta               **
%% **           Faculty of Information & 		     **
%% **           Communication Technology             **
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
\ProvidesClass{um-fict}[2022/03/17 v0.9 University of Malta, Dissertation/FYP/Thesis Template]



\DeclareOption*{\PassOptionsToClass{\CurrentOption}{um}}
\ProcessOptions\relax
\LoadClass[12pt,a4paper,onepage,final]{um}

\colorlet{DissertationColor}{black}   	% no fancy red colour

\def\logo{{\includegraphics[width=90mm]{fict_red_logo}}}

\renewcommand*\familydefault{\sfdefault}	     % sans serif font

\makepagestyle{umpage}
\uppercaseheads								 
\makeevenfoot{umpage}{}{\color{gray}\sffamily\small\thepage}{}
\makeoddfoot{umpage}{}{\color{gray}\sffamily\small\thepage}{}
\makeevenhead{umpage}{\small\leftmark}{}{}
\makeoddhead{umpage}{}{}{\small\rightmark}

\makepagestyle{umpage-noheader}
\makeevenfoot{umpage-noheader}{}{\color{gray}\sffamily\small\thepage}{}
\makeoddfoot{umpage-noheader}{}{\color{gray}\sffamily\small\thepage}{}
\makeevenhead{umpage-noheader}{}{}{}
\makeoddhead{umpage-noheader}{}{}{}

\pagestyle{umpage}
\aliaspagestyle{chapter}{umpage-noheader}
\floatpagestyle{empty}

\RequirePackage{changepage}

\chapterstyle{default}

\setsecnumformat{\csname the#1\endcsname\enskip}
\renewcommand{\labelitemi}{\color{DissertationColor}\scriptsize\textbullet}

\renewenvironment{proof}{\underline{Proof:} }{}

%% following is required to create a renewtheorem which is equivalent to renew environment.
\def\renewtheorem#1{%
	\expandafter\let\csname#1\endcsname\relax
	\expandafter\let\csname c@#1\endcsname\relax
	\gdef\renewtheorem@envname{#1}
	\renewtheorem@secpar
}
\def\renewtheorem@secpar{\@ifnextchar[{\renewtheorem@numberedlike}{\renewtheorem@nonumberedlike}}
\def\renewtheorem@numberedlike[#1]#2{\newtheorem{\renewtheorem@envname}[#1]{#2}}
\def\renewtheorem@nonumberedlike#1{  
	\def\renewtheorem@caption{#1}
	\edef\renewtheorem@nowithin{\noexpand\newtheorem{\renewtheorem@envname}{\renewtheorem@caption}}
	\renewtheorem@thirdpar
}
\def\renewtheorem@thirdpar{\@ifnextchar[{\renewtheorem@within}{\renewtheorem@nowithin}}
\def\renewtheorem@within[#1]{\renewtheorem@nowithin[#1]}
%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewtheorem{theorem}{Theorem}
\renewtheorem{corollary}{Corollary}
\renewtheorem{lemma}{Lemma}

%% *************** Environments (Start) ******************

%% *** Title Page (Start) ***

\renewcommand{\maketitle}
{\begingroup
	\setlength{\parindent}{0pt}
	%%\fontfamily{pag}\selectfont
	\sffamily
	\setlrmarginsandblock{3.7cm}{3cm}{*}
	\checkandfixthelayout
	\setlength{\vsize}{\textheight} %% you need these to reset the lengths
	\setlength{\columnwidth}{\textwidth}
	\setlength{\hsize}{\columnwidth}
	\setlength{\linewidth}{\hsize}
	{\Huge\bfseries{\begin{Spacing}{1.15}\textcolor{DissertationColor}{\@title}\end{Spacing}}}
	\vspace*{30mm}
	%%{\large\textit{\@tagline}}\\[1in]
	{\LARGE\bfseries \textsc{\@author}} \\[10mm]
	{\large Supervisor: \@supervisor} 
	\@ifundefined{@cosupervisor}{\\[20mm]}{\\[3mm]\large Co-supervisor: \@cosupervisor}\\[20mm]
	{\@degreeDate}\\
	\vfill	
	%%\parbox[t]{80mm}{\footnotesize\textit{A \@doctype\ submitted in partial fulfilment of the requirements for the degree of \@degreeName}.} \\[3ex] 
	\parbox[t]{120mm}{\textit{Submitted in partial fulfilment of the requirements for the degree of \@degreeName}.} \\[15mm] 
	\logo
	\thispagestyle{empty}
	\if@openright\cleardoublepage\else\clearpage\fi
	\endgroup}
%% *** Title Page (End) ***

%\renewenvironment{acknowledgements}
%{\renewcommand{\abstractname}{\flushleft\Large\sffamily\textcolor{DissertationColor}{Acknowledgements}}\abstract}
%{\flushleft\endabstract\if@openright\cleardoublepage\else\clearpage\fi}

\renewenvironment{acknowledgements}
{\setlength{\parindent}{0pt}% No paragraph indent
	\begin{adjustwidth}{13mm}{13mm}
		{\bfseries\LARGE\textcolor{DissertationColor}{Acknowledgements}\par}\bigskip}
	{\end{adjustwidth}\if@openright\cleardoublepage\else\clearpage\fi}

\renewenvironment{abstract}
{\setlength{\parindent}{0pt}% No paragraph indent
	\begin{adjustwidth}{13mm}{13mm}
		{\bfseries\LARGE\textcolor{DissertationColor}{Abstract}\par}\bigskip}
	{\end{adjustwidth}\if@openright\cleardoublepage\else\clearpage\fi}


%% **************** Environments (End) *******************