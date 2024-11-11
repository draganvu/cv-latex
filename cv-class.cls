%% `cv-class.cv' - Personal LaTeX class template for CV
%
% Author: Dragan Vujović <dvujovic@protonmail.ch> 
% URL: https://github.com/draganvu/cv-latex
% License: MIT
%

% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv-class}[2024/10/24 LaTeX class for CV]

% 
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Inherit commands from the standard `article' class
\LoadClass[a4paper]{article}

%% 3rd party Packages
% Required for language support 
\RequirePackage[USenglish]{babel}
% Required to set page margins
\RequirePackage{geometry}
% Required to customize line spacing
\RequirePackage{setspace}
% Required to customize sections
\RequirePackage{titlesec}
% Required for colors
\RequirePackage{xcolor}
% Required for hyperlinks and pdf metadata
\RequirePackage{hyperref}
% Required to customize itemize
\RequirePackage{enumitem}
% Required for if/then/else
\RequirePackage{ifthen}

% Page Layout
\geometry{
 left=2.5cm,
 top=2cm,
 right=2.5cm,
 bottom=2cm
}

\hypersetup{
  colorlinks=true,
  linkcolor=red,
  urlcolor=blue
}

% Colors
\definecolor{lightgrey}{rgb}{0.7, 0.7, 0.7}

% Sections settings
\titlespacing{\section}{0pt}{2ex}{2ex}

\titleformat{\section}
{\normalfont\Large\bfseries}{}{0em}{}[{\color{lightgrey}\titlerule[0.4pt]}]

% Set line spacing
\setstretch{1.2}

% Remove paragraph indentation
\setlength{\parindent}{0em}

% Itemize settings
\setlist{topsep=.5ex, itemsep=0ex, partopsep=1ex}

% New commands
\newcommand*{\myname}[1]{\def\@myname{#1}}

\newcommand*{\myaddress}[1]{\def\@myaddress{#1}}

\newcommand*{\phone}[2]{\def\@phonelabel{#1}\def\@phonenum{#2}}

\newcommand*{\email}[2]{\def\@emaillabel{#1}\def\@emailaddress{#2}}

\newcommand*{\weburl}[2]{\def\@weburllabel{#1}\def\@weburladdress{#2}}

\newcommand*{\github}[2]{\def\@githublabel{#1}\def\@githubaddress{#2}}

\newcommand*{\https}{https://}
\newcommand*{\printname}{\@myname}
\newcommand*{\printaddress}{\@myaddress}

\newcommand*{\printphonenum}{\@phonelabel\ \@phonenum}

\newcommand*{\printemail}{%
  \ifthenelse{\isundefined{\@emaillabel}}
  {\href{mailto:\@emailaddress}{\@emailaddress}\par}
  {\@emaillabel\ \href{mailto:\@emailaddress}{\@emailaddress}\par}
}

\newcommand*{\printurl}{%
  \ifthenelse{\isundefined{\@weburladdress}}{}{%
    \ifthenelse{\isundefined{\@weburllabel} \or \equal{\@weburllabel}{}}%
    {\href{\https\@weburladdress}{\@weburladdress}\par}%
    {\@weburllabel\ \href{\https\@weburladdress}{\@weburladdress}\par}%
  }%
}

\newcommand*{\printgithub}{%
  \ifthenelse{\isundefined{\@githubaddress}}{}{%
    \ifthenelse{\isundefined{\@githublabel} \or \equal{\@githublabel}{}}%
    {\href{\https\@githubaddress}{\@githubaddress}\par}%
    {\@githublabel\ \href{\https\@githubaddress}{\@githubaddress}\par}%
  }%
}

\newcommand{\makecvheader}{
  {\Huge \printname}
  
  \smallskip
  \printaddress \\
  \printphonenum \\
  \printemail
  \printurl
  \printgithub
}

\newcommand{\jobheader}[4]{%
  \textbf{#1} \hfill {#2} \\
  {#3} \hfill \textit{#4} \par
}

\newcommand{\educationheader}[4]{%
  \textbf{#1} \hfill {#3} \\
  {#2} \hfill \textit{#4} \par
}

\newcommand{\jobitem}[1]{%
  \begin{itemize}
    #1
  \end{itemize}
}

\newcommand{\skills}[1]{%
  \begin{tabular}{@{}l@{\hspace{1.5ex}}l}
    #1
  \end{tabular}
}

\newcommand{\skillitem}[2]{%
  \textbf{#1} & #2 \\
}

% PDF Metadata
\AtBeginDocument{
  \hypersetup{
    pdfauthor   = {\@myname},
    pdfkeywords = {Software engineering, Curriculum Vitae, Resume},
    pdftitle    = {\@myname: Curriculum Vitae},
    pdfsubject  = {Curriculum Vitae}
  }
}

