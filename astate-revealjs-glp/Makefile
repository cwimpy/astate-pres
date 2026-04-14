# Makefile for AState Revealjs presentations
#
# Usage:
#   make                      — render the (only) .qmd in this directory to _output/
#   make FILE=talk            — build talk.qmd explicitly
#   make preview              — live-preview server (quarto preview)
#   make clean                — remove aux files and _files/ (keeps _output/)
#   make cleanall             — also remove _output/
#
# Requires: quarto.

OUTDIR   = _output

# Auto-detect the source .qmd in this directory
QMD_FILES := $(wildcard *.qmd)
ifeq ($(words $(QMD_FILES)),1)
  FILE ?= $(basename $(QMD_FILES))
else
  FILE ?= template
endif

.PHONY: all preview clean cleanall

all: $(FILE).qmd
	@mkdir -p $(OUTDIR)
	quarto render $(FILE).qmd --output-dir $(OUTDIR)
	@rm -rf $(FILE)_files .quarto
	@echo ""
	@echo "✓ $(OUTDIR)/$(FILE).html is ready."

preview: $(FILE).qmd
	quarto preview $(FILE).qmd

clean:
	rm -rf $(FILE)_files .quarto
	@echo "✓ Auxiliary files removed. $(OUTDIR)/ kept."

cleanall: clean
	rm -rf $(OUTDIR)
	@echo "✓ $(OUTDIR)/ also removed."
