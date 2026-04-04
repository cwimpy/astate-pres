# astate-pres

Arkansas State University presentation templates for Beamer (LaTeX) and revealjs (Quarto).

## Beamer Theme

The `astate-beamer/` directory contains a complete Beamer theme matching the A-State brand.

### Requirements

- **XeLaTeX** (required for Prompt font + icon support)
- [Prompt](https://fonts.google.com/specimen/Prompt) font installed (falls back to Source Sans Pro or Helvetica)
- TeX Live 2024+ recommended (fontawesome5 v5.15+)

### Quick Start

```bash
cd astate-beamer

# Build the template (runs xelatex twice for cross-references)
make

# Build a different .tex file
make FILE=mytalk

# Clean up auxiliary files (.aux, .log, .nav, etc.), keep the PDF
make clean

# Clean everything including the PDF
make cleanall
```

### Makefile Reference

| Command | What it does |
|---------|-------------|
| `make` | Compile `template.tex` with two xelatex passes |
| `make FILE=talk` | Compile `talk.tex` instead |
| `make clean` | Remove auxiliary files, keep the PDF |
| `make cleanall` | Remove auxiliary files and the PDF |

The Makefile automatically rebuilds when any `.tex`, `.sty`, or `.png` file changes.

### Creating a New Presentation

1. Copy `template.tex` to a new file (e.g., `mytalk.tex`)
2. Edit the metadata: `\title`, `\subtitle`, `\author`, `\date`, `\conference`
3. Replace the example slides with your content
4. Run `make FILE=mytalk`

### Theme Commands

| Command | Purpose |
|---------|---------|
| `\setAStateFooter{text}` | Custom footer text |
| `\setAStateLogo{file.png}` | Logo in footer and title slide |
| `\conference{Name}` | Conference or event name on title slide |
| `\authorblock{Name}{Affiliation}` | Formatted author entry for title slide |
| `\sectionframe{Title}` | Red background section break slide |

## Revealjs Theme

The `astate-revealjs/` directory contains the Quarto revealjs theme. Render with:

```bash
cd astate-revealjs
quarto render template.qmd
```
