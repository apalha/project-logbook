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
\RequirePackage{lmodern}
\RequirePackage{xparse}  % Required for advanced commands
\RequirePackage{titlesec}  % Fancy sections
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage[T1]{fontenc} % Use 8-bit encoding that has 256 glyphs
%\RequirePackage[utf8]{inputenc} % For Spanish characters
\RequirePackage[USenglish]{babel} % USEnglish localisation

% =========== General Formatting =============
\RequirePackage[a4paper, hmargin=2cm,vmargin=2.5cm, headheight=16pt]{geometry} % Margin sizes
%\RequirePackage{microtype} % Slightly tweak font spacing for aesthetics
\RequirePackage{fancyhdr} % Allows for nice header and footer
%\RequirePackage{sectsty} % Allows customizing section commands
\RequirePackage{appendix} % Enables appendices
%\RequirePackage{enumerate} % Custom numerate, useful for i,ii,iii... I,II,III...
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

% % =============== Bibliography ============
\RequirePackage[backend=bibtex8, abbreviate=false, isbn=false, url=false, doi=false, maxbibnames=99, citestyle=numeric-comp, sorting=nyt, defernumbers=true]{biblatex}

% Changes to  make bibliography style like elsevier's elsarticle
\renewcommand*{\multinamedelim}{\addcomma\space}
\renewcommand*{\finalnamedelim}{\addcomma\space}

\renewcommand*{\newunitpunct}{\addcomma\space}

