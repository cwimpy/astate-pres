# Makefile for AState Beamer presentations
#
# Usage:
#   make              — compile template.tex (two passes for cross-refs)
#   make FILE=talk    — compile talk.tex instead
#   make clean        — remove auxiliary files, keep the PDF
#   make cleanall     — remove auxiliary files AND the PDF
#
# Requires: xelatex (for fontspec + fontawesome5 icons)

FILE   ?= template
ENGINE  = xelatex
FLAGS   = -interaction=nonstopmode

# Auxiliary extensions that xelatex / beamer generate
AUX_EXT = aux log nav out snm toc vrb fdb_latexmk fls synctex.gz

.PHONY: all clean cleanall

all: $(FILE).pdf

$(FILE).pdf: $(FILE).tex $(wildcard *.sty) $(wildcard *.png)
	$(ENGINE) $(FLAGS) $(FILE).tex
	$(ENGINE) $(FLAGS) $(FILE).tex
	@echo ""
	@echo "✓ $(FILE).pdf is ready."

clean:
	rm -f $(addprefix $(FILE)., $(AUX_EXT))
	@echo "✓ Auxiliary files removed. $(FILE).pdf kept."

cleanall: clean
	rm -f $(FILE).pdf
	@echo "✓ $(FILE).pdf also removed."
