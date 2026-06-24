#!/usr/bin/env python3
from pathlib import Path
import csv

ROOT = Path(__file__).resolve().parents[1]
PARTIALS = ROOT / "docs/modules/ROOT/partials"

def read_csv(path):
    with open(path, newline="", encoding="utf-8") as f:
        return list(csv.reader(f))

def esc_cell(value):
    value = (value or "").replace("\n", " ")
    value = value.replace("|", r"\|")
    value = value.replace("{", r"\{").replace("}", r"\}")
    return value

def adoc_table(data, cols):
    headers, rows = data[0], data[1:]
    out = [f'[cols="{cols}", options="header"]', "|===", "|" + " |".join(esc_cell(h) for h in headers)]
    for r in rows:
        padded = r + [""] * (len(headers) - len(r))
        out.append("|" + " |".join(esc_cell(x) for x in padded[:len(headers)]))
    out.append("|===")
    return "\n".join(out) + "\n"

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
