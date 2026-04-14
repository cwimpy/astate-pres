# AState Beamer — IRI

A Beamer (LaTeX) presentation theme for Arkansas State University, packaged as a
Quarto format extension. Matching visual design to the revealjs theme in
[`astate-revealjs/`](../astate-revealjs/).

## Install

### As a new project (recommended)

```bash
quarto use template cwimpy/astate-pres/astate-beamer-iri
```

This scaffolds a fresh Quarto project with `template.qmd`, the `_extensions/`
folder, and example logos.

### Into an existing project

```bash
quarto add cwimpy/astate-pres/astate-beamer-iri
```

Then add this to any `.qmd` front matter:

```yaml
format:
  astate-beamer: default
```

## Usage

Edit `template.qmd` and render:

```bash
quarto render template.qmd
```

The starter `Makefile` wraps this and routes output to `_output/`:

```bash
make          # auto-detect template.qmd or template.tex
make qmd      # force Quarto path
make tex      # force pure LaTeX path
make clean    # sweep aux files
make cleanall # also remove _output/
```

## YAML fields

| Field                | Purpose                                               |
|----------------------|-------------------------------------------------------|
| `title`, `subtitle`  | Title-slide text                                      |
| `author.name`        | Author name                                           |
| `author.affiliations`| List of affiliation lines (one per `-`)               |
| `date`               | Rendered on title slide                               |
| `conference`         | Optional event name shown below date                  |
| `footer`             | Footer text on content slides                         |
| `logo`               | Logo image (bottom-right of title slide + in footer)  |

## Requirements

- **XeLaTeX** (fontspec + fontawesome6 icons)
- **Quarto** ≥ 1.4
- **Fonts** (optional, for intended look):
  [Inter](https://fonts.google.com/specimen/Inter) (body) and
  [Fraunces](https://fonts.google.com/specimen/Fraunces) (display).
  Theme falls back gracefully to Prompt or system sans if absent.

## License

MIT. Arkansas State University brand marks belong to their respective owners.
