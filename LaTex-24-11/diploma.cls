%%

\def\fileversion{5.02}
\def\filedate{2021/04/22}
\def\docdate{22. dubna 2021}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{diploma}[\filedate\space \fileversion\space diploma LaTeX document class]
\RequirePackage{ifthen}
\RequirePackage[utf8]{inputenc}
\newcommand{\Dipl@BachelorThesis}{0}
\newcommand{\Dipl@BachelorPractice}{1}
\newcommand{\Dipl@MasterThesis}{2}
\newcommand{\Dipl@PhDThesis}{3}
\newcommand{\Dipl@CzechLanguage}{0}
\newcommand{\Dipl@EnglishLanguage}{1}
\newcommand{\Dipl@SlovakLanguage}{2}
\newtoks\Dipl@ThesisAuthor
\Dipl@ThesisAuthor={No author name is given}
\newtoks\Dipl@ThesisSupervisor
\Dipl@ThesisSupervisor={No supervisor name is given}
\newtoks\Dipl@CzechThesisTitle
\Dipl@CzechThesisTitle={No Czech or Slovak thesis title is given}
\newtoks\Dipl@EnglishThesisTitle
\Dipl@EnglishThesisTitle={No English thesis title is given}
\newtoks\Dipl@SubmissionYear
\Dipl@SubmissionYear={}
\newtoks\Dipl@Acknowledgement
\Dipl@Acknowledgement={}
\newtoks\Dipl@CzechAbstract
\Dipl@CzechAbstract={No Czech or Slovak abstract is given}
\newtoks\Dipl@CzechKeywords
\Dipl@CzechKeywords={No Czech or Slovak keywords are given}
\newtoks\Dipl@EnglishAbstract
\Dipl@EnglishAbstract={No English abstract is given}
\newtoks\Dipl@EnglishKeywords
\Dipl@EnglishKeywords={No English keywords are given}
\newtoks\Dipl@Acronyms
\Dipl@Acronyms={}
\newtoks\Dipl@BabelLanguageOptions
\newtoks\Dipl@ThesisCaption
\newtoks\Dipl@SupervisorCaption
\newtoks\Dipl@FacultyLogoFileName
\newtoks\Dipl@CzechAbstractCaption
\Dipl@CzechAbstractCaption={Abstrakt}
\newtoks\Dipl@EnglishAbstractCaption
\Dipl@EnglishAbstractCaption={Abstract}
\newcounter{Dipl@CurrentThesisType}
\setcounter{Dipl@CurrentThesisType}{\Dipl@MasterThesis}
\newcounter{Dipl@CurrentThesisLanguage}
\setcounter{Dipl@CurrentThesisLanguage}{\Dipl@CzechLanguage}
\LoadClass[11pt,openany]{book}
\RequirePackage[T1]{fontenc}
\RequirePackage{palatino}
\RequirePackage[a4paper]{geometry}
\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage{longtable}
\RequirePackage{caption}
\RequirePackage{rotating}
\RequirePackage{setspace}
\RequirePackage{theorem}
\RequirePackage{titlesec}
\RequirePackage[nottoc,notindex,chapter]{tocbibind}
\RequirePackage{xcolor}
\RequirePackage[a-1b]{pdfx}



