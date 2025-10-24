% -------------------------------------------------
% October 2025 v1.0
% -------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bankingcv}[2025 Clean Banking CV Class]

% -------------------------------------------------
% 1.  FONT SIZE OPTIONS
% -------------------------------------------------
\makeatletter
\newif\if@dense \@densefalse
\newif\if@ninept \@nineptfalse
\newif\if@eightpt \@eightptfalse

\DeclareOption{dense}{\@densetrue}
\DeclareOption{9pt}{\@ninepttrue}
\DeclareOption{8pt}{\@eightpttrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\makeatother

% -------------------------------------------------
% 2.  LOAD BASE CLASS
% -------------------------------------------------
\LoadClass{article}


% -------------------------------------------------
% 2.  CUSTOM FONT SIZES (8pt, 9pt)
% -------------------------------------------------
\makeatletter
\if@ninept
    \renewcommand\normalsize{%
        \@setfontsize\normalsize{9}{11}%
        \abovedisplayskip 8\p@ \@plus2\p@ \@minus4\p@
        \abovedisplayshortskip \z@ \@plus2\p@
        \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
        \belowdisplayskip \abovedisplayskip
        \let\@listi\@listI}
    \normalsize
    \renewcommand\small{%
        \@setfontsize\small{8}{9.6}%
        \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
        \abovedisplayshortskip \z@ \@plus2\p@
        \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
        \def\@listi{\leftmargin\leftmargini
                    \topsep 4\p@ \@plus2\p@ \@minus2\p@
                    \parsep 2\p@ \@plus\p@ \@minus\p@
                    \itemsep \parsep}%
        \belowdisplayskip \abovedisplayskip
}
\fi
\if@eightpt
    \renewcommand\normalsize{%
        \@setfontsize\normalsize{8}{10}%
        \abovedisplayskip 7\p@ \@plus2\p@ \@minus4\p@
        \abovedisplayshortskip \z@ \@plus2\p@
        \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
        \belowdisplayskip \abovedisplayskip
        \let\@listi\@listI}
    \normalsize
    \renewcommand\small{%
        \@setfontsize\small{7}{8.4}%
        \abovedisplayskip 5\p@ \@plus2\p@ \@minus4\p@
        \abovedisplayshortskip \z@ \@plus2\p@
        \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
        \def\@listi{\leftmargin\leftmargini
                    \topsep 3\p@ \@plus2\p@ \@minus2\p@
                    \parsep 2\p@ \@plus\p@ \@minus\p@
                    \itemsep \parsep}%
        \belowdisplayskip \abovedisplayskip
}
\fi
\makeatother

% -------------------------------------------------
% 3.  LENGTH DEFINITIONS 
% -------------------------------------------------
\makeatletter
% ---- Declare new spacing ----
\newlength{\cv@margin@top}
\newlength{\cv@margin@bottom}
\newlength{\cv@margin@left}
\newlength{\cv@margin@right}
\newlength{\cv@space@headerbreak}
\newlength{\cv@space@afterheader}
\newlength{\cv@space@sectionbefore}
\newlength{\cv@space@sectionrule}
\newlength{\cv@space@sectionafter}
\newlength{\cv@space@cventrybefore}
\newlength{\cv@space@cventryafter}
\newlength{\cv@space@eduentrybefore}
\newlength{\cv@space@eduentryafter}
\newlength{\cv@list@leftmargin}
\newlength{\cv@space@itemsep}
\newlength{\cv@space@skillslistbefore}
\newlength{\cv@space@skillslistafter}
\newlength{\cv@space@skillsitemsep}

% ---- Standard spacing (default) ----
\setlength{\cv@margin@top}{2.5cm}
\setlength{\cv@margin@bottom}{1cm}
\setlength{\cv@margin@left}{2cm}
\setlength{\cv@margin@right}{2cm}
\setlength{\cv@space@headerbreak}{8pt}
\setlength{\cv@space@afterheader}{2pt}
\setlength{\cv@space@sectionbefore}{12pt}
\setlength{\cv@space@sectionrule}{0pt}
\setlength{\cv@space@sectionafter}{0pt}
\setlength{\cv@space@cventrybefore}{10pt}
\setlength{\cv@space@cventryafter}{4pt}
\setlength{\cv@space@eduentrybefore}{10pt}
\setlength{\cv@space@eduentryafter}{0pt}
\setlength{\cv@list@leftmargin}{2em}
\setlength{\cv@space@itemsep}{2pt}
\setlength{\cv@space@skillslistbefore}{10pt}
\setlength{\cv@space@skillslistafter}{0pt}
\setlength{\cv@space@skillsitemsep}{4pt}

% ---- Dense spacing (override) ----
\if@dense
	\setlength{\cv@margin@top}{2.2cm}
	\setlength{\cv@margin@bottom}{2cm}
	\setlength{\cv@margin@left}{1.5cm}
	\setlength{\cv@margin@right}{1.5cm}
	\setlength{\cv@space@headerbreak}{6pt}
	\setlength{\cv@space@afterheader}{2pt}
	\setlength{\cv@space@sectionbefore}{4pt}
	\setlength{\cv@space@sectionrule}{2pt}
	\setlength{\cv@space@sectionafter}{0pt}
	\setlength{\cv@space@cventrybefore}{4pt}
	\setlength{\cv@space@cventryafter}{2pt}
	\setlength{\cv@space@eduentrybefore}{4pt}
	\setlength{\cv@space@eduentryafter}{0pt}
	\setlength{\cv@list@leftmargin}{1.5em}
	\setlength{\cv@space@itemsep}{0pt}
	\setlength{\cv@space@skillslistbefore}{4pt}
	\setlength{\cv@space@skillslistafter}{2pt}
	\setlength{\cv@space@skillsitemsep}{0pt}
\fi
\makeatother

% -------------------------------------------------
% 4.  REQUIRED PACKAGES
% -------------------------------------------------
\makeatletter
\RequirePackage{geometry}
\geometry{
	left   =\cv@margin@left,
  	right  =\cv@margin@right,
  	top    =\cv@margin@top,
  	bottom =\cv@margin@bottom
}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{multicol}
\RequirePackage{hyperref}
\RequirePackage{textcase}
\RequirePackage{tgtermes}
\RequirePackage[T1]{fontenc}
\RequirePackage{parskip}

% -------------------------------------------------
% 5.  Page & spacing setup
% -------------------------------------------------
\pagestyle{empty}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\setlength{\headheight}{0pt}
\setlength{\headsep}{0pt}
\setlength{\footskip}{0pt}

\hypersetup{
	colorlinks=true,
	linkcolor=black,
	urlcolor=black,
	citecolor=black,
	anchorcolor=black
}

% -------------------------------------------------
% 6.  Header command
% -------------------------------------------------
\newcommand{\makeheader}[5]{%
	\begin{center}
		{\huge\selectfont\bfseries #1}\\[\cv@space@headerbreak]%
		\normalsize%
		#2\ $\cdot$\ #3\ $\cdot$\ \href{mailto:#4}{#4}\ $\cdot$\ \href{https://#5}{#5}%
	\end{center}%
	\vspace{\cv@space@afterheader}%
}

% -------------------------------------------------
% 7.  Section formatting (all caps + rule)
% -------------------------------------------------
\titleformat{\section}
	{
		\large 
		\if@dense 
			\normalsize
		\fi
		\bfseries
	}
	{}
	{0em}
	{\MakeUppercase}
	[\titlerule\vspace{\cv@space@sectionrule}]

\titlespacing*{\section}
	{0pt}
	{\cv@space@sectionbefore}
	{\cv@space@sectionafter}

% -------------------------------------------------
% 8.  Entry commands
% -------------------------------------------------
\newcommand{\cventry}[4]{%
	\vspace{\cv@space@cventrybefore}%
	\noindent%
	{\bfseries #1}, \hfill {\bfseries #2}\\%
	\textit{#3} \hfill {#4}%
	\vspace{\cv@space@cventryafter}%
}
\newcommand{\cveduentry}[4]{%
	\vspace{\cv@space@eduentrybefore}%
	\noindent%
	{\bfseries #1}, \hfill {\bfseries #2}\\%
	\textit{#3}  \hfill {#4}%
	\vspace{\cv@space@eduentryafter}%
}

% -------------------------------------------------
% 9.  Bullet list style
% -------------------------------------------------
\setlist[itemize]{%
	label=\textbullet,
	leftmargin=\cv@list@leftmargin,
	itemsep=\cv@space@itemsep,
	topsep=0pt,
	partopsep=0pt,
	parsep=0pt
}

% -------------------------------------------------
% 10.  Skills list environment (3 columns)
% -------------------------------------------------
\newenvironment{skillslist}{%
	\vspace{\cv@space@skillslistbefore}%
	\begingroup
	\setlength{\multicolsep}{0pt}%
	\begin{multicols}{3}
    	\begin{itemize}[itemsep=\cv@space@skillsitemsep]%
}{%
    	\end{itemize}
  	\end{multicols}%
	\endgroup
	\vspace{\cv@space@skillslistafter}%
}


% Restore normal category codes at end of class file
\makeatother
\endinput