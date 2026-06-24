# TW-PINT PINT-style Candidate Specification

This repository is structured to follow the same high-level publication pattern as PINT specializations:

```text
Home
├── Documentation
│   └── PINT / BIS document body
├── Transaction
│   └── Invoice Transaction
│       ├── Semantic model
│       ├── Syntax binding
│       ├── Code lists
│       ├── Business rules
│       └── Schematrons
└── Download resources
```

Status: candidate specification for community review. Not an official OpenPeppol publication.

## Local build

```bash
python3 tools/generate_adoc_tables.py
antora playbook.yml
```

## GitHub Pages

Use GitHub Actions as the Pages source.
