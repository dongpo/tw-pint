# TW-PINT AsciiDoc Repository v0.1

Taiwan jurisdiction draft package for Peppol International Invoice Transaction.

Status: **non-official working repository for review**. Not an OpenPeppol publication.

## Local build

```bash
python3 tools/generate_adoc_tables.py
npm install -g @antora/cli @antora/site-generator
antora playbook.yml
```

Output:

```text
build/site/
```

## GitHub Pages

1. Push this repository to GitHub.
2. Go to **Settings → Pages**.
3. Choose **GitHub Actions** as the source.
4. Push to `main`.
5. The site will be deployed by `.github/workflows/pages.yml`.
