# TW-PINT Repository v0.2 Release Notes

Release date: 2026-06-16

Status: non-official working repository for review. Not an OpenPeppol publication.

## Added in v0.2

- Integrated TW-PINT Billing Specification DOCX.
- Integrated TW-PINT UBL Syntax Binding workbook.
- Integrated TW-PINT Rules Catalogue workbook.
- Integrated TW-PINT Schematron package.
- Integrated TW-PINT Example XML set.
- Integrated TW-PINT Validation Test Suite.
- Preserved semantic model CSV, syntax-binding CSV, genericode code lists, rules CSV, examples, and Antora documentation scaffold from v0.1.

## Source-of-truth direction

The repository should increasingly treat the following chain as the normative source:

```text
semantic-model → syntax-binding → rules → schematron → examples → tests
```

DOCX files are retained as human-readable working specifications.
