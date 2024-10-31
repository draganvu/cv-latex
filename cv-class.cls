% cv-class.cv
%
% Author: Test Author
% URL: www.github.com/test
% License: MIT
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv-class}[2024/10/24 LaTeX class for CV]

% Base class on article class
\LoadClass{article}

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

% Page Layout
\geometry{
 left=2.5cm,
 top=2cm,
 right=2.5cm,
 bottom=2cm
}

% Colors
\definecolor{lightgrey}{rgb}{0.7, 0.7, 0.7}

% Sections settings
\titlespacing{\section}{0pt}{2ex}{2ex}

\titleformat{\section}
{\normalfont\Large\bfseries}
{}
{0em}
{}[{\color{lightgrey}\titlerule[0.4pt]}]

% Set line spacing
\setstretch{1.2}

% Remove paragraph indentation
\setlength{\parindent}{0pt}

% Itemize settings
\setlist{topsep=1ex, itemsep=.15ex}

% New commands
\newcommand*{\myname}[1]{\def\@myname{#1}}
\newcommand*{\printname}{\@myname}

\newcommand*{\myaddress}[1]{\def\@myaddress{#1}}
\newcommand*{\printaddress}{\@myaddress}

\newcommand*{\phonenum}[1]{\def\@phonenum{#1}}
\newcommand*{\printphonenum}{\@phonenum}

\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\printemail}{\@email}

\newcommand*{\website}[1]{\def\@website{#1}}
\newcommand*{\printwebsite}{\@website}

\newcommand*{\github}[1]{\def\@github{#1}}
\newcommand*{\printgithub}{\@github}

\newcommand{\makecvheader}{
  {\Huge \printname}
  
  \smallskip
  \printaddress \\
  Phone: \printphonenum \\
  Email: \printemail \\
  Website: \printwebsite \\
  Github: \printgithub
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

