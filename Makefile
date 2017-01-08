# makefile pro preklad LaTeX verze Bc. prace
# (c) 2008 Michal Bidlo
# E-mail: bidlom AT fit vutbr cz
# Changes: Jan Tulak (jan@tulak.me)
#          dytrych AT fit vutbr cz
#===========================================
CO=proj

all: $(CO).pdf
	@make normostrany

pdf: $(CO).pdf

$(CO).ps: $(CO).dvi
	dvips $(CO)


$(CO).pdf: clean
	pdflatex $(CO)
	pdflatex $(CO)
	bibtex $(CO)
	pdflatex $(CO)
	pdflatex $(CO)

$(CO).dvi: $(CO).tex 
	#$(CO).bib
	latex $(CO)
	#bibtex $(CO)
	latex $(CO)
	latex $(CO)

desky:
#	latex desky
#	dvips desky
#	dvipdf desky
	pdflatex desky

normostrany:
	@echo "---------------------------------"
	@echo "NORMOSTRANY:"
	@echo "scale=2; `detex -n content/*.tex | wc -c`/1800;" | bc
	@echo "---------------------------------"

clean:
	rm -f *.dvi *.log $(CO).blg $(CO).bbl $(CO).toc *.aux $(CO).out $(CO).lof
	rm -f $(CO).pdf
	rm -f *~

pack:
	tar czvf bp-xjmeno.tar.gz *.tex *.bib *.bst ./fig/* ./cls/* Makefile Changelog
