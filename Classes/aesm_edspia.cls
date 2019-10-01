%-------------------------- identification ---------------------
\ProvidesClass{Classes/aesm_edspia}
%-------------------------- initial code -----------------------

%Style BOOK:
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\ifx\pdfoutput\undefined
   \LoadClass[oneside, dvips, a4paper, 11pt]{Classes/book}
\else   \LoadClass[oneside, pdftex, a4paper, 11pt]{Classes/book}
\fi

%Packages � charger
\usepackage[utf8]{inputenc}
\usepackage{amssymb}
\usepackage{graphics}
\usepackage{fancyhdr} % en-tete et pieds de page
\usepackage{eucal}
\usepackage[usenames, dvipsnames]{xcolor}
\usepackage[numbers,sort&compress]{natbib}
\usepackage{hypernat}
\usepackage{ifpdf}
\usepackage{ifthen}
\usepackage{graphicx}
\RequirePackage{calc}
\RequirePackage{float}
\usepackage{tabularx} % in the preamble

%Redéfinition de l'environnement \part
\def\@part[#1]#2{
		 \refstepcounter{part}%
 	{
 	\hbox{\raisebox{0.2em}{\vrule depth 0pt height 3.5pt width 17cm}}
	\setlength{\baselineskip}{4pt}
 	\hbox{\raisebox{0.4em}{\vrule depth 0pt height 1pt width 17cm}}\setlength{\baselineskip}{10pt}~\\
	\parindent\z@ \raggedright
 	\ifnum \c@secnumdepth >\m@ne
 		\Large \bf \partname{} \thepart
 		\par \nobreak
 	\fi
 	\huge \bf #2 \markboth{}{} \par
 	}%
 	\nobreak
 	\vskip 3ex\@afterheading
 	\hbox{\raisebox{0.4em}{\vrule depth 0pt height 1pt width 17cm}}\setlength{\baselineskip}{10pt}~\\ 
}%

%Bibliographie
\renewcommand{\bibname}{Références Bibliographiques}

% Nomenclature
%\usepackage[eng]{nomencl}
%\makenomenclature

\newif \ifpdf
    \ifx \pdfoutput \undefined
        % for running latex
        \pdffalse
    \else
        % for running pdflatex
        \pdfoutput = 1    
                          
        \pdftrue
\fi
\ifpdf
\usepackage[pdftex, pdfauthor={David Lantiat}, plainpages = false,
								 pdfpagelabels= true, 
                 pdfpagelayout = SinglePage,
                 bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 pagebackref = true,
                 colorlinks = true,
                 linkcolor = blue,
                 urlcolor  = blue,
                 citecolor = blue,
                 anchorcolor = blue,
                 hyperindex = true,
                 hyperfootnotes=false,
                 hyperfigures
                 ]{hyperref} 

    \DeclareGraphicsExtensions{.png, .jpg, .pdf}
     \pdfcompresslevel=9
  \else
    \usepackage[ps4pdf,plainpages = false, pdfpagelabels, bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 pagebackref,
                 colorlinks = true,
                 linkcolor = blue,
                 urlcolor  = blue,
                 citecolor = magenta,
                 anchorcolor = green,
                 hyperindex = true,
                 hyperfigures
                 ]{hyperref}


    \DeclareGraphicsExtensions{.eps, .ps}
    \usepackage{epsfig}
    \usepackage{graphicx}
  \fi

%Parametres A4 
\ifpdf
   \pdfpageheight=297mm
   \pdfpagewidth=210mm
\else
   \setlength{\paperheight}{297mm} 
   \setlength{\paperwidth}{210mm} 
\fi

\setlength{\hoffset}{0.00cm}
\setlength{\voffset}{0.00cm}

