# PDK UI changes

This revision introduces two distinct page types matching the official PINT publication pattern:

1. `landing` layout for the TW-PINT start page, with Documentation and Transactions cards.
2. `default` documentation layout with a fixed left-side Table of Contents.

The five BIS chapters remain separate AsciiDoc files, but `bis/index.adoc` includes all five sources into one generated HTML page using `include::page$...[]` and `leveloffset=+1`.
