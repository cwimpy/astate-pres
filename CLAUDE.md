# astate-pres

Arkansas State University presentation templates — Beamer (LaTeX) and revealjs (Quarto) — with matching visual design.

## Project Goals

1. Maintain a polished, reusable Beamer theme (`astate-beamer/`) that mirrors the existing revealjs Quarto theme (`astate-revealjs/`)
2. Package the Beamer theme as a Quarto extension so presentations can be authored in Markdown
3. Keep both formats visually consistent: same colors, fonts, layout, and branding

## Architecture

- `astate-beamer/` — LaTeX Beamer theme (5 `.sty` files) + templates (`.tex` and `.qmd`)
- `astate-beamer/_extensions/astate/` — Quarto format extension for Beamer
- `astate-revealjs/` — Quarto revealjs theme (SCSS + `_extensions/`)

### Beamer Theme Files

| File | Purpose |
|------|---------|
| `beamerthemeAState.sty` | Main theme loader |
| `beamercolorthemeAState.sty` | Brand colors (#CC092F red, #01364C navy, #F9FAFB light gray) |
| `beamerfontthemeAState.sty` | Font assignments (Prompt via fontspec, with fallbacks) |
| `beamerinnerthemeAState.sty` | Title page, bullets, blocks, `\authorblock`, `\conference` |
| `beamerouterthemeAState.sty` | Frame title, footer, section breaks, `\sectionframe` |

### Quarto Extension (`_extensions/astate/`)

| File | Purpose |
|------|---------|
| `_extension.yml` | Format config: extends `beamer`, sets XeLaTeX, theme, aspect ratio |
| `astate-authors.lua` | Lua filter: YAML author/conference/footer/logo → LaTeX commands |
| `header.tex` | Preamble: Prompt font fallback, fontawesome5, academicons isolation, section break override |

The extension directory is named `astate` so the format is `astate-beamer` (extension name + base format).

### Key Commands (LaTeX)

- `\setAStateFooter{text}` — custom footer text
- `\setAStateLogo{file.png}` — logo in footer + title slide
- `\conference{name}` — conference/event name on title slide
- `\authorblock{Name}{Affiliation}` — formatted author entry
- `\sectionframe{Title}` — red background section break

### Key YAML Fields (Quarto)

- `conference` — conference/event name on title slide
- `footer` — footer text
- `logo` — logo file path
- `author.affiliations` — list of affiliation strings per author

## Two Compilation Paths

1. **Direct LaTeX**: Edit `template.tex`, run `make` (uses xelatex directly)
2. **Quarto**: Edit `template.qmd`, run `quarto render template.qmd` (uses the extension)

Both produce visually identical output from the same `.sty` theme files.

## Known Constraints

- **Must compile with XeLaTeX** (fontspec + fontawesome5 icons)
- **Do NOT use `\usepackage{academicons}`** — it corrupts fontspec encodings under XeLaTeX. The Academicons font is loaded in isolation via `\newfontfamily`. See commit history for details.
- **Prompt font** is not installed on this system; the theme gracefully falls back to the default sans-serif. Install Prompt from Google Fonts to use it.
- Old fontawesome5 v5.7.0 files were backed up to `~/Library/texmf/fontawesome5-backup-v5.7.0/` — the system TeX Live 2026 v5.15.4 is used instead.
- The Quarto extension sets `latex-auto-install: false` to prevent Quarto from interrupting compilation over non-fatal font warnings.

## TODO

- [x] Create Quarto Beamer extension
  - [x] Write `_extension.yml` mapping YAML metadata to LaTeX commands
  - [x] Lua filter to translate `author:` YAML into `\authorblock` calls
  - [x] Template `.qmd` with example content
- [ ] Test with 5 co-authors — may need to adjust title slide spacing
- [ ] Add a "Get in Touch" helper command or environment to the theme
- [ ] Install Prompt font system-wide for consistent typography
