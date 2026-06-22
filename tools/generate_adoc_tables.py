#!/usr/bin/env python3
from pathlib import Path
import csv

ROOT = Path(__file__).resolve().parents[1]
PARTIALS = ROOT / "docs/modules/ROOT/partials"

def adoc_table(data, cols):
    headers, rows = data[0], data[1:]
    out = [f'[cols="{cols}", options="header"]', "|===", "|" + " |".join(headers)]
    for r in rows:
        out.append("|" + " |".join((x or "").replace("\n", " ") for x in r))
    out.append("|===")
    return "\n".join(out) + "\n"

def read_csv(path):
    with open(path, newline="", encoding="utf-8") as f:
        return list(csv.reader(f))

PARTIALS.mkdir(parents=True, exist_ok=True)
(PARTIALS / "semantic-table.adoc").write_text(
    adoc_table(read_csv(ROOT / "semantic-model/TW-PINT-Core-Business-Terms-v0.1.csv"), "1,2,4,1,1,2,5,2"),
    encoding="utf-8"
)
(PARTIALS / "rules-table.adoc").write_text(
    adoc_table(read_csv(ROOT / "rules/TW-PINT-Rules-Catalogue-v0.1.csv"), "1,2,2,1,4,1,2,4,4,4,2,1,3"),
    encoding="utf-8"
)
print("AsciiDoc partial tables generated.")
