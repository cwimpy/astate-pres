# AState Revealjs — IRI

A revealjs (Quarto) presentation theme for Arkansas State University, packaged
as a Quarto format extension. Matching visual design to the Beamer theme in
[`astate-beamer/`](../astate-beamer/).

## Install

### As a new project (recommended)

```bash
quarto use template cwimpy/astate-pres/astate-revealjs-iri
```

This scaffolds a fresh Quarto project with `template.qmd`, the `_extensions/`
folder, and example logos.

### Into an existing project

```bash
quarto add cwimpy/astate-pres/astate-revealjs-iri
```

Then add this to any `.qmd` front matter:

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
| `author.orcid`       | Clickable ORCID iD on the author line             |
| `author.affiliations`| List of affiliation objects (see `template.qmd`)  |
| `date`               | Rendered on title slide                           |
| `logo`               | Logo shown on every slide (set under format)      |
| `footer`             | Footer text (set under format)                    |

Defaults supplied by the extension: 16:9 at 1600×900, fade transitions,
incremental lists, chalkboard, pointer, slide numbers, FontAwesome 6 CDN.

## Requirements

- **Quarto** ≥ 1.4
- Web browser for viewing the `.html` output

## License

MIT. Arkansas State University brand marks belong to their respective owners.
