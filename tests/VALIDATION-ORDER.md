# TW-PINT Validation Order

1. Validate XML against UBL 2.1 schema.
2. Validate XML against PINT International shared rules.
3. Validate XML against `schematron/TW-PINT-v0.1.sch`.
4. Validate jurisdiction code lists with Genericode.
5. Compare validation outputs with `tests/expected-results/`.
