# AState Revealjs

A generic revealjs (Quarto) presentation template for Arkansas State
University. Drop-in defaults with A-State brand colors, typography, and the
standard `astate.png` logo — edit the YAML and start writing.

## Install

### As a new project (recommended)

```bash
quarto use template cwimpy/astate-pres/astate-revealjs
```

### Into an existing project

```bash
quarto add cwimpy/astate-pres/astate-revealjs
```

Then in any `.qmd`:

```yaml
format:
  astate-revealjs: default
```

## Usage

Edit `template.qmd` and render:

```bash
make           # render to _output/
make preview   # live-preview server
make clean     # sweep aux files
make cleanall  # also remove _output/
```

Output is a standalone `.html` deck in `_output/`.

## YAML fields

| Field                | Purpose                                           |
|----------------------|---------------------------------------------------|
| `title`, `subtitle`  | Title-slide text                                  |
| `author.name`        | Author name                                       |
| `author.orcid`       | (optional) Clickable ORCID iD                     |
| `author.affiliations`| List of affiliation objects                       |
| `date`               | Rendered on title slide                           |
| `logo`               | Logo shown on every slide (set under `format`)    |
| `footer`             | Footer text (set under `format`)                  |

## Other variants

The parent repo also ships `astate-revealjs-glp` and `astate-revealjs-iri`
— unit-specific variants for GLP and IRI — if you need them.

## Requirements

- **Quarto** ≥ 1.4
- A browser

## License

MIT. Arkansas State University brand marks belong to their respective owners.