\setlength{\evensidemargin}{0cm} 
\setlength{\oddsidemargin}{0mm} % 15 mm par def.  
\setlength{\topmargin}{1mm}
\setlength{\headheight}{0cm} % 1 cm par d�faut
\setlength{\headsep}{0.5cm}
\setlength{\textheight}{22.5cm}
\setlength{\textwidth}{17cm} % 16 cm par def.
\setlength{\marginparsep}{0cm} % 1mm par def.
\setlength{\marginparwidth}{0cm}
\setlength{\headheight}{\baselineskip} 
\setlength{\footskip}{2.36cm}

%En tete et pied de page
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]
{\markboth{\MakeUppercase{\chaptername~\thechapter. #1 }}{}}
\renewcommand{\sectionmark}[1]{\markright{\thechapter.\thesection~ #1}}
\fancyhf{}
\fancyhead[R]{\bfseries\rightmark}
\fancyfoot[R]{\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
\addtolength{\headheight}{0.5pt}
\fancypagestyle{plain}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
}

% DECLARATIONS

\def\degreedate#1{\gdef\@degreedate{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\collegeordept#1{\gdef\@collegeordept{#1}}
\def\university#1{\gdef\@university{#1}}
\def\crest#1{\gdef\@crest{#1}}


\newenvironment{alwayssingle}{%
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}

% Dedicace

\newenvironment{dedication}
{\begin{alwayssingle}
  \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE }
  \end{center}
  \vspace{0.5cm}
  \begin{quote} \begin{center}}
{\end{center} \end{quote} \end{alwayssingle}}


% Remerciements

\newenvironment{acknowledgements}
{\pagestyle{empty}
\begin{alwayssingle}
\begin{flushleft}
\vspace*{1.5cm}
{\Huge \bfseries Remerciements}
\end{flushleft}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

%R�sum�

\newenvironment{resume} {\begin{alwayssingle} \pagestyle{empty}
  \begin{flushleft}
  \vspace*{1.5cm}
  {\Large \bfseries  Résumé}
  \end{flushleft}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}


\newenvironment{abstracts} {\begin{alwayssingle} \pagestyle{empty}
  \begin{flushleft}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{flushleft}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}


\newenvironment{abstractslong} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm} \begin{quote}}
{\end{quote}\end{alwayssingle}}


\newcommand{\makethese}{
\addtolength{\hoffset}{-0.5cm}
\thispagestyle{empty}
\baselineskip=13pt
\vspace*{-4cm}

\begin{minipage}[t][0.12\textheight][t]{\textwidth}
    \begin{minipage}[c]{0.3\linewidth}
        \begin{center}
            Ministère de l’Enseignement Supérieur et de la Recherche Scientifique
        \end{center}
    \end{minipage}
    \begin{minipage}[c]{0.3\linewidth}
        \begin{center}
            \includegraphics[scale=1.1]{"./imgs/carthage-univ".png}
            \\
            Université de Carthage
        \end{center}
    \end{minipage}
    \begin{minipage}[c]{0.3\linewidth}
        \begin{center}
            \includegraphics[scale=0.75]{"./imgs/insat".png}
            \\
            Institut National des Sciences Appliquées et de Technologie
        \end{center}
    \end{minipage}
\end{minipage}

\begin{minipage}[t][1.02\textheight][t]{\textwidth}
    \begin{center}
    \vspace{52}
    {\large{\textbf{Rapport de Projet de Fin d’Etudes}}}
    \\[\baselineskip]
    
    {\large{Pour l’obtention du}}
    \\[\baselineskip]
    
    {\large{\textbf{Diplôme National d’Ingénieur}}}\\
    \vspace{5}
    {\large{\textbf{en Sciences Appliquées et en Technologie}}}
    \\[\baselineskip]
    \\[\baselineskip]
    \\[\baselineskip]
    {\large{Titre : Conception et mise en place de chaines d'intégration et livraison continues}}\\
    \vspace{5}
    {\large{et automatisation du processus de test de Benchmark}}
    \\[\baselineskip]
    \\[\baselineskip]
    \\[\baselineskip]
    \end{center}
    
    {\large{Organisme d’accueil: }}
    \begin{center}
        \includegraphics[scale=0.2]{"./imgs/logo-konvergence".png}
    \end{center}\\[\baselineskip]
    {\large{KONVERGENCE BUSINESS \& TECHNOLOGIES }}
    \\[\baselineskip]
    \\[\baselineskip]
    {\large{Soutenu le: date de soutenance }}
    
    \begin{flushleft}
        {\large{Auteur: Rafik BAHRI }}\\
        \vspace{5}
        {\large{INSAT, Génie Logiciel}}
        \\[\baselineskip]
        {\large{Tuteur professionnel: Mme. Valérie NOYER}}\\
        \vspace{5}
        {\large{Release Manager}}
        \\[\baselineskip]
        {\large{Tuteur académique: Mme. Ghada GASMI}}\\
        \vspace{5}
        {\large{Professeur universitaire}}
    \end{flushleft}
\end{minipage} 

\begin{minipage}[t][0.02\textheight][t]{\textwidth}
    {\large{\hspace*{\fill}Année Universitaire 2018/2019}}
\end{minipage}

}

\newcommand{\makesecondthese}{
\addtolength{\hoffset}{-0.5cm}
\thispagestyle{empty}
\baselineskip=13pt
\vspace*{-4cm}

\begin{minipage}[t][0.12\textheight][t]{\textwidth}
    \begin{minipage}[c]{0.3\linewidth}
        \begin{center}
            Ministère de l’Enseignement Supérieur et de la Recherche Scientifique
        \end{center}
    \end{minipage}
    \begin{minipage}[c]{0.3\linewidth}
        \begin{center}
            \includegraphics[scale=1.1]{"./imgs/carthage-univ".png}
            \\
            Université de Carthage
        \end{center}
    \end{minipage}
    \begin{minipage}[c]{0.3\linewidth}
        \begin{center}
            \includegraphics[scale=0.75]{"./imgs/insat".png}
            \\
            Institut National des Sciences Appliquées et de Technologie
        \end{center}
    \end{minipage}
\end{minipage}

\begin{minipage}[t][1.02\textheight][t]{\textwidth}
    \begin{center}
    \vspace{52}
    {\large{\textbf{Rapport de Projet de Fin d’Etudes}}}
    \\[\baselineskip]
    
    {\large{Pour l’obtention du}}
    \\[\baselineskip]
    
    {\large{\textbf{Diplôme National d’Ingénieur}}}\\
    \vspace{5}
    {\large{\textbf{en Sciences Appliquées et en Technologie}}}
    \\[\baselineskip]
    \\[\baselineskip]
    \\[\baselineskip]
     {\large{Titre : Conception et mise en place de chaines d'intégration et livraison continues}}\\
    \vspace{5}
    {\large{et automatisation du processus de test de Benchmark}}
    \\[\baselineskip]
    \\[\baselineskip]
    \\[\baselineskip]
    \end{center}
    
    \begin{flushleft}
        {\large{Auteur: Rafik BAHRI }}\\
        \vspace{5}
        {\large{INSAT, Génie Logiciel}}
        \\[\baselineskip]
        \\[\baselineskip]
    \end{flushleft}
    \begin{center}
        \def\arraystretch{1.5}%
        {\large{\textbf{AUTORISATIONS DE DEPOT}}}
        \\[\baselineskip]
        \begin{tabularx}{\textwidth}{|X|X|}
          \hline
          {\large{Tuteur professionnel: }}
          & 
          {\large{Tuteur académique:}} 
          \\
            {\large{Mme. Valérie NOYER}}
          &
            {\large{Mme. Ghada GASMI}}
          \\
          &
          \\
          {\large{Date ..../..../.......}}
          & 
          {\large{Date ..../..../.......}} 
          \\
          &
          \\[\baselineskip]
          &
          \\[\baselineskip]
          &
          \\
          \begin{center}
          {\large{Cachet \& Signature obligatoires}}
          \end{center}
          &
          \begin{center}
          {\large{Signature obligatoire}}
          \end{center}
          \\
          \hline
        \end{tabularx}
    \end{center}
\end{minipage} 

\begin{minipage}[t][0.02\textheight][t]{\textwidth}
    {\large{\hspace*{\fill}Année Universitaire 2018/2019}}
\end{minipage}

} 
 
% Auteurs
    
\newcommand{\AuteurA}[2]{%
\renewcommand{\PrenomA}{#1}%
\renewcommand{\NomA}{#2}%
}

\newcommand{\AuteurB}[2]{%
\renewcommand{\PrenomB}{#1}%
\renewcommand{\NomB}{#2}%
}

\newcommand{\AuteurC}[2]{%
\renewcommand{\PrenomC}{#1}%
\renewcommand{\NomC}{#2}%
}

\newcommand{\AuteurD}[2]{%
\renewcommand{\PrenomD}{#1}%
\renewcommand{\NomD}{#2}%
}

% Fili�re
\newcommand{\Filiere}[1]{
\renewcommand{\FILIERE}{#1}
}

% Date de soutenance
\newcommand{\datesout}[1]{%
\renewcommand{\DATE}{#1}%
}

% Ann�e Universitaire
\newcommand{\AnneeUniv}[1]{
\renewcommand{\ANNEEUNIV}{#1}
}



\newcommand{\Encadrant}[3]{
\renewcommand{\ENCt}{#1}
\renewcommand{\ENCn}{#2}
\renewcommand{\ENCp}{#3}
}

\newcommand{\EncadrantS}[3]{
\renewcommand{\ENCSt}{#1}
\renewcommand{\ENCSn}{#2}
\renewcommand{\ENCSp}{#3}
}

% Nom profession Qualite du president du jury
\newcommand{\President}[2]{%
\renewcommand{\PRESn}{#1}%
\renewcommand{\PRESp}{#2}%
}

% Nom Profession Qualit� de l'invit�
\newcommand{\Invite}[3]{%
\renewcommand{\INVAn}{#1}%
\renewcommand{\INVAp}{#2}%
\renewcommand{\INVAq}{#3}%
}

% Nom Profession Qualite d'un rapporteur A
\newcommand{\RapporteurA}[2]{%
\renewcommand{\RAPAn}{#1}%
\renewcommand{\RAPAp}{#2}%
}
% Nom Profession Qualite d'un rapporteur B
\newcommand{\RapporteurB}[3]{%
\renewcommand{\RAPBn}{#1}%
\renewcommand{\RAPBp}{#2}%
\renewcommand{\RAPBq}{#3}%
}

%Prenom Nom Qualite d'un examinateur A
\newcommand{\ExaminateurA}[3]{%
\renewcommand{\EXAAn}{#1}%
\renewcommand{\EXAAp}{#2}%
\renewcommand{\EXAAq}{#3}%
}
%Prenom Nom Qualite d'un examinateur B
\newcommand{\ExaminateurB}[3]{%
\renewcommand{\EXABn}{#1}%
\renewcommand{\EXABp}{#2}%
\renewcommand{\EXABq}{#3}%
}

%Prenom Nom Qualite d'un examinateur C
\newcommand{\ExaminateurC}[3]{%
\renewcommand{\EXACn}{#1}%
\renewcommand{\EXACp}{#2}%
\renewcommand{\EXACq}{#3}%
}


\newcommand{\alignquatriemedecouv}{
\newpage\thispagestyle{empty}~
\ifodd\value{page}
\newpage\thispagestyle{empty}
\else
\newpage\thispagestyle{empty}~\newpage\thispagestyle{empty}
\fi
}

\AtBeginDocument{%


\def\uppercase{}
}
\AtEndDocument{%
}