\DeclareFieldFormat*{title}{#1}
\DeclareFieldFormat{journaltitle}{#1}

\renewbibmacro{in:}{%
  \ifentrytype{article}{%
  }{%
    \printtext{\bibstring{in}\intitlepunct}%
  }%
}

\renewbibmacro*{volume+number+eid}{%
  \printfield{volume}%
  \setunit*{\addnbspace}%
  \printfield{number}%
  \setunit{\addcomma\space}%
  \printfield{eid}}
\DeclareFieldFormat[article]{number}{\mkbibparens{#1}}

\renewcommand*{\bibpagespunct}{\addspace}

\DeclareFieldFormat{pages}{#1}

\renewbibmacro*{publisher+location+date}{%
  \printlist{publisher}%
  \setunit*{\addcomma\space}%
  \printlist{location}%
  \setunit*{\addcomma\space}%
  \usebibmacro{date}%
  \newunit}
  

% % =============== Listings ============
\RequirePackage{listings} % Main package for inserting code

% listlinebgrd needs this workaround because listings changed some internal workings
% see https://tex.stackexchange.com/questions/451532/recent-issues-with-lstlinebgrd-package-with-listings-after-the-latters-updates
\makeatletter
\let\old@lstKV@SwitchCases\lstKV@SwitchCases
\def\lstKV@SwitchCases#1#2#3{}
\makeatother

\RequirePackage{lstlinebgrd}

\makeatletter
\let\lstKV@SwitchCases\old@lstKV@SwitchCases

\lst@Key{numbers}{none}{%
    \def\lst@PlaceNumber{\lst@linebgrd}%
    \lstKV@SwitchCases{#1}%
    {none:\\%
     left:\def\lst@PlaceNumber{\llap{\normalfont
                \lst@numberstyle{\thelstnumber}\kern\lst@numbersep}\lst@linebgrd}\\%
     right:\def\lst@PlaceNumber{\rlap{\normalfont
                \kern\linewidth \kern\lst@numbersep
                \lst@numberstyle{\thelstnumber}}\lst@linebgrd}%
    }{\PackageError{Listings}{Numbers #1 unknown}\@ehc}}
\makeatother


% % =============== Algorithms ===============
\RequirePackage{algorithm} % Allows for algorithm description
\RequirePackage[noend]{algpseudocode}

% =============== Other ===============
\RequirePackage{datetime} % Date-Time formatting
\RequirePackage{ulem} % For strikethrough text \st{}
\setlength {\marginparwidth }{2cm}
\RequirePackage[colorinlistoftodos]{todonotes} % useful for leaving todonotes
\RequirePackage{textcomp} %Text Com­pan­ion fonts

\RequirePackage{pdfpages} % Insert pdfs
\RequirePackage{lipsum} % Used for inserting dummy 'Lorem ipsum' text into the template
% \usepackage[space]{grffile} % insert files with spaces
\RequirePackage{pdflscape} % Individual horizontal pages
\RequirePackage[most]{tcolorbox} % Color boxes for comment
%\usepackage{xargs} % Expanded arguments features
%\usepackage{fix-cm} % Computer-Modern at arbitrarysizes
%\usepackage{eurosym} % Eurosymbol

\usepackage{enumitem}

\RequirePackage[compatibility=false, font={small}]{caption} % For custom caption environments
\RequirePackage{subcaption}

%% ========================================================================
%% Set itemize, enumerate and description environments

% Set the left margins
\setlist[itemize]{leftmargin=1.0cm,labelindent=1.0cm}
\setlist[enumerate]{leftmargin=1.0cm,labelindent=1.0cm}
\setlist[description]{leftmargin=1.cm,labelindent=0.0cm}

% Set the bullet size
\renewcommand\labelitemi{\small$\bullet$}


%% ========================================================================
%% Set the section counters to have also subsubsubsection for an extra level of refinement

\titleclass{\subsubsubsection}{straight}[\subsection]

\newcounter{subsubsubsection}[subsubsection]
\renewcommand\thesubsubsubsection{\thesubsubsection.\arabic{subsubsubsection}}

\titleformat{\subsubsubsection}
  {\normalfont\normalsize\bfseries}{\thesubsubsubsection}{1em}{}
\titlespacing*{\subsubsubsection}
{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

\makeatletter
\def\toclevel@subsubsubsection{4}
\def\l@subsubsubsection{\@dottedtocline{4}{7em}{4em}}
\makeatother

\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}


%% ========================================================================
%% Author and Contributors information 

%% Contributors definition

% Contributors are any person that has contributed to the editing of the document. The maintainer is
% by default a contributor, with key maintainer.
%
% Contributors are stored in two properties list:
% 	\g_contributor_keys_prop
% 	\g_contributors_prop
%
% The first one stores the keys for each of the contributors, i.e., the internal name for each contributor that has
% been added.
%
% The second one contains the two-level property lists containing the name, id, and institution affiliation for each
% of the contributors. The way to associate these three attributes to each contributor is done by using the following 
% key format: 
%	<key>-name
%	<key>-id
%	<key>-institution
% To access the data for each of the  contributors, where <key> is the key of the contributor. Because of this format
% if we loop over this property list, we will get it in as a flat list. To circumvent this, we need the first property list containing
% only the keys. We can then loop over the property list containing the keys and use each key to access the attributes of
% each contributor.
\ExplSyntaxOn

	% Declare the contributors property
	\prop_new:N \g_contributors_prop
	\prop_new:N \g_contributor_keys_prop
	
	% Define the contributors property id for easy iteration
	\NewDocumentCommand{\CreateContributorKeys}{mm} {
  		\prop_gput:Nnn \g_contributor_keys_prop {#1}{#2}
 	}
	
	% Defines the command to add a contributor
	% Usage:
	%	\CreateContributor{key}{name}{id}{institution}
	\NewDocumentCommand{\CreateContributor}{mmmm} {
  		\prop_gput:Nnn \g_contributors_prop { #1-name } { #2 }
  		\prop_gput:Nnn \g_contributors_prop { #1-id } { #3 }
		\prop_gput:Nnn \g_contributors_prop { #1-institution } { #4 }
		\CreateContributorKeys{#1}{#1}
 	}

	% Creates a quick access LaTeX2e accessible command to contributor's name
	% associated to a key
	% Usage:
	%	\ContributorName{key}
	\NewDocumentCommand{\ContributorName}{m}{
 	 	\prop_item:Nn \g_contributors_prop {#1-name}
 	}
	
	% Creates a quick access LaTeX2e accessible command to contributor's id
	% associated to key
	% Usage:
	% 	\Controbutorid{key}
	\NewDocumentCommand{\Contributorid}{m}{
  		\prop_item:Nn \g_contributors_prop {#1-id}
 	}
	
	% Creates a quick access LaTeX2e accessible command to contributor's institution
	% associated to key
	% Usage:
	% 	\ControbutorInstitution{key}
	\NewDocumentCommand{\ContributorInstitution}{m}{
  		\prop_item:Nn \g_contributors_prop {#1-institution}
 	}
	
	% Creates an iterable function that allows looping over all contributors list.
	% This enables constructing blocks with all contributors with operations applied to them.
	% See \PrintContributorsList for an example
	\NewDocumentCommand{\GetAllContributorKeys}{m}{
        		\prop_map_inline:Nn \g_contributor_keys_prop {
           		#1
        		}
    	}
	
\ExplSyntaxOff

	% Toy function to print the information of all contributors as an itemized list
	% Usage:
	%	\PrintContributorsList
	\NewDocumentCommand{\PrintContributorsList}{}{
		\begin{enumerate}
			\GetAllContributorKeys{\item Key: ##1,\, Name: \ContributorName{##1}, id: \Contributorid{##1}, Institution: \ContributorInstitution{##1} }
		\end{enumerate}
	}


%% Maintainer definition
% Defines the maintainer, providing the same information as for a contributor. The maintainer is the one responsible for
% the document. By default a maintainer is a contributor and therefore, once the maintainer is created, a contributor
% with key maintainer is created, containing all the data of the maintainer.

% Creates a function to define the maintainer
% Note that no key is required to create the maintainer (as is needed for a contributor) because the
% maintainer will automatically be assigned the key maintainer.
% Usage:
%	\SetMaintainer{name}{id}{institution}
\NewDocumentCommand{\SetMaintainer}{mmm}{
	\edef\MaintainerName{#1}
	\edef\Maintainerid{#2}
	\edef\MaintainerInstitution{#3}
	\CreateContributor{maintainer}{#1}{#2}{#3}
}

% Start with the default author, the user needs to change it
\SetMaintainer{John Doe}{JD}{Institute of Magnificent Research}


%% ========================================================================
%% Project logbook cover: Project title, subtile, description, headers

%% Format page
\pagestyle{fancy}
\fancyhf{}
\setlength\parindent{0in}
\setlength\parskip{0.1in}

%% Header / Footer 
\rhead{\textit{Last modified: \today}}
\chead{\textsc{\ProjectHeaderName~Logbook}}
\lhead{\textsc{\MaintainerName}}
\rfoot{}
\cfoot{\color{gray} \textsc{\thepage~/~\pageref*{LastPage}}}
\lfoot{}

% We define the project name (a longer name) and a (shorter) name for the header, it is also possible
% to define a subtitle for the project

% Sets the name to appear in the header of the document
% Usage:
%	\SetProjectHeaderName{A short project name}
\NewDocumentCommand{\SetProjectHeaderName}{m}{
	\edef\ProjectHeaderName{#1}
}

% The default header name
\SetProjectHeaderName{The very fancy project}

% Sets the main tittle of the project
% Usage:
%	\SetProjectTitle{The longer name of the project containing more information}
\NewDocumentCommand{\SetProjectTitle}{m}{
	\edef\ProjectTitle{#1}
}
% The default title
\SetProjectTitle{The title of the project}

% Sets the subtitle of the project
% Usage:
% 	\SetProjectSubtittle{The subtitle of the project to appear below the title}
\NewDocumentCommand{\SetProjectSubtitle}{m}{
	\edef\ProjectSubtitle{#1}
}
% The default subtitle
\SetProjectSubtitle{The subtitle of the project}

%% Sets the institution's logo (typically associated to the maintainer)
% The logo should be a pdf or png file, the size of the logo is set by constraining the height of the
% logo to 1cm, this works well for horizontal logos but not so well for tall logos, need to look into this
% further
% Usage:
%	\SetInstitutionLogo{/a/path/to/a/figure}
\NewDocumentCommand{\SetInstitutionLogo}{m}{
	\edef\InstitutionLogo{#1}
}

% By default the logo is set to empty, which will result in an automatically generated LaTeX example figure. If you 
% wish to have no logo, use a white figure
\SetInstitutionLogo{}

% Helper function to add the institution logo, not to be used in the document, only for internal use in the class
% Actually uses the logo definition (the file path) and places the figure on the top corner of the page (the cover page)
% Usage:
%	\AddInstitutionLogo
\NewDocumentCommand{\AddInstitutionLogo}{}{%
	\begin{tikzpicture}[remember picture,overlay]
    		\node[anchor=north east,yshift=-2.0cm,xshift=-2cm]%
        			at (current page.north east)
        		{\ifthenelse{\equal{\InstitutionLogo}{}}{\includegraphics[height=1.5cm]{example-image-a}}{\includegraphics[height=1.5cm]{\InstitutionLogo}}};
	\end{tikzpicture}
}

% Helper function to add the project title to the cover page
% Usage:
%	\AddProjectTitle
\NewDocumentCommand{\AddProjectTitle}{}{
	\begin{minipage}[t][9cm][t]{\textwidth}
		\vspace{6cm}
		\begin{center}
			{\Huge\textbf{\ProjectTitle}} 
			\\ \vspace{0.5cm}
			{\large{\textbf{\ProjectSubtitle}}}
		\end{center}
	\end{minipage}
}

% Set the project summary to appear on the front page
% Usage:
% 	\SetProjectSummary{The summary of the project should briefly describe the project in.a couple of lines, not more.}
\NewDocumentCommand{\SetProjectSummary}{m}{
		\edef\ProjectSummary{#1} 
}

% By default add gibberish
\SetProjectSummary{Your summary of the project should go here, briefly describe it, without spending more than two lines on it.}

% Helper function to add the project summary to the cover page
% Usage:
%	\AddSummary
\NewDocumentCommand{\AddSummary}{}{
	\begin{minipage}[t]{\textwidth}
		\textit{N.B.: \ProjectSummary} 
		\newline
		\vspace{2.5cm}
	\end{minipage}
}

% Helper function to add the information of the maintainer to the cover page
% Usage:
%	\AddMaintainer
\NewDocumentCommand{\AddMaintainer}{}{
	\begin{minipage}[t][1.5cm][t]{\textwidth}
		\noindent Maintainer: \newline
		\hspace*{1.0cm}
		\begin{tabular}{lll}
			\!\!\MaintainerName & (\textit{\Maintainerid}), & \MaintainerInstitution
		\end{tabular}
	\end{minipage}
}

% Helper function to add the information of all the contributors to the cover page
% Usage:
%	\AddContributorsList
\ExplSyntaxOn
\NewDocumentCommand{\AddContributorsList}{}{
	\begin{minipage}[t]{\textwidth}
		\noindent Contributors: \newline
	\end{minipage}
	\vskip-.5cm
	\begin{minipage}[t]{\textwidth}
		\hspace*{1.0cm} 
		\begin{tabular}{lll}
			\prop_map_inline:Nn \g_contributor_keys_prop {
           			\ContributorName{##1} & (\textit{\Contributorid{##1}}), & \ContributorInstitution{##1} \\
       			}
		\end{tabular}
	\end{minipage}
}
\ExplSyntaxOff


% Creates the front page. Adds the logo, title, subtitle, maintainer info, contributors info, and summary to the 
% cover page and then add the table of contents right after it
% Usage:
%	\MakeFrontPage
\NewDocumentCommand{\MakeFrontPage}{}{
	\AddInstitutionLogo
	\AddProjectTitle
	\newline
	\AddSummary
	\newline
	\AddMaintainer
	\newline
	\AddContributorsList
	\tableofcontents  % also add the table of contents
}


%% Section formating
% Add a new page for every new section
\newcommand{\sectionbreak}{\clearpage}


%% Add TODO list
% todolist appears as a section, therefore forces a page break, this command temporarily removes the page break at sections
% adds the todolist and then adds again the page break at sections
\newcommand{\AddListOfTodos}{
	\renewcommand{\sectionbreak}{}
	\listoftodos
	\renewcommand{\sectionbreak}{\clearpage}
}


%% Referencing commands
\newcommand{\secref}[1]{Section~\ref{#1}}
\newcommand{\figref}[1]{Figure~\ref{#1}}
\newcommand{\tabref}[1]{Table~\ref{#1}}
\newcommand{\lstref}[1]{Listing~\ref{#1}}

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
    breakatwhitespace=false,         % sets if automatic breaks should only happen at whitespace
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

% MATLAB
\definecolor{matlabGreen}{RGB}{28,172,0} % color values Red, Green, Blue
\definecolor{matlabLilas}{RGB}{170,55,241}

\lstdefinestyle{Matlab}{%
    %basicstyle=\color{red},
    language=Matlab,
    aboveskip=3mm,
    belowskip=3mm,
    numbers=left,
    numbersep=8pt,
    numberstyle=\small\ttfamily\color{gray},
    commentstyle=\color{matlabGreen},%
    showstringspaces=false,%without this there will be a symbol in the places where there is a space
    tabsize=4,
    showspaces=false,
    showtabs=false,
    breaklines=true,%
    showstringspaces=false,
    breakatwhitespace=true,
    basicstyle=\ttfamily,
    keywordstyle=\color{blue},%
    stringstyle=\color{matlabLilas},
    morekeywords=[2]{1}, keywordstyle=[2]{\color{black}},
    identifierstyle=\color{black},%
    emph=[1]{for,end,break},emphstyle=[1]\color{red} %some words to emphasise
    %%% Put standard MATLAB functions not included in the default
    %%% language here
    morekeywords={xlim,ylim,var,alpha,factorial,poissrnd,normpdf,normcdf},
    %
    %%% Put MATLAB function parameters here
    morekeywords=[2]{on, off, interp, ...},
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


%% ========================================================================
%% Colorboxes

%% Meeting minutes 
\newtcolorbox{MeetingColorBox}[1]{breakable, enhanced, colback=white,colframe=black,fonttitle=\bfseries,title=#1}
\colorlet{MeetingMinutesColorBoxBackgroundColorOdd}{white}
\colorlet{MeetingMinutesColorBoxBackgroundColorEven}{white!90!black}

\xdef\MeetingMinutesColorBoxIsEven{false}

\NewDocumentCommand{\MeetingMinutesColorBoxAlternate}{}{
	\ifthenelse{\equal{\MeetingMinutesColorBoxIsEven}{true}}{
		\xdef\MeetingMinutesColorBoxIsEven{false} % switch to odd for next meeting minutes box
	}
	{
		\xdef\MeetingMinutesColorBoxIsEven{true} % switch to even for next meeting minutes box
	}
}
\newenvironment{MeetingMinutes}[2]
{
	\ifthenelse{\equal{\MeetingMinutesColorBoxIsEven}{true}}{
		\begin{tcolorbox}[breakable, enhanced, colback=MeetingMinutesColorBoxBackgroundColorEven,colframe=black,fonttitle=\bfseries, title=#1: \Contributorid{#2}]
		\setlength\parskip{0.2cm}
	}
	{
		\begin{tcolorbox}[breakable, enhanced, colback=MeetingMinutesColorBoxBackgroundColorOdd,colframe=black,fonttitle=\bfseries, title=#1: \Contributorid{#2}]
		\setlength\parskip{0.2cm}
	}	
}
{
	\end{tcolorbox}
	\vspace*{0.5cm}
	\MeetingMinutesColorBoxAlternate
}


%% Highlighted remarks/notes
% Highlighted remark/note with and without title
\newenvironment{HighlightedNote}[1]
{
	\ifthenelse{\equal{#1}{}}{
		\begin{tcolorbox}[breakable, enhanced, colback=yellow!15!white,colframe=yellow!20!black]
		\setlength\parskip{0.2cm}
	}
	{
		\begin{tcolorbox}[breakable, enhanced, colback=yellow!15!white,colframe=yellow!20!black, fonttitle=\bfseries, title=#1]
		\setlength\parskip{0.2cm}
	}	
}
{
	\end{tcolorbox}
}
\newtcolorbox{tip}{colback=blue!5!white,colframe=blue!75!black}
\newtcolorbox{tipt}[1]{colback=blue!5!white,colframe=blue!75!black,fonttitle=\bfseries,title=#1}


%% ========================================================================
%% TODO commands
\newcommand{\hightodo}[3]{\todo[inline,backgroundcolor=red!90!yellow!40!white]{\textbf{#1}, \textbf{\Contributorid{#2}}: #3}}
\newcommand{\lowtodo}[3]{\todo[inline,backgroundcolor=blue!20!white]{\textbf{#1}, \textbf{\Contributorid{#2}}: #3}}


% Set something to done
\newcommand{\isdone}[1]{%
	{\color{Green} #1}	
}


% Thick strike out
\newcommand{\soutthick}[1]{%
    \renewcommand{\ULthickness}{3pt}%
       \sout{#1}%
    \renewcommand{\ULthickness}{.4pt}% Resetting to ulem default
}

\renewcommand{\normalsize}{\fontsize{10}{11}\selectfont}
