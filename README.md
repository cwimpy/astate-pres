# astate-pres

Arkansas State University presentation templates for **Beamer (LaTeX)** and
**revealjs (Quarto)**, shipped as four installable Quarto extensions:

| Template | Format | Branding | Install |
|----------|--------|----------|---------|
| `astate-beamer-glp`   | Beamer    | GLP (Government, Law & Policy)       | `quarto use template cwimpy/astate-pres/astate-beamer-glp` |
| `astate-beamer-iri`   | Beamer    | IRI (Institute for Rural Initiatives)| `quarto use template cwimpy/astate-pres/astate-beamer-iri` |
| `astate-revealjs-glp` | revealjs  | GLP                                   | `quarto use template cwimpy/astate-pres/astate-revealjs-glp` |
| `astate-revealjs-iri` | revealjs  | IRI                                   | `quarto use template cwimpy/astate-pres/astate-revealjs-iri` |

All four share the same typography (Inter body + Fraunces display), A-State
brand colors (red `#CC092F`, navy `#01364C`), and author/ORCID/affiliation
metadata handling. The `-iri` variants use `iri.png` as the footer logo and
on the contact slide; the `-glp` variants use `astate.png` / `glp.png`.

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

## License

MIT. Arkansas State University brand marks belong to their respective owners.
