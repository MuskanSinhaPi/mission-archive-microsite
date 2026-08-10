some media files weren't in the right format for the browser

```
#!/usr/bin/env python3
"""
conversion.py

Convert Claude-generated Markdown entity tables into RFC4180-compliant CSV files
and a multi-sheet Excel workbook.

Requirements:
- Python 3.11+
- pandas
- openpyxl
- pathlib
"""

from pathlib import Path
import pandas as pd

IGNORE_FIELDS = {"Entity_ID", "Priority"}


def parse_markdown(path: Path):
    records = []
    current = {}
    in_table = False

    with path.open("r", encoding="utf-8") as f:
        for raw in f:
            line = raw.rstrip("\n")

            if line.startswith("## ENTITY"):
                if current:
                    records.append(current)
                    current = {}
                in_table = False
                continue

            if line.strip().startswith("| Field | Value |"):
                in_table = True
                continue

            if not in_table:
                continue

            if line.strip().startswith("|---"):
                continue

            if not line.strip().startswith("|"):
                continue

            parts = [p.strip() for p in line.strip().split("|")[1:-1]]
            if len(parts) < 2:
                continue

            field = parts[0]
            value = "|".join(parts[1:]).strip()

            if field in IGNORE_FIELDS:
                continue

            current[field] = value

    if current:
        records.append(current)

    columns = []
    seen = set()
    for record in records:
        for key in record:
            if key not in seen:
                seen.add(key)
                columns.append(key)

    df = pd.DataFrame(records, columns=columns)
    return df


def write_csv(df: pd.DataFrame, path: Path):
    df.to_csv(path, index=False, encoding="utf-8-sig", lineterminator="\r\n")


def write_excel(dfs: dict[str, pd.DataFrame], output: Path):
    with pd.ExcelWriter(output, engine="openpyxl") as writer:
        for sheet, df in dfs.items():
            safe = sheet[:31] or "Sheet"
            df.to_excel(writer, sheet_name=safe, index=False)


def main():
    md_files = sorted(Path(".").glob("*.md"))

    if not md_files:
        print("No markdown files found.")
        return

    workbook = {}
    total_records = 0

    for md in md_files:
        df = parse_markdown(md)
        workbook[md.stem] = df
        csv_path = md.with_suffix(".csv")
        write_csv(df, csv_path)
        total_records += len(df)

    write_excel(workbook, Path("UPSC_Master.xlsx"))

    print("=" * 60)
    print("Conversion Summary")
    print("=" * 60)
    print(f"Markdown files processed : {len(md_files)}")
    print(f"CSV files created        : {len(md_files)}")
    print(f"Excel workbook           : UPSC_Master.xlsx")
    print(f"Total entities           : {total_records}")
    for name, df in workbook.items():
        print(f" - {name}: {len(df)} rows, {len(df.columns)} columns")
    print("=" * 60)


if __name__ == "__main__":
    main()
```
