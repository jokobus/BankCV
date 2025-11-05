% -------------------------------------------------
% November 2025 v1.1
% Usage: https://github.com/jokobus/BankCV
% MIT License: https://github.com/jokobus/BankCV/blob/main/LICENSE
% -------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bankcv}[2025/11/05 v1.1 Clean Banking CV Class]

% -------------------------------------------------
% 1.  CLASS OPTIONS (FONT SIZE, STYLE & PAGE DENSITY)
% -------------------------------------------------
\makeatletter
\newif\if@dense \@densefalse
\newif\if@ninept \@nineptfalse
\newif\if@eightpt \@eightptfalse
\newif\if@customdensity \@customdensityfalse
\newif\if@serif \@seriftrue
\def\cv@densityfactor{1.0}

% --- Declare options ---
\DeclareOption{dense}{\@densetrue}
\DeclareOption{9pt}{\@ninepttrue}
\DeclareOption{8pt}{\@eightpttrue}
\DeclareOption{serif}{\@seriftrue}
\DeclareOption{sansserif}{\@seriffalse}

% --- Handle density key value pair correctly ---

% Handle unknown options - check if it's density=value
\DeclareOption*{%
    \expandafter\@IfStartsWith\expandafter{\CurrentOption}{density=}{%
        \expandafter\@customdensitytrue
        \expandafter\@ExtractValue\CurrentOption\@nil
    }{%
        \PassOptionsToClass{\CurrentOption}{article}%
    }%
}

% Helper to check if string starts with prefix
\def\@IfStartsWith#1#2{%
    \def\@tempa##1#2##2\@nil{%
        \ifx\relax##2\relax
            \expandafter\@secondoftwo
        \else
            \expandafter\@firstoftwo
        \fi
    }%
    \@tempa#1#2\relax\@nil
}

% Helper to extract value after density=
\def\@ExtractValue density=#1\@nil{%
    \def\cv@densityfactor{#1}%
}

\ProcessOptions\relax

% -------------------------------------------------
% 2.  LOAD BASE CLASS
% -------------------------------------------------
\LoadClass{article}

% -------------------------------------------------
% 3.  CUSTOM FONT SIZES (8pt, 9pt)
% -------------------------------------------------
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
% -------------------------------------------------
% 4.  LENGTH DEFINITIONS 
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
\setlength{\cv@margin@bottom}{2cm}
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
\setlength{\cv@list@leftmargin}{18pt}
\setlength{\cv@space@itemsep}{2pt}
\setlength{\cv@space@skillslistbefore}{10pt}
\setlength{\cv@space@skillslistafter}{0pt}
\setlength{\cv@space@skillsitemsep}{2pt}

% ---- Dense spacing (override) ----
\if@dense
	\setlength{\cv@margin@top}{2cm}
	\setlength{\cv@margin@bottom}{0cm}
	\setlength{\cv@margin@left}{1.5cm}
	\setlength{\cv@margin@right}{1.5cm}
	\setlength{\cv@space@headerbreak}{4pt}
	\setlength{\cv@space@afterheader}{2pt}
	\setlength{\cv@space@sectionbefore}{3pt}
	\setlength{\cv@space@sectionrule}{3pt}
	\setlength{\cv@space@sectionafter}{0pt}
	\setlength{\cv@space@cventrybefore}{3pt}
	\setlength{\cv@space@cventryafter}{2pt}
	\setlength{\cv@space@eduentrybefore}{3pt}
	\setlength{\cv@space@eduentryafter}{0pt}
	\setlength{\cv@list@leftmargin}{12pt}
	\setlength{\cv@space@itemsep}{0pt}
	\setlength{\cv@space@skillslistbefore}{0pt}
	\setlength{\cv@space@skillslistafter}{2pt}
	\setlength{\cv@space@skillsitemsep}{0pt}
\fi

