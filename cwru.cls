% This is a very early CWRU thesis/dissertation class file.
%
% Copyright Gregory Lee 2012
% This may be used by any CWRU students (or anyone else) free of charge.
% This file is provided without warrany of MERCHANTABILITY of FITNESS FOR A PARTICULAR PURPOSE.

% Incomplete:
% Committee Approval Sheet
% Copyright Sheet

\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{metadata/cwru}[2012/04/17 v0.1 Case Western Reserve University Thesis Class]

\LoadClass[12pt]{article}[2007/10/19]

\RequirePackage{graphicx}
%\RequirePackage{hyperref}
\RequirePackage{fixltx2e}
\RequirePackage{titling}

\newif\if@advisor
\@advisorfalse
\newif\if@lof
\newif\if@lot
\newif\if@copy
\newif\if@dedication
\@dedicationfalse
\newif\if@preface
\@prefacefalse
\newif\if@ack
\@ackfalse
\newif\if@loa
\@loafalse
\newif\if@glossary
\@glossaryfalse

\DeclareOption{phd}{%
  \def\@degree{Doctor of Philosophy}%
  \def\@document{Dissertation}%
}
\DeclareOption{ms}{%
  \def\@degree{Master of Science}%
  \def\@document{Thesis}%
}
\DeclareOption{copyright}{\@copytrue}
\DeclareOption{nocopyright}{\@copyfalse}
\DeclareOption{lot}{\@lottrue}
\DeclareOption{nolot}{\@lotfalse}
\DeclareOption{lof}{\@loftrue}
\DeclareOption{nolof}{\@loffalse}

\ExecuteOptions{ms,nolof,nolot,nocopyright}

\ProcessOptions\relax

\input{metadata/fmt} % Formatting options

% Alter some LaTeX defaults for better treatment of figures:
% See p.105 of "TeX Unbound" for suggested values.
% See pp. 199-200 of Lamport's "LaTeX" book for details.
% General parameters, for ALL pages:
\renewcommand{\topfraction}{0.95}	% max fraction of floats at top
\renewcommand{\bottomfraction}{0.85}	% max fraction of floats at bottom
% Parameters for TEXT pages (not float pages):
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{4}     % 2 may work better
\setcounter{dbltopnumber}{2}    % for 2-column pages
\renewcommand{\dbltopfraction}{0.9}	% fit big float above 2-col.  text
\renewcommand{\textfraction}{0.07}	% allow minimal text w.  figs
% Parameters for FLOAT pages (not text pages):
\renewcommand{\floatpagefraction}{0.8}	% require fuller float pages
% N.B.: floatpagefraction MUST be less than topfraction !!
\renewcommand{\dblfloatpagefraction}{0.8}	% require fuller float pages

\hyphenpenalty=5000
\tolerance=1000

