# astate-pres

Arkansas State University presentation templates — Beamer (LaTeX) and revealjs (Quarto) — with matching visual design.

## Project Goals

1. Maintain a polished, reusable Beamer theme (`astate-beamer/`) that mirrors the existing revealjs Quarto theme (`astate-revealjs/`)
2. Package the Beamer theme as a Quarto extension so presentations can be authored in Markdown
3. Keep both formats visually consistent: same colors, fonts, layout, and branding

## Architecture

- `astate-beamer/` — LaTeX Beamer theme (5 `.sty` files) + template
- `astate-revealjs/` — Quarto revealjs theme (SCSS + `_extensions/`)

### Beamer Theme Files

| File | Purpose |
|------|---------|
| `beamerthemeAState.sty` | Main theme loader |
| `beamercolorthemeAState.sty` | Brand colors (#CC092F red, #01364C navy, #F9FAFB light gray) |
| `beamerfontthemeAState.sty` | Font assignments (Prompt via fontspec, with fallbacks) |
| `beamerinnerthemeAState.sty` | Title page, bullets, blocks, `\authorblock`, `\conference` |
| `beamerouterthemeAState.sty` | Frame title, footer, section breaks, `\sectionframe` |

### Key Commands

- `\setAStateFooter{text}` — custom footer text
- `\setAStateLogo{file.png}` — logo in footer + title slide
- `\conference{name}` — conference/event name on title slide
- `\authorblock{Name}{Affiliation}` — formatted author entry
- `\sectionframe{Title}` — red background section break

## Known Constraints

- **Must compile with XeLaTeX** (fontspec + fontawesome5 icons)
- **Do NOT use `\usepackage{academicons}`** — it corrupts fontspec encodings under XeLaTeX. The Academicons font is loaded in isolation via `\newfontfamily` in `template.tex`. See commit history for details.
- Old fontawesome5 v5.7.0 files were backed up to `~/Library/texmf/fontawesome5-backup-v5.7.0/` — the system TeX Live 2026 v5.15.4 is used instead.

## TODO

- [ ] Create Quarto Beamer extension (`_extensions/astate-beamer/`)
  - [ ] Write `_extension.yml` mapping YAML metadata to LaTeX commands
  - [ ] Lua filter to translate `author:` YAML into `\authorblock` calls
  - [ ] Template partial for title page
  - [ ] Template `.qmd` with example content
- [ ] Test with 5 co-authors — may need to adjust title slide spacing
- [ ] Add a "Get in Touch" helper command or environment to the theme
