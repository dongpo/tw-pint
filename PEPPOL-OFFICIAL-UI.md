# Peppol official-style UI

This UI is reconstructed from the three complete official Peppol PINT pages supplied for reference: the PINT start page, BIS documentation page, and Invoice Transaction page.

The bundle preserves the official DOM outline used by the BIS documentation page:

- fixed Peppol navbar
- official Peppol logo asset
- `body.book.toc2.toc-left`
- `container-fluid toc22`
- `#header`, `#toc`, `#content`, and `#footer`
- official Bootstrap, Peppol PDK, main, AsciiDoc extension, and Asciidoctor stylesheets
- document TOC generated from the Antora page headings

Rebuild the UI bundle after editing files under `peppol-official-ui-src`:

```bash
cd peppol-official-ui-src
zip -qr ../ui-bundle-peppol-official.zip .
cd ..
rm -rf build
antora playbook.yml
```
