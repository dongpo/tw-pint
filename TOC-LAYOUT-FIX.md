# BIS left-side Table of Contents fix

The BIS documentation layout now uses a fixed, scrollable Table of Contents on the left at desktop and tablet widths. The consolidated document remains one HTML page; the chapter source files remain independent AsciiDoc files included by `bis/index.adoc`.

After changing files in `peppol-official-ui-src`, rebuild the UI bundle:

```bash
cd peppol-official-ui-src
rm -f ../ui-bundle-peppol-official.zip
zip -qr ../ui-bundle-peppol-official.zip .
cd ..
rm -rf build
antora playbook.yml
```
