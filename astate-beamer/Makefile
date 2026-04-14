# Makefile for AState Beamer presentations
#
# Usage:
#   make                      — auto-detect source (prefers FILE.qmd, falls back to FILE.tex)
#   make tex                  — force LaTeX path (uses xelatex)
#   make qmd                  — force Quarto path (uses quarto render)
#   make FILE=talk            — build talk.qmd (or talk.tex) into _output/talk.pdf
#   make clean                — remove auxiliary files (keeps _output/)
#   make cleanall             — remove auxiliary files AND _output/
#
# Output:
#   All finished PDFs land in _output/.  Auxiliary files (aux, log, nav, etc.)
#   are deleted after a successful build.
#
# Requires: xelatex (fontspec + fontawesome6) and/or quarto.

# Auto-detect the source file:
#   - if exactly one .qmd / .tex exists in this directory, use it
#   - otherwise fall back to "template" (override with `make FILE=talk`)
SRC_FILES := $(wildcard *.qmd) $(wildcard *.tex)
ifeq ($(words $(SRC_FILES)),1)
  FILE ?= $(basename $(SRC_FILES))
else
  FILE ?= template
endif

ENGINE   = xelatex
FLAGS    = -interaction=nonstopmode
OUTDIR   = _output

# Tell (Xe)LaTeX where to find the AState .sty files (they live inside the
# Quarto extension so they ship correctly when the package is installed).
EXTDIR   = _extensions/astate
export TEXINPUTS := .:$(EXTDIR):$(TEXINPUTS)

# Auxiliary extensions that xelatex / beamer / quarto leave behind
AUX_EXT = aux log nav out snm toc vrb fdb_latexmk fls synctex.gz

# Theme .sty files that Quarto's format-resources copies into the project
# root at render time — we sweep these up after a successful build so they
# don't clutter the working dir.
STY_FILES = beamerthemeAState.sty beamercolorthemeAState.sty \
            beamerfontthemeAState.sty beamerinnerthemeAState.sty \
            beamerouterthemeAState.sty

.PHONY: all tex qmd clean cleanall

# --- Auto-detect: prefer .qmd if present, else fall back to .tex ------------
all:
	@if [ -f "$(FILE).qmd" ]; then \
		$(MAKE) qmd; \
	elif [ -f "$(FILE).tex" ]; then \
		$(MAKE) tex; \
	else \
		echo "✗ Neither $(FILE).qmd nor $(FILE).tex found."; exit 1; \
	fi

# --- LaTeX path -------------------------------------------------------------
tex: $(FILE).tex
	@mkdir -p $(OUTDIR)
	$(ENGINE) $(FLAGS) $(FILE).tex
	$(ENGINE) $(FLAGS) $(FILE).tex
	@mv -f $(FILE).pdf $(OUTDIR)/
	@rm -f $(addprefix $(FILE)., $(AUX_EXT))
	@echo ""
	@echo "✓ $(OUTDIR)/$(FILE).pdf is ready."

# --- Quarto path ------------------------------------------------------------
qmd: $(FILE).qmd
	@mkdir -p $(OUTDIR)
	quarto render $(FILE).qmd --output-dir $(OUTDIR)
	@rm -rf $(FILE)_files .quarto
	@rm -f $(STY_FILES)
	@rm -f $(addprefix $(FILE)., $(AUX_EXT))
	@echo ""
	@echo "✓ $(OUTDIR)/$(FILE).pdf is ready."

# --- Housekeeping -----------------------------------------------------------
clean:
	rm -f $(addprefix $(FILE)., $(AUX_EXT))
	rm -f $(STY_FILES)
	rm -rf $(FILE)_files .quarto
	@echo "✓ Auxiliary and stray .sty files removed. $(OUTDIR)/ kept."

cleanall: clean
	rm -rf $(OUTDIR)
	@echo "✓ $(OUTDIR)/ also removed."
