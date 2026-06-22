# TW-PINT Schematron Notes v0.1

## Rule coverage

Directly implemented:

- TW-IBR-001~004
- TW-IBR-006~045

Reserved or external:

- TW-IBR-005: UBL XML Schema validation
- TW-IBR-046~048: export conditions require final TW invoice classification
- TW-IBR-049: code-list validation using genericode
- TW-IBR-050: inherited PINT shared rule validation

## Known design issue

TW-IBR-017 and TW-IBR-018 currently treat Buyer UBN as mandatory.
In v0.2, these should be conditional:

- mandatory for domestic Taiwan B2B
- optional or foreign-tax-identifier based for cross-border inbound/outbound

## Recommended repo placement

```text
schematron/
  TW-PINT-v0.1.sch
  TW-PINT-Schematron-Notes.md
```
