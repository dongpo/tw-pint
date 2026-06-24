# TW-PINT Candidate Specification v1.0

Taiwan Jurisdiction Extension Candidate of Peppol International Invoice Transaction (PINT).

Status: **candidate specification prepared for community review**. This is not an official OpenPeppol publication and has not been approved by a Taiwan Peppol Authority.

## Purpose

TW-PINT defines how Taiwan can use Peppol PINT as the international invoice exchange layer while preserving Taiwan eGUI as the domestic tax reporting layer.

## Local build

```bash
python3 tools/generate_adoc_tables.py
npm install -g @antora/cli @antora/site-generator
antora playbook.yml
```
