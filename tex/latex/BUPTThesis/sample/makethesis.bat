@REM batch file for makeing dissertation
@REM 
@REM Change Log:
@REM $LastChangedBy$
@REM $LastChangedDate$
@REM $LastChangedRevision$

@echo off

REM base name of your top-level .tex file
set TARGET=bare_thesis

REM list of .tex files for mainmatter
set MAINMATTER=(ch01-xxx pubs)

REM alias for latex, dvips, gs, bibtex, makeindex and rm
set LATEX=latex
set DVIPS=dvips
set PSPDF=gswin32c
set BIBTEX=bibtex
set MKIDX=makeindex
set RM=del

REM options for dvips
set DVIPSOPT=-D300 -t A4size -R0

REM options for gs
set PSPDFOPT=-dSAFER -sDEVICE=pdfwrite -dPDFSETTINGS=/printer -dCompatibilityLevel=1.4 -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true -sPAPERSIZE=a4 -dBATCH -dNOPAUSE -sOutputFile=


%LATEX% %TARGET%
for %%i in %MAINMATTER% do %BIBTEX% %%i
%MKIDX% -s %TARGET%.ist -t %TARGET%.alg -o %TARGET%.acr %TARGET%.acn
%LATEX% %TARGET%
%LATEX% %TARGET%
%DVIPS% %DVIPSOPT% %TARGET%.dvi
%PSPDF% %PSPDFOPT%%TARGET%.pdf %TARGET%.ps

for %%i in (*.bbl *.blg *.aux *.log *.acn *.glo *.ist *.acr *.alg *.out *.toc *.thm *.ps *.dvi) do %RM% %%i