\DeclareOption{czech}
{
\setcounter{Dipl@CurrentThesisLanguage}{\Dipl@CzechLanguage}
\Dipl@BabelLanguageOptions={english,main=czech}
\Dipl@SupervisorCaption={Vedouc?? pr??ce}
\Dipl@FacultyLogoFileName={Figures/FEI_CZ.pdf}
}
\DeclareOption{english}
{
\setcounter{Dipl@CurrentThesisLanguage}{\Dipl@EnglishLanguage}
\Dipl@BabelLanguageOptions{czech,main=english}
\Dipl@SupervisorCaption={Supervisor}
\Dipl@FacultyLogoFileName={Figures/FEI_EN.pdf}
}
\DeclareOption{slovak}
{
\setcounter{Dipl@CurrentThesisLanguage}{\Dipl@SlovakLanguage}
\Dipl@BabelLanguageOptions={english,main=slovak}
\Dipl@SupervisorCaption={Vedouc?? pr??ce}
\Dipl@FacultyLogoFileName={Figures/FEI_CZ.pdf}
}
\DeclareOption{bachelor}
{
\setcounter{Dipl@CurrentThesisType}{\Dipl@BachelorThesis}
\ifthenelse{\value{Dipl@CurrentThesisLanguage}=\Dipl@EnglishLanguage}
{
\Dipl@ThesisCaption={Bachelor Thesis}
}
{
\Dipl@ThesisCaption={Bakal????sk?? pr??ce}
}
}
\DeclareOption{bachelorpractice}
{
\setcounter{Dipl@CurrentThesisType}{\Dipl@BachelorPractice}
\Dipl@CzechThesisTitle={Absolvov??n?? individu??ln?? odborn?? praxe}
\Dipl@EnglishThesisTitle={Individual Professional Practice in the Company}
\ifthenelse{\value{Dipl@CurrentThesisLanguage}=\Dipl@EnglishLanguage}
{
\Dipl@ThesisCaption={Bachelor Thesis}
}
{
\Dipl@ThesisCaption={Bakal????sk?? pr??ce}
}
}
\DeclareOption{master}
{
\setcounter{Dipl@CurrentThesisType}{\Dipl@MasterThesis}
\ifthenelse{\value{Dipl@CurrentThesisLanguage}=\Dipl@EnglishLanguage}
{
\Dipl@ThesisCaption={Diploma Thesis}
}
{
\Dipl@ThesisCaption={Diplomov?? pr??ce}
}
}
\DeclareOption{phd}
{
\setcounter{Dipl@CurrentThesisType}{\Dipl@PhDThesis}
\ifthenelse{\value{Dipl@CurrentThesisLanguage}=\Dipl@SlovakLanguage}
{
\Dipl@CzechAbstractCaption={Abstrakt a pr??nos pr??ce}
}
{
\Dipl@CzechAbstractCaption={Abstrakt a p????nos pr??ce}
}
\Dipl@EnglishAbstractCaption={Abstract and Contributions}
\ifthenelse{\value{Dipl@CurrentThesisLanguage}=\Dipl@EnglishLanguage}
{
\Dipl@ThesisCaption={PhD Thesis}
}
{
\Dipl@ThesisCaption={Diserta??n?? pr??ce}
\Dipl@SupervisorCaption={??kolitel}
}
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\RequirePackage[\the\Dipl@BabelLanguageOptions]{babel}

\newcommand{\ThesisAuthor}[1]{\Dipl@ThesisAuthor={#1}}
\newcommand{\ThesisSupervisor}[1]{\Dipl@ThesisSupervisor={#1}}
\newcommand{\CzechThesisTitle}[1]{\ifthenelse{\value{Dipl@CurrentThesisType}=\Dipl@BachelorPractice}{\relax}{\Dipl@CzechThesisTitle={#1}}}
\newcommand{\EnglishThesisTitle}[1]{\ifthenelse{\value{Dipl@CurrentThesisType}=\Dipl@BachelorPractice}{\relax}{\Dipl@EnglishThesisTitle={#1}}}
\newcommand{\SubmissionYear}[1]{\Dipl@SubmissionYear={#1}}
\newcommand{\Acknowledgement}[1]{\Dipl@Acknowledgement={#1}}
\newcommand{\CzechAbstract}[1]{\Dipl@CzechAbstract={#1}}
\newcommand{\CzechKeywords}[1]{\Dipl@CzechKeywords={#1}}
\newcommand{\EnglishAbstract}[1]{\Dipl@EnglishAbstract={#1}}
\newcommand{\EnglishKeywords}[1]{\Dipl@EnglishKeywords={#1}}
\newcommand{\AddAcronym}[2]{\Dipl@AddTokens{\Dipl@Acronyms}{#1&--&#2\\}}
\newcommand{\MakeTitlePages}
{
\tableofcontents\clearpage
}
{\theorembodyfont{\itshape}\newtheorem{definition}{\Dipl@LanguageDependentText{Definice}{Defin??cia}{Definition}}}
{\theorembodyfont{\itshape}\newtheorem{theorem}{\Dipl@LanguageDependentText{V??ta}{Veta}{Theorem}}}
\newenvironment{proof}
{\par\noindent\textbf{\proofname}}
{\mbox{}\hspace*{5pt}\hfill\hbox{\vrule height5pt depth0pt width5pt}\par\medskip}
{\theorembodyfont{\rmfamily}\newtheorem{remark}{\Dipl@LanguageDependentText{Pozn??mka}{Pozn??mka}{Remark}}}
{\theoremstyle{break}\theorembodyfont{\rmfamily}\newtheorem{Dipl@examplebody}{\Dipl@LanguageDependentText{P????klad}{Pr??klad}{Example}}}
\newenvironment{example}
{\begin{Dipl@examplebody}}
{
\nopagebreak\mbox{}\hspace*{5pt}\hfill\hbox{\vrule height5pt depth0pt width5pt}
\end{Dipl@examplebody}
}
\newcommand{\Dipl@TitlePage}
{
\ifthenelse{\value{Dipl@CurrentThesisType}=\Dipl@PhDThesis}

\thispagestyle{empty}
\begin{flushleft}
\huge
\sffamily
\vspace*{-0.2cm}
{\hspace*{-0.3in}\includegraphics[height=30mm]{\the\Dipl@FacultyLogoFileName}}
\par
\bigskip
\bigskip
\textbf{\Dipl@LanguageDependentText{\the\Dipl@CzechThesisTitle}{\the\Dipl@CzechThesisTitle}{\the\Dipl@EnglishThesisTitle}}
\par
\vspace*{0.05cm}
{\Large\Dipl@LanguageDependentText{\the\Dipl@EnglishThesisTitle}{\the\Dipl@EnglishThesisTitle}{\the\Dipl@CzechThesisTitle}}
\par
\bigskip
\bigskip
\bigskip
\the\Dipl@ThesisAuthor
\par
\vspace*{9cm}
{
\Large
\renewcommand{\arraystretch}{1.2}
\begin{tabular}{@{}l}
\the\Dipl@ThesisCaption\\
\the\Dipl@SupervisorCaption:~\the\Dipl@ThesisSupervisor\\
Ostrava,~\ifthenelse{\equal{\the\Dipl@SubmissionYear}{\empty}}{\number\year}{\the\Dipl@SubmissionYear}\\
\end{tabular}
}
\end{flushleft}
\clearpage

}
\newcommand{\Dipl@AbstractsKeywordsPage}
{
\ifthenelse{\value{Dipl@CurrentThesisLanguage}=\Dipl@SlovakLanguage}
{
\begin{otherlanguage}{slovak}
\section*{\the\Dipl@CzechAbstractCaption}
\the\Dipl@CzechAbstract
\section*{K??????ov?? slov??}
\the\Dipl@CzechKeywords
 \end{otherlanguage}
}
{
\begin{otherlanguage}{czech}
\section*{\the\Dipl@CzechAbstractCaption}
\the\Dipl@CzechAbstract
\section*{Kl????ov?? slova}
\the\Dipl@CzechKeywords
\end{otherlanguage}
}
\ifthenelse{\value{Dipl@CurrentThesisType}=\Dipl@PhDThesis}
{
\clearpage
}
{
\par
\vspace{30mm plus 0mm minus 30mm}
}
\begin{otherlanguage}{english}
\section*{\the\Dipl@EnglishAbstractCaption}
\the\Dipl@EnglishAbstract
\section*{Keywords}
\the\Dipl@EnglishKeywords
\end{otherlanguage}
\clearpage
}
\newcommand{\Dipl@AcknowledgementPage}
{
\ifthenelse{\equal{\the\Dipl@Acknowledgement}{\empty}}
{\relax}
{
\mbox{}
\vfill
\section*{\Dipl@LanguageDependentText{Pod??kov??n??}{Po??akovanie}{Acknowledgement}}
\the\Dipl@Acknowledgement
\clearpage
}
}
\newcommand{\Dipl@WriteAcronymsPage}
{
\ifthenelse{\equal{\the\Dipl@Acronyms}{\empty}}
{\relax}
{
\Dipl@LanguageDependentText
{
\chapter*{Seznam pou??it??ch zkratek a symbol??}
\addcontentsline{toc}{chapter}{Seznam pou??it??ch symbol?? a zkratek}

}
{
\chapter*{Zoznam pou??it??ch skratiek a symbolov}
\addcontentsline{toc}{chapter}{Zoznam pou??it??ch symbolov a skratiek}
}
{
\chapter*{List of symbols and abbreviations}
\addcontentsline{toc}{chapter}{List of symbols and abbreviations}
}
\begin{longtable*}[l]{p{0.2\textwidth}cp{0.7\textwidth}}
\the\Dipl@Acronyms
\end{longtable*}
\clearpage
}

}
%\titleformat{\chapter}[display]{\sffamily\huge\bfseries}{\chaptertitlename\ \thechapter}{20pt}{\Huge}
\titleformat{\chapter}{\sffamily\LARGE\bfseries}{\thechapter}{1em}{\LARGE}
\titlespacing*{\chapter}{0cm}{0pt}{20pt}
%\titleformat{\section}{\sffamily\huge\bfseries}{\thechapter}{20pt}{\Huge}
\titleformat{\section}{\sffamily\Large\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}{\sffamily\large\bfseries}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\sffamily\normalsize\bfseries}{\thesubsubsection}{1em}{}
\titleformat{\paragraph}[runin]{\sffamily\normalsize\bfseries}{\theparagraph}{1em}{}
\titleformat{\subparagraph}[runin]{\sffamily\normalsize\bfseries}{\thesubparagraph}{1em}{}
\let\Dipl@OldAppendix\appendix
\renewcommand{\appendix}
{
\Dipl@OldAppendix
\Dipl@LanguageDependentText
{
\addcontentsline{toc}{section}{P????lohy}
}
{
\addcontentsline{toc}{chapter}{Pr??lohy}
}
{
\addcontentsline{toc}{chapter}{Appendices}
}
}
\newcommand{\Dipl@LanguageDependentText}[3]{\ifthenelse{\value{Dipl@CurrentThesisLanguage}=\Dipl@CzechLanguage}{#1}{\ifthenelse{\value{Dipl@CurrentThesisLanguage}=\Dipl@SlovakLanguage}{#2}{#3}}}
\newcommand{\Dipl@AddTokens}[2]{\expandafter \global#1\expandafter{\the#1#2}}
\catcode30=12
\onehalfspacing
\setcounter{tocdepth}{1}
\setcounter{secnumdepth}{5}
\widowpenalty=9000
\clubpenalty=9000
\hypersetup{unicode=true, colorlinks=true, linkcolor=black, urlcolor=black, citecolor=black}
\addto{\captionsczech}{\renewcommand{\refname}{Literatura}}
\addto{\captionsslovak}{\renewcommand{\refname}{Literat??ra}}
\AtBeginDocument%
{
\shorthandoff{-}
\Dipl@LanguageDependentText
{
\selectlanguage{czech}
}
{
\selectlanguage{slovak}
}
{
\selectlanguage{english}
}
}
\endinput
%%
%% End of file `diploma.cls'.
