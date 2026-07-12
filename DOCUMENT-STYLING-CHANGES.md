# TW-PINT document styling changes

This revision adds the following presentation rules to the consolidated BIS document:

1. Figures scale to the full width of the document text column.
2. “UBL example of …” labels are red and italic.
3. XML examples use Courier New in grey boxes; XML tags are green and CDATA remains black.
4. XML callouts are rendered as Unicode circled numerals (①–⑳), not parenthesised numbers.
5. BIS document body text is 13.5 px.

The implementation is in:

- `peppol-official-ui-src/css/tw-pint-official.css`
- `peppol-official-ui-src/js/tw-pint-document.js`
- `peppol-official-ui-src/partials/footer-scripts.hbs`

The bundled UI has already been regenerated as `ui-bundle-peppol-official.zip`.
