%% 
%% Copyright 2022 Netherlands eScience Center
%% 
%% Licensed under the Apache License, version 2.0, See LICENSE for details.
%%

%% Identification
%%The class identifies itself and the LaTeX version needed
\def\@plbReleaseDate{2022/05/06}
\def\@plbVersion{0.1.0}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{project-logbook}[\@plbReleaseDate, \@plbVersion]

%% Load base class
\LoadClass[11pt, a4paper]{article}

%% Dependencies
\RequirePackage{xparse}  % Required for advanced commands
\RequirePackage{titlesec}  % Fancy sections
\RequirePackage{xcolor}
\RequirePackage[T1]{fontenc} % Use 8-bit encoding that has 256 glyphs
\RequirePackage[utf8]{inputenc} % For Spanish characters
\RequirePackage[USenglish]{babel} % USEnglish localisation

% =========== General Formatting =============
\RequirePackage[a4paper, hmargin=2cm,vmargin=2.5cm, headheight=16pt]{geometry} % Margin sizes
%\RequirePackage{microtype} % Slightly tweak font spacing for aesthetics
\RequirePackage{fancyhdr} % Allows for nice header and footer
%\RequirePackage{sectsty} % Allows customizing section commands
\RequirePackage{appendix} % Enables appendices
\RequirePackage{enumerate} % Custom numerate, useful for i,ii,iii... I,II,III...
%\RequirePackage{hyperref} % For hyperlinks in the PDF
\RequirePackage[colorlinks = true,
            linkcolor = red,
            urlcolor  = blue,
            citecolor = green,
            filecolor = cyan,
            anchorcolor = blue]{hyperref}
\RequirePackage{xcolor} % Required for custom colors
\RequirePackage{lastpage} %  par­tic­u­larly use­ful in the page footer that says: Page N of M.

% =============== Math ===============
\RequirePackage{amsmath} % Standard math packages
\RequirePackage{amsthm} % Math Theorems
\RequirePackage{amssymb} % Math Symbols
\RequirePackage{amsfonts} % Math Fonts
\RequirePackage{mathtools} % Extra math tools such as PairedDelimiter
\RequirePackage{upgreek} % Nice sigma => \upsigma
\RequirePackage{array} % Enables array features
\RequirePackage{siunitx} % For SI Unit easy formatting

% =============== Figures ===============
\RequirePackage{float} % Float features
\RequirePackage{graphicx} % Image insertion.
\RequirePackage{caption,subcaption} % For custom caption environments
\RequirePackage{wrapfig} % Al­lows fig­ures or ta­bles to have text wrapped around them
\RequirePackage{tikz} % Diagram and figure creation and rendering
\RequirePackage[americanvoltages, europeancurrents, americanresistors, cuteinductors]{circuitikz} % Circuit Graphics

% =============== Tables ===============
\RequirePackage{booktabs} % Horizontal rules in tables
\RequirePackage{float} % Required for tables and figures in the multi
\RequirePackage{multirow} % Combined rows in tables
\RequirePackage{multicol} % Combined columns in tables
\RequirePackage{colortbl} % Color cells
%\usepackage{longtable} % Tables than span multipages

% % =============== Listings ============
\RequirePackage{listings} % Main package for inserting code
\RequirePackage[scaled]{beramono} % For using the beramono font

% % =============== Algorithms ===============
\RequirePackage{algorithm} % Allows for algorithm description
\RequirePackage[noend]{algpseudocode}

% =============== Other ===============
\RequirePackage{datetime} % Date-Time formatting
\RequirePackage{ulem} % For strikethrough text \st{}
\RequirePackage[colorinlistoftodos]{todonotes} % useful for leaving todonotes
\RequirePackage{textcomp} %Text Com­pan­ion fonts

\RequirePackage{pdfpages} % Insert pdfs
\RequirePackage{lipsum} % Used for inserting dummy 'Lorem ipsum' text into the template
% \usepackage[space]{grffile} % insert files with spaces
\RequirePackage{pdflscape} % Individual horizontal pages
\RequirePackage{tcolorbox} % Color boxes for comment
%\usepackage{xargs} % Expanded arguments features
%\usepackage{fix-cm} % Computer-Modern at arbitrarysizes
%\usepackage{eurosym} % Eurosymbol

