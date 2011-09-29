# Makefile for Dissertation
#
# Change Log:
#   $LastChangedBy$
#   $LastChangedDate$
#   $LastChangedRevision$

# base name of your top-level .tex file
TARGET=bare_thesis
# list of .tex files for frontmatter
FRONTMATTER= abstract.tex notations.tex
# list of .tex files for mainmatter
MAINMATTER = ch01-xxx.tex # ch02-yyy.tex ch03-zzz.tex
# list of .tex files for backmatter
BACKMATTER = acronyms.tex ackgt.tex pubs.tex

# alias for latex, dvips, gs, bibtex, makeindex and rm
LATEX=latex
DVIPS=dvips
PSPDF=gswin32c
BIBTEX=bibtex
MKIDX=makeindex
RM=rm

# options for dvips
DVIPSOPT=-D300 -t A4size -R0

# options for gs
PSPDFOPT=-dSAFER -sDEVICE=pdfwrite -dPDFSETTINGS=/printer -dCompatibilityLevel=1.4 -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true -sPAPERSIZE=a4 -dBATCH -dNOPAUSE -sFONTMAP=Fontmap.ATB -sOutputFile=


all: $(TARGET).pdf clean
.PHONY: all

$(TARGET).pdf: $(TARGET).ps
	$(PSPDF) $(PSPDFOPT)$@ $<
	rm $<

$(TARGET).ps: $(TARGET).dvi
	$(DVIPS) $(DVIPSOPT) $^
	rm $<

$(TARGET).dvi: $(TARGET).tex $(MAINMATTER:.tex=.bbl) pubs.bbl
	$(LATEX) $<
	$(LATEX) $<

ch%.bbl: ch%.aux
	$(BIBTEX) $(basename $<)
pubs.bbl: pubs.aux
	$(BIBTEX) $(basename $<)

$(TARGET).aux pubs.aux ch%.aux: $(TARGET).tex $(MAINMATTER)
	$(LATEX) $(TARGET)
	$(RM) $(TARGET).dvi
	$(MKIDX) -s $(TARGET).ist -t $(TARGET).alg -o $(TARGET).acr $(TARGET).acn

.PHONY: clean
clean:
	$(RM) *.bbl *.blg
	$(RM) *.aux *.log
	$(RM) *.acn *.glo *.ist *.acr *.alg
	$(RM) *.out *.toc *.thm