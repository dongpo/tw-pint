# TW-PINT Schematron v0.1

Status: non-official working draft for review.

Generated: 2026-06-15

## Files

- `TW-PINT-v0.1.sch`: executable Schematron draft for UBL 2.1 Invoice.
- `TW-PINT-Schematron-Notes.md`: notes on scope and reserved rules.

## Validation layering

Recommended validation order:

1. UBL 2.1 XML Schema validation
2. PINT International shared rules
3. TW-PINT Schematron
4. TW-PINT code-list validation using genericode
5. Example/test-case validation

## Important limitations

- This v0.1 file focuses on UBL Invoice.
- CreditNote parallel rules are reserved for v0.2.
- TW-IBR-046~048 are reserved until export invoice classification is finalized.
- TW-IBR-049 is best handled by code-list validation.
- TW-IBR-050 is handled by executing PINT shared rules before TW-PINT rules.
