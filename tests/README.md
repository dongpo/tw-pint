# TW-PINT Validation Test Suite v0.1

Status: non-official working draft for review.

## Purpose

This package provides valid and invalid XML instances for testing TW-PINT validation artifacts.

## Recommended validation order

1. UBL 2.1 XML Schema validation
2. PINT International shared rules
3. TW-PINT Schematron
4. TW-PINT Genericode code-list validation

## Directory structure

```text
tests/
  valid/
  invalid/
  expected-results/
tools/
schemas/
schematron/
manifest.json
```

## Valid cases

- `valid-taxable-domestic-invoice.xml`
- `valid-zero-rated-export-invoice.xml`
- `valid-exempt-invoice.xml`

## Invalid cases

- `invalid-customization-id.xml`
- `invalid-invoice-number.xml`
- `invalid-seller-ubn-format.xml`
- `invalid-missing-buyer-ubn.xml`
- `invalid-tax-category.xml`
- `invalid-tax-rate.xml`
- `invalid-exempt-tax-amount.xml`
- `invalid-missing-invoice-line.xml`

## Note

The test suite is designed for TW-PINT v0.1 Schematron and should be refined after the Taiwan export invoice classification and CreditNote validation rules are finalized.