% ---- Custom density factor (override) ----
\if@customdensity
	% Uncomment the next four lines to override the margins as well if option density=<key> is set
	%\setlength{\cv@margin@top}{\cv@densityfactor\cv@margin@top}
	%\setlength{\cv@margin@bottom}{\cv@densityfactor\cv@margin@bottom}
	%\setlength{\cv@margin@left}{\cv@densityfactor\cv@margin@left}
	%\setlength{\cv@margin@right}{\cv@densityfactor\cv@margin@right}
	\setlength{\cv@space@headerbreak}{\cv@densityfactor\cv@space@headerbreak}
	\setlength{\cv@space@afterheader}{\cv@densityfactor\cv@space@afterheader}
	\setlength{\cv@space@sectionbefore}{\cv@densityfactor\cv@space@sectionbefore}
	\setlength{\cv@space@sectionrule}{\cv@densityfactor\cv@space@sectionrule}
	\setlength{\cv@space@sectionafter}{\cv@densityfactor\cv@space@sectionafter}
	\setlength{\cv@space@cventrybefore}{\cv@densityfactor\cv@space@cventrybefore}
	\setlength{\cv@space@cventryafter}{\cv@densityfactor\cv@space@cventryafter}
	\setlength{\cv@space@eduentrybefore}{\cv@densityfactor\cv@space@eduentrybefore}
	\setlength{\cv@space@eduentryafter}{\cv@densityfactor\cv@space@eduentryafter}
	\setlength{\cv@list@leftmargin}{\cv@densityfactor\cv@list@leftmargin}
	\setlength{\cv@space@itemsep}{\cv@densityfactor\cv@space@itemsep}
	\setlength{\cv@space@skillslistbefore}{\cv@densityfactor\cv@space@skillslistbefore}
	\setlength{\cv@space@skillslistafter}{\cv@densityfactor\cv@space@skillslistafter}
	\setlength{\cv@space@skillsitemsep}{\cv@densityfactor\cv@space@skillsitemsep}
\fi

% expose \cv@space@entrybefore as \cventrybefore to bankcv.tex
\newlength{\cventrybefore}
\setlength{\cventrybefore}{\cv@space@cventrybefore}

% -------------------------------------------------
% 5.  REQUIRED PACKAGES
% -------------------------------------------------
% Font encoding
\RequirePackage[T1]{fontenc}

\if@serif
	\RequirePackage{tgtermes}  % Serif font (TeX Gyre Termes)
\else
	\RequirePackage{helvet}    % Sans-serif font (Helvetica)
	\renewcommand{\familydefault}{\sfdefault}
\fi

% Page layout
\RequirePackage{geometry}

% Formatting packages
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{multicol}
\RequirePackage{xargs}
\RequirePackage{fontawesome5}

% Hyperlinks
\RequirePackage{hyperref}

% -------------------------------------------------
% 6.  Page & spacing setup
% -------------------------------------------------
\pagestyle{empty}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\setlength{\headheight}{0pt}
\setlength{\headsep}{0pt}
\setlength{\footskip}{0pt}

\geometry{
	left   =\cv@margin@left,
  	right  =\cv@margin@right,
  	top    =\cv@margin@top,
  	bottom =\cv@margin@bottom
}

\hypersetup{
	colorlinks=true,
	linkcolor=black,
	urlcolor=black,
	citecolor=black,
	anchorcolor=black
}

% -------------------------------------------------
% 7.  Header command
% -------------------------------------------------

% Define separator for header items
\newcommand{\AND}{\(\cdot\)}