\def\@chair{TBD}
\DeclareRobustCommand{\CWRUadvisor}[1]{
  \@advisortrue
  \def\@advisor{\@document{} Advisor: \textnormal{#1}}
  \def\@chair{#1}
}

\newcommand{\committeeOne}[0]{TBD}
\DeclareRobustCommand{\CWRUCommitteeOne}[1]{\renewcommand{\committeeOne}[1]{#1}}

\newcommand{\committeeTwo}[0]{TBD}
\DeclareRobustCommand{\CWRUCommitteeTwo}[1]{\renewcommand{\committeeTwo}[1]{#1}}

\def\@department{Department of the Unnamed}
\DeclareRobustCommand{\CWRUdepartment}[1]{\def\@department{Department of #1}}

\def\@graduationdate{TBD}
\DeclareRobustCommand{\CWRUgraduationdate}[1]{\def\@graduationdate{#1}}

\def\@defensedate{TBD}
\DeclareRobustCommand{\CWRUdefensedate}[1]{\def\@defensedate{#1}}

% Customize the degree name and the document type text
\DeclareRobustCommand{\CWRUdegreename}[1]{\def\@degree{#1}}
\DeclareRobustCommand{\CWRUdocumentname}[1]{\def\@document{#1}}

\long\def\@CWRUtitle{%
\begin{titlepage}
  \vspace*{2em}
  \centering
  \begin{minipage}[c]{4.0in}
    \begin{center}
      {\large{\MakeUppercase{\@title}} \par}%
      \vspace{5em}
      {by \par}%
      % \vspace{1em}
      {\large{\MakeUppercase{\@author}} \par}%
      \vspace{5em}
      {Submitted in partial fulfillment of the requirements for the degree of \@degree{} \par}%
      \vspace{4em}
      \if@advisor
        {\@advisor \par}%
      \else
        \vspace{\baselineskip}
      \fi
      \vspace{5em}
      {\@department \par}%
      \vspace{1em}
      {\MakeUppercase{CASE WESTERN RESERVE UNIVERSITY}\par}%
      \vspace{4em}
      {\@graduationdate \par}%
    \end{center}
  \end{minipage}%
\end{titlepage}
\newpage
}

\DeclareRobustCommand{\CWRUpreamble}{%
  \@CWRUtitle
  \@CWRUcommittee
  \if@copy
  \@CWRUcopy
  \fi
  \if@dedication
  \@CWRUdedication
  \fi
  \pagenumbering{roman}
  \@CWRUtoc
  \if@lof
  \@CWRUlof
  \fi
  \if@lot
  \@CWRUlot
  \fi
  \if@preface
  \@CWRUpreface
  \fi
  \if@ack
  \@CWRUack
  \fi
%  \if@loa
%  \@CWRUloa
%  \fi
%  \if@glossary
%  \@CWRUglossary
%  \fi
  \printglossaries
  \pagebreak
  \@CWRUabstract
  \pagenumbering{arabic}
}

\def\@preambledivs{section}
\newenvironment{CWRU@page}[1]{%
  \phantomsection%
  \addcontentsline{toc}{\@preambledivs}{#1}%
}{%
  \clearpage
}

\def\@CWRUcommittee{%
%  \section*{Committee Approval Sheet}
  \begin{center}
    {\large{\textbf{\uppercase{Case Western Reserve University\\
            School of Graduate Studies}}} \par}%
  \end{center}
  \vspace{3em}
  \begin{center}
    \begin{minipage}{5.0in}
      {\noindent We hereby approve the \MakeLowercase{\@degree} of \par}
      \vspace{2em}
      \centering{\large{\@author}}\par
      \vspace{0.5em}
      \hrule
      \vspace{2em}
      \centering{\large{\@degree}}\par%
      \vspace{-1em}
      {\noindent candidate for the \hrulefill{} degree*. \par}
    \end{minipage}
  \end{center}

    \begin{center}
        \begin{minipage}{3in}
            \vspace{6em}
            \leftline{Examining Committee:\hfil}
            \vskip 28pt \vfil 

            \leftline{Francis Merat\hfil}
            \vskip 1pt \hrule width 2.8in \hfil \vskip -3pt
            \leftline{Committee Chair\hfil} 
            \vskip 10pt

            \leftline{\committeeOne \hfil}
            \vskip 1pt \vfil\hrule width 2.8in\hfil\vskip -3pt
            \leftline{Committee Member\hfil} 
            \vskip 10pt

            \leftline{\committeeTwo \hfil}
            \vskip 1pt\vfil\hrule width 2.8in\hfil\vskip -3pt
            \leftline{Committee Member\hfil}

            \vspace{3em}
            \leftline{Defense Date: \@defensedate \hfil}
        \end{minipage}
    \end{center}

  \vfill
  {\noindent *We also certify that written approval has been obtained for any proprietary material contained herein. \par}%
  \phantomsection%
  \clearpage
}

\def\@CWRUcopy{%
  \section*{Copyright}
  \phantomsection%
  This will be the copyright page.
  \clearpage
}

\DeclareRobustCommand{\CWRUdedication}[1]{%
  \@dedicationtrue
  \long\def\@CWRUdedicationtext{#1}
}

\def\@CWRUdedication{%
  \section*{Dedication}%
  \phantomsection
  \@CWRUdedicationtext
  \clearpage
}

\renewcommand{\contentsname}{Table of Contents}
\def\@CWRUtoc{%
  \begin{CWRU@page}{\contentsname}
  \tableofcontents
  \end{CWRU@page}
}

\def\@CWRUlof{%
  \phantomsection
  \addcontentsline{toc}{section}{\listfigurename}
  \listoffigures
  %\clearpage
}

\def\@CWRUlot{%
  \phantomsection
  \addcontentsline{toc}{section}{\listtablename}
  \listoftables
  \clearpage
}

\DeclareRobustCommand{\CWRUpreface}[1]{%
  \@prefacetrue
  \long\def\@CWRUprefacetext{#1}
}

\def\@CWRUpreface{%
  \section*{Preface}%
  \begin{CWRU@page}{Preface}
    \@CWRUprefacetext
  \end{CWRU@page}
}

\DeclareRobustCommand{\CWRUack}[1]{%
  \@acktrue
  \long\def\@CWRUacktext{#1}
}

\def\@CWRUack{%
  \section*{Acknowledgments}%
  \begin{CWRU@page}{Acknowledgments}
    \@CWRUacktext
  \end{CWRU@page}
}

\DeclareRobustCommand{\CWRUloa}[1]{%
  \@loatrue
  \long\def\@CWRUloatext{#1}
}

\newcommand\loaname{List of Abbreviations}

\def\@CWRUloa{%
  \section*{\loaname}
  \begin{CWRU@page}{\loaname}
    \@CWRUloatext
  \end{CWRU@page}
}

\DeclareRobustCommand{\CWRUglossary}[1]{%
  \@glossarytrue
  \long\def\@CWRUglossarytext{#1}
}

\def\@CWRUglossary{%
  \section*{Glossary}%
  \begin{CWRU@page}{Glossary}
    \@CWRUglossarytext
  \end{CWRU@page}
}

\long\def\@CWRUabstracttext{}
\DeclareRobustCommand{\CWRUabstract}[1]{%
  \long\def\@CWRUabstracttext{#1}
}

\def\@CWRUabstract{%
\date{}
\author{\MakeUppercase{\authorText}}
\posttitle{\par\end{center}}
\setlength{\droptitle}{-5em}
\maketitle
\vspace{-5em}
  \section*{Abstract}%
  \begin{CWRU@page}{Abstract}
    \@CWRUabstracttext
  \end{CWRU@page}
}

\renewcommand\appendix{\par
  \setcounter{part}{0}%
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \clearpage%
  \gdef\thesection{\@Alph\c@section}
  \gdef\thepart{}
  \renewcommand\partname{}
}

%\renewcommand{\baselinestretch}{2}
\linespread{1.6}


