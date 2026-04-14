# astate-pres

Arkansas State University presentation templates for **Beamer (LaTeX)** and
**revealjs (Quarto)**, shipped as six installable Quarto extensions — a
generic A-State pair plus unit-specific variants for GLP (Government, Law &
Policy) and IRI (Institute for Rural Initiatives).

| Template | Format | Branding | Install |
|----------|--------|----------|---------|
| `astate-beamer`       | Beamer    | Generic A-State (recommended)         | `quarto use template cwimpy/astate-pres/astate-beamer` |
| `astate-beamer-glp`   | Beamer    | GLP (Government, Law & Policy)         | `quarto use template cwimpy/astate-pres/astate-beamer-glp` |
| `astate-beamer-iri`   | Beamer    | IRI (Institute for Rural Initiatives)  | `quarto use template cwimpy/astate-pres/astate-beamer-iri` |
| `astate-revealjs`     | revealjs  | Generic A-State (recommended)          | `quarto use template cwimpy/astate-pres/astate-revealjs` |
| `astate-revealjs-glp` | revealjs  | GLP                                     | `quarto use template cwimpy/astate-pres/astate-revealjs-glp` |
| `astate-revealjs-iri` | revealjs  | IRI                                     | `quarto use template cwimpy/astate-pres/astate-revealjs-iri` |

All six share the same typography (Inter body + Fraunces display), A-State
brand colors (red `#CC092F`, navy `#01364C`), author/ORCID/affiliation
metadata handling, and `Makefile` build workflow. Variants differ only in
which logo image and contact slide content ship with the template.

## Usage

After scaffolding, each template directory ships with a `Makefile`:

```bash
make           # render to _output/
make preview   # (revealjs) live-preview server
make clean     # sweep aux files
make cleanall  # also remove _output/
```

See each subdirectory's `README.md` for template-specific details.

## Requirements

- **Quarto** ≥ 1.4
- **XeLaTeX** for the Beamer variants (fontspec + fontawesome6)
- Fonts: [Inter](https://fonts.google.com/specimen/Inter) and
  [Fraunces](https://fonts.google.com/specimen/Fraunces) — revealjs pulls
  from Google Fonts automatically; Beamer falls back gracefully if they
  aren't installed system-wide.

## Sharing

To share with an A-State colleague, send them one of:

```bash
quarto use template cwimpy/astate-pres/astate-beamer      # LaTeX slides
quarto use template cwimpy/astate-pres/astate-revealjs    # HTML slides
```

The generic variants have placeholder author/affiliation info they can edit.

## License

MIT. Arkansas State University brand marks belong to their respective owners.