% --- Flexible header (using xargs) ---
% Argument order:
%   #1 Icons (optional, default=false) - Set to 'true' to show FontAwesome icons
%   #2 Name (required)
%   #3 Location text (optional)
%   #4 Location / Maps URL (optional)
%   #5 Phone (optional)
%   #6 Email (required)
%   #7 LinkedIn (optional)
%   #8 GitHub (optional)
% Usage examples:
%  - \makeheader[true]{Name}[City, Country][https://maps.example/...][+1 234...]{me@mail.com}[linkedin.com/in/me][github.com/me]
%  - \makeheader{Name}[City, Country][https://maps.example/...][+1 234...]{me@mail.com}[linkedin.com/in/me][github.com/me]
%  - \makeheader{Name}{me@mail.com}  % minimal: only name and email

\newcommandx{\makeheader}[8][1=false,3=,4=,5=,7=,8=]{%
	\begin{center}
		% Name (#2, required)
		{\huge\selectfont\bfseries #2}\\[\cv@space@headerbreak]%
		\normalsize%
		% Location (#3, optional. Linked if custom map URL provided as #4)
		\def\@showicons{#1}%
		\def\@iconstr{true}%
		\if\relax\detokenize{#3}\relax
			% No location provided
		\else
			\ifx\@showicons\@iconstr
				{\footnotesize\faMapMarker*}\hspace*{0.13cm}%
			\fi
			\if\relax\detokenize{#4}\relax
				#3%
			\else
				\href{#4}{#3}%
			\fi
		\fi
		% Phone (#5, optional)
		\if\relax\detokenize{#5}\relax
		\else
			% Add separator if location exists
			\if\relax\detokenize{#3}\relax
			\else
				\ifx\@showicons\@iconstr
					\kern 0.5cm%
				\else
					\kern 0.25cm%
					\,\AND\,%
					\kern 0.25cm%
				\fi
			\fi
			\ifx\@showicons\@iconstr
				{\footnotesize\faPhone*}\hspace*{0.15cm}%
			\fi
			\href{tel:#5}{#5}%
		\fi
		% Email (#6, required)
		% Add separator if location or phone exists
		\if\relax\detokenize{#3}\relax
			\if\relax\detokenize{#5}\relax
				% No separator needed (no location, no phone)
			\else
				% Phone exists but no location
				\ifx\@showicons\@iconstr
					\kern 0.5cm%
				\else
					\kern 0.25cm%
					\,\AND\,%
					\kern 0.25cm%
				\fi
			\fi
		\else
			% Location exists
			\ifx\@showicons\@iconstr
				\kern 0.5cm%
			\else
				\kern 0.25cm%
				\,\AND\,%
				\kern 0.25cm%
			\fi
		\fi
		\ifx\@showicons\@iconstr
			{\footnotesize\faEnvelope[regular]}\hspace*{0.15cm}%
		\fi
		\href{mailto:#6}{#6}%
		% LinkedIn (#7, optional)
		\if\relax\detokenize{#7}\relax
		\else
			\ifx\@showicons\@iconstr
				\kern 0.5cm%
				{\footnotesize\faLinkedinIn}\hspace*{0.15cm}%
			\else
				\kern 0.25cm%
				\,\AND\,%
				\kern 0.25cm%
			\fi
			\href{https://#7}{#7}%
		\fi
		% GitHub (#8, optional)
		\if\relax\detokenize{#8}\relax
		\else
			\ifx\@showicons\@iconstr
				\kern 0.5cm%
				{\footnotesize\faGithub}\hspace*{0.15cm}%
			\else
				\kern 0.25cm%
				\,\AND\,%
				\kern 0.25cm%
			\fi
			\href{https://#8}{#8}%
		\fi
	\end{center}%
	\vspace{\cv@space@afterheader}%
}

% --- Simple header (without using xargs) ---
%\newcommand{\makeheader}[6]{%
%	\begin{center}
%		{\huge\selectfont\bfseries #1}\\[\cv@space@headerbreak]%
%		\normalsize%
%		#2\ $\cdot$\ #3\ $\cdot$\ \href{mailto:#4}{#4}\ $\cdot$\ \href{https://#5}{#5} $\cdot$ \href{https://#6}{#6}%
%	\end{center}%
%	\vspace{\cv@space@afterheader}%
%}

% -------------------------------------------------
% 8.  Section formatting (all caps + rule)
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
% 9.  Entry commands
% -------------------------------------------------

% --- Experience/role entry --- 
%   #1 Organization name (required)
%   #2 Organization URL (optional)
%   #3 Right column top line (e.g., Location or Dates) (required)
%   #4 Subtitle/role (left, italic) (required)
%   #5 Right column bottom (e.g., Location or Dates) (required)
\newcommandx{\cventry}[5][2=]{%
	\vspace{\cv@space@cventrybefore}%
	\noindent%
	\if\relax\detokenize{#2}\relax
		{\bfseries #1}%
	\else
		{\bfseries \href{#2}{#1}}%
	\fi
	\hfill {\bfseries #3}\\%
		\textit{#4} \hfill {#5}%
	\vspace{\cv@space@cventryafter}%
}

% --- Education entry --- 
%   #1 Institution name (required)
%   #2 Institution URL (optional)
%   #3 Right column top line (e.g., Location or Dates) (required)
%   #4 Degree/field (left, italic) (required)
%   #5 Right column bottom (e.g., Location or Dates) (required)
\newcommandx{\cveduentry}[5][2=]{%
	\vspace{\cv@space@eduentrybefore}%
	\noindent%
	\if\relax\detokenize{#2}\relax
		{\bfseries #1}%
	\else
		{\bfseries \href{#2}{#1}}%
	\fi
	\hfill {\bfseries #3}\\%
		\textit{#4}  \hfill {#5}%
	\vspace{\cv@space@eduentryafter}%
}

% --- Simple headers (without using xargs) --- 
%\newcommand{\cventry}[4]{%
%	\vspace{\cv@space@cventrybefore}%
%	\noindent%
%	{\bfseries #1}, \hfill {\bfseries #2}\\%
%	\textit{#3} \hfill {#4}%
%	\vspace{\cv@space@cventryafter}%
%}
%\newcommand{\cveduentry}[4]{%
%	\vspace{\cv@space@eduentrybefore}%
%	\noindent%
%	{\bfseries #1}, \hfill {\bfseries #2}\\%
%	\textit{#3}  \hfill {#4}%
%	\vspace{\cv@space@eduentryafter}%
%}

% -------------------------------------------------
% 10.  Bullet list style
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
% 11.  Skills list environment (default: 3 columns)
% -------------------------------------------------
% Usage: \begin{skillslist}[3] ... \end{skillslist} % Change 3 to number of columns
\newenvironmentx{skillslist}[1][1=3]{%
	\vspace{\cv@space@skillslistbefore}%
	\begingroup
	\setlength{\multicolsep}{0pt}%
	\begin{multicols}{#1}
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