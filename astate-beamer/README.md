# AState Beamer

A generic Beamer (LaTeX) presentation template for Arkansas State University,
packaged as a Quarto format extension. Drop-in defaults with A-State brand
colors, typography, and the standard `astate.png` logo — edit the YAML and
start writing.

## Install

### As a new project (recommended)

```bash
quarto use template cwimpy/astate-pres/astate-beamer
```

### Into an existing project

```bash
quarto add cwimpy/astate-pres/astate-beamer
```

Then in any `.qmd`:

```yaml
format:
  astate-beamer: default
```

## Usage

Edit `template.qmd` (or rename it to your talk name) and render:

```bash
make           # render to _output/
make clean     # sweep aux files
make cleanall  # also remove _output/
```

## YAML fields

| Field                | Purpose                                               |
|----------------------|-------------------------------------------------------|
| `title`, `subtitle`  | Title-slide text                                      |
| `author.name`        | Author name                                           |
| `author.orcid`       | (optional) Clickable ORCID iD on the author line      |
| `author.affiliations`| List of affiliation lines                             |
| `date`               | Rendered on title slide                               |
| `conference`         | Event name shown below date                           |
| `footer`             | Footer text on content slides                         |
| `logo`               | Logo image (bottom-right of title slide + in footer)  |

## Requirements

- **XeLaTeX** (fontspec + fontawesome6 icons)
- **Quarto** ≥ 1.4
- Fonts (optional, for intended look):
  [Inter](https://fonts.google.com/specimen/Inter) (body) and
  [Fraunces](https://fonts.google.com/specimen/Fraunces) (display).
  Theme falls back gracefully to Prompt or system sans if absent.

## Other variants

The parent repo also ships `astate-beamer-glp` and `astate-beamer-iri`
— unit-specific variants for GLP and IRI — if you need them.

## License

MIT. Arkansas State University brand marks belong to their respective owners.