%% Contributors definition
\ExplSyntaxOn

	% Declare the contributors property
	\prop_new:N \g_contributors_prop
	\prop_new:N \g_contributor_keys_prop
	
	% Define the contributors property id for easy iteration
	\NewDocumentCommand{\CreateContributorKeys}{mm} {
  		\prop_gput:Nnn \g_contributor_keys_prop {#1}{#2}
 	}
	
	% Define the contributors property
	\NewDocumentCommand{\CreateContributor}{mmmm} {
  		\prop_gput:Nnn \g_contributors_prop { #1-name } { #2 }
  		\prop_gput:Nnn \g_contributors_prop { #1-id } { #3 }
		\prop_gput:Nnn \g_contributors_prop { #1-institution } { #4 }
		\CreateContributorKeys{#1}{#1}
 	}

	% Create a quick access LaTeX2e accessible command to contributor's name
	\NewDocumentCommand{\ContributorName}{m}{
 	 	\prop_item:Nn \g_contributors_prop { #1-name }
 	}
	
	% Create a quick access LaTeX2e accessible command to contributor's id
	\NewDocumentCommand{\Contributorid}{m}{
  		\prop_item:Nn \g_contributors_prop { #1-id }
 	}
	
	% Create a quick access LaTeX2e accessible command to contributor's institution
	\NewDocumentCommand{\ContributorInstitution}{m}{
  		\prop_item:Nn \g_contributors_prop { #1-institution }
 	}
	
	\NewDocumentCommand{\PrintContributorsList}{}{
		\begin{enumerate}
		\prop_map_inline:Nn \g_contributor_keys_prop {
			\item Key: ##1,\, Name: \ContributorName{##1}, id: \Contributorid{##1}, Institution: \ContributorInstitution{##1}
		}
		\end{enumerate}
	}
	
	\NewDocumentCommand{\GetAllContributorKeys}{m}{
        		\prop_map_inline:Nn \g_contributor_keys_prop {
           		#1
        		}
    	}
	
\ExplSyntaxOff


%% Author definition
\NewDocumentCommand{\CreateAuthor}{mmm}{
	\edef\AuthorName{#1}
	\edef\Authorid{#2}
	\edef\AuthorInstitution{#3}
	\CreateContributor{author}{#1}{#2}{#3}
}

% Start with the default author, the user needs to change it
\CreateAuthor{John Doe}{JD}{Institute of Magnificent Research}


%% Project name
\NewDocumentCommand{\SetProjectName}{m}{
	\edef\ProjectName{#1}
}

%% Format page
\pagestyle{fancy}
\fancyhf{}
\setlength\parindent{0in}
\setlength\parskip{0.1in}


%% Header / Footer 
\rhead{\textit{Last modified: \today}}
\chead{\textsc{\ProjectName~Logbook}}
\lhead{\textsc{\AuthorName}}
\rfoot{}
\cfoot{\color{gray} \textsc{\thepage~/~\pageref*{LastPage}}}
\lfoot{}

%% Institution Logo
\newcommand{\institutionlogo}[1]{%
	\begin{tikzpicture}[remember picture,overlay]
    		\node[anchor=north east,yshift=-2.0cm,xshift=-2cm]%
        			at (current page.north east)
        		{\ifthenelse{\equal{#1}{}}{\includegraphics[height=1.0cm]{example-image-a}}{\includegraphics[height=1.0cm]{#1}}};
	\end{tikzpicture}
}

%\let\stdsection\section
%\renewcommand\section{\newpage\stdsection}
\newcommand{\sectionbreak}{\clearpage}
%\renewcommand{\thesection}{\Roman{section}}
% \renewcommand{\thesubsection}{\thesection.\Roman{subsection}}

%%%%%%%%%%%%
% CAPTIONS %
%%%%%%%%%%%%

%%%% Paragraph separation
%\setlength{\parskip}{.5em}

\numberwithin{equation}{section} % Number equations within sections (i.e. 1.1, 1.2, 2.1, 2.2 instead of 1, 2, 3, 4)
\numberwithin{figure}{section} % Number figures within sections (i.e. 1.1, 1.2, 2.1, 2.2 instead of 1, 2, 3, 4)
\numberwithin{table}{section} % Number tables within sections (i.e. 1.1, 1.2, 2.1, 2.2 instead of 1, 2, 3, 4)

\newcommand{\gm}[1] {\guillemotleft #1\guillemotright} %$ pretty <<sth>>$

%%%%%%%%%%%%%%%%%
% MATH COMMANDS %
%%%%%%%%%%%%%%%%%
\DeclarePairedDelimiter\paren{(}{)}%
\DeclarePairedDelimiter\bra{[}{]}%
\DeclarePairedDelimiter\curly{\{}{\}}%
\DeclarePairedDelimiter\abs{\lvert}{\rvert}%
\DeclarePairedDelimiter\norm{\lVert}{\rVert}%
\DeclarePairedDelimiter\floor{\lfloor}{\rfloor}%
\DeclarePairedDelimiter\ceil{\lceil}{\rceil}%

\newcommand{\grad}{\nabla}
\newcommand{\deriv}[2]{\frac{d #1}{d #2}}
\newcommand{\bigO}{\mathcal{O}}
\DeclareMathSymbol{\umu}{\mathalpha}{operators}{0}


%%%%%%%%
% TikZ %
%%%%%%%%

\usetikzlibrary{shapes,arrows,fit,calc,positioning,automata,decorations.markings}

%%%%%%%%%%%%%%
% ALGORITHMS %
%%%%%%%%%%%%%%

% % Comment
% \renewcommand\algorithmiccomment[1]{%
%   \hfill\ \eqparbox{COMMENT}{#1}%
% }

% Multiline Comment
\newcommand\LONGCOMMENT[1]{%
  \hfill\ \begin{minipage}[t]{\eqboxwidth{COMMENT}}#1\strut\end{minipage}%
}
% Do while
\algdef{SE}[DOWHILE]{Do}{doWhile}{\algorithmicdo}[1]{\algorithmicwhile\ #1}%
\newcommand{\Break}{\State \textbf{break} }
\newcommand{\Yield}{\State \textbf{yield} }

% Go to
\algnewcommand{\algorithmicgoto}{\textbf{go to}}%
\algnewcommand{\Goto}{\algorithmicgoto\xspace}%
\algnewcommand{\Label}{\State\unskip}


%%%%%%%%%%%%
% LISTINGS %
%%%%%%%%%%%%

% Captioning
\AtBeginDocument{\numberwithin{lstlisting}{section}}  % Number listings within sections (i.e. 1.1, 1.2, 2.1, 2.2 instead of 1, 2, 3, 4)

% Colors
\definecolor{background}{gray}{.98}                 % Background color definition
\definecolor{comments}{RGB}{51,102,0}               % Comments   color definition
\definecolor{keywords}{RGB}{0,0,120}                % Keywords   color definition
\definecolor{keywords2}{RGB}{204,0,102}             % Keywords2  color definition
\definecolor{numbers}{RGB}{127, 0, 127}             % Keywords2  color definition
\definecolor{Maroon}{RGB}{128, 0, 0}

% General config
\lstset{
    frame=Ltb,
    framerule=0pt,
    aboveskip=0.5cm,
    framextopmargin=3pt,
    framexbottommargin=3pt,
    framexleftmargin=0.4cm,
    framesep=0pt,
    rulesep=.4pt,
    rulecolor=\color{black},
    %
    stringstyle=\ttfamily,
    basicstyle=\small\ttfamily,
    commentstyle=\itshape\color{comments},
    keywordstyle=\bfseries\color{keywords},
    %
    % numberstyle=\tiny,
    numberstyle=\small\ttfamily\color{gray},
    numbers=left,
    numbersep=8pt,
    numberfirstline = false,
    %
    breakatwhitespace=false,         % sets if automatic breaks should only happenat whitespace
    breaklines=true,                 % sets automatic line breaking
    captionpos=t,                    % sets the caption-position to bottom
    escapeinside={<@}{@>},            % if you want to add LaTeX within your code
    keepspaces=true,                 % keeps spaces in text, useful for keepingindentation of code (possibly needs columns=flexible)
    showspaces=false,                % show spaces everywhere adding particularunderscores; it overrides 'showstringspaces'
    showstringspaces=false,          % underline spaces within strings only
    showtabs=false,                  % show tabs within strings adding particularunderscores
    stepnumber=1,                    % the step between two line-numbers. If it's1, each line will be numbered
    tabsize=2,                       % sets default tabsize to 2 spaces
}

% PYTHON
\definecolor{pgreen}{rgb}{0,0.5,0}
\lstdefinestyle{Python}{
    language=Python,
    aboveskip=3mm,
    belowskip=3mm,
    numbers=left,
    numbersep=8pt,
    numberstyle=\small\ttfamily\color{gray},
    basicstyle={\small\ttfamily},
    commentstyle=\color{gray},
    showstringspaces=false,
    tabsize=4,
    showspaces=false,
    showtabs=false,
    breaklines=true,
    showstringspaces=false,
    breakatwhitespace=true,
    commentstyle=\color{pgreen},
    keywordstyle=\color[HTML]{A71D5D},
    stringstyle=\color[HTML]{0086B3},
    basicstyle=\ttfamily,
    upquote=true,
    moredelim=**[is][\btHL]{<|}{|>},%
    literate={*}{{\char42}}1
         {-}{{\char45}}1
         {^}{{\char94}}1
    % http://www.monperrus.net/martin/copy-pastable-ascii-characters-with-pdftex-pdflatex
}

% VHDL
\lstdefinestyle{customvhdl}{
    language=vhdl,                              % Language
    morekeywords = {},
    morestring=[b][\color{numbers}]',
    morestring=[b][\color{numbers}]",
    emph={std_logic,std_logic_vector,integer,unsigned,to_unsigned},
    emphstyle={\color{keywords2}\bfseries},%
    %deletekeywords={...},            % if you want to delete keywords from the given language
}

% Code highlight
\makeatletter
\newenvironment{btHighlight}[1][]
{\begingroup\tikzset{bt@Highlight@par/.style={#1}}\begin{lrbox}{\@tempboxa}}
{\end{lrbox}\bt@HL@box[bt@Highlight@par]{\@tempboxa}\endgroup}

\newcommand\btHL[1][]{%
  \begin{btHighlight}[#1]\bgroup\aftergroup\bt@HL@endenv%
}
\def\bt@HL@endenv{%
  \end{btHighlight}%
  \egroup
}
\newcommand{\bt@HL@box}[2][]{%
  \tikz[#1]{%
    \pgfpathrectangle{\pgfpoint{1pt}{0pt}}{\pgfpoint{\wd #2}{\ht #2}}%
    \pgfusepath{use as bounding box}%
    \node[anchor=base west, fill=orange!30,outer sep=0pt,inner xsep=1pt, inner ysep=0pt, rounded corners=3pt, minimum height=\ht\strutbox+1pt,#1]{\raisebox{1pt}{\strut}\strut\usebox{#2}};
  }%
}
\makeatother

%%%%%%%%%%%%%%%%%
% TODO COMMANDS %
%%%%%%%%%%%%%%%%%

\newcommand{\hightodo}[1]{\todo[inline,backgroundcolor=red!90!yellow!80!white]{\textbf{\userId}: #1}}
\newcommand{\lowtodo}[1]{\todo[inline,backgroundcolor=blue!30!white]{\textbf{\userId}: #1}}

\newtcolorbox{tip}{colback=blue!5!white,colframe=blue!75!black}
\newtcolorbox{tipt}[1]{colback=blue!5!white,colframe=blue!75!black,fonttitle=\bfseries,title=#1}

% Thick strike out
\newcommand{\soutthick}[1]{%
    \renewcommand{\ULthickness}{3pt}%
       \sout{#1}%
    \renewcommand{\ULthickness}{.4pt}% Resetting to ulem default
}
%%%%%%%%%%%%%%%%%%%
% VECTOR COMMANDS %
%%%%%%%%%%%%%%%%%%%

% \newcommand{\vx}{\bar{x}}
% \newcommand{\vv}{\bar{v}}
% \newcommand{\vw}{\bar{w}}
% \newcommand{\vu}{\bar{u}}
% \newcommand{\vy}{\bar{y}}
% \newcommand{\vt}{\bar{\theta}}

%%%%%%%%%%%%%%%%%%%%%%%%
% INDEPENDENCE SYMBOLS %
%%%%%%%%%%%%%%%%%%%%%%%%

% \makeatletter
% \newcommand*{\indep}{%
%   \mathbin{%
%     \mathpalette{\@indep}{}%
%   }%
% }
% \newcommand*{\nindep}{%
%   \mathbin{%                   % The final symbol is a binary math operator
%     \mathpalette{\@indep}{\not}% \mathpalette helps for the adaptation
%                                % of the symbol to the different math styles.
%   }%
% }
% \newcommand*{\@indep}[2]{%
%   % #1: math style
%   % #2: empty or \not
%   \sbox0{$#1\perp\m@th$}%        box 0 contains \perp symbol
%   \sbox2{$#1=$}%                 box 2 for the height of =
%   \sbox4{$#1\vcenter{}$}%        box 4 for the height of the math axis
%   \rlap{\copy0}%                 first \perp
%   \dimen@=\dimexpr\ht2-\ht4-.2pt\relax
%       % The equals symbol is centered around the math axis.
%       % The following equations are used to calculate the
%       % right shift of the second \perp:
%       % [1] ht(equals) - ht(math_axis) = line_width + 0.5 gap
%       % [2] right_shift(second_perp) = line_width + gap
%       % The line width is approximated by the default line width of 0.4pt
%   \kern\dimen@
%   {#2}%
%       % {\not} in case of \nindep;
%       % the braces convert the relational symbol \not to an ordinary
%       % math object without additional horizontal spacing.
%   \kern\dimen@
%   \copy0 %                       second \perp
% }
% \makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\normalsize}{\fontsize{9}{10}\selectfont}
