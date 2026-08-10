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
# Media Format Handling & Cloudinary Workarounds

## Overview

The gallery stores media files in **Cloudflare R2**. Most common formats
can be served directly from R2, while formats with inconsistent browser
support can be routed through Cloudinary Fetch.

``` text
Supported format → R2 → Browser

Problematic format → R2 → Cloudinary → Browser-compatible output
```

This preserves the original files in R2 and avoids manually converting
large numbers of files.

## Formats served directly from R2

### Images

-   `.jpg`
-   `.jpeg`
-   `.png`
-   `.webp`
-   `.gif`
-   `.avif`

### Videos

-   `.mp4`
-   `.webm`

`MOV` can also be served directly when its internal codec is
browser-compatible.

## Formats that may need Cloudinary

Currently relevant: - `.avi` --- video - `.heic` --- image - `.heif` ---
image

The extension alone does not guarantee compatibility. Containers such as
AVI and MOV can contain different codecs.

# AVI → Cloudinary → MP4

Mini spy-camera recordings are stored as `.AVI`. Browser support for
arbitrary AVI codecs is unreliable.

Keep the original AVI in R2 and use Cloudinary Fetch:

``` text
R2 AVI
  ↓
Cloudinary Fetch
  ↓
MP4
  ↓
Browser
```

Use the Cloudinary video endpoint:

``` text
/video/fetch/f_mp4,q_auto/
```

Example:

``` text
https://res.cloudinary.com/YOUR_CLOUD_NAME/video/fetch/f_mp4,q_auto/ENCODED_R2_URL
```

-   `video/fetch` fetches the source from R2.
-   `f_mp4` requests MP4 output.
-   `q_auto` automatically optimizes quality.

The R2 URL embedded in the Cloudinary URL should be URL-encoded.

# HEIC / HEIF → Cloudinary → Browser-Compatible Image

HEIC/HEIF are common for iPhone photos, but browser support is
inconsistent.

Instead of manually converting hundreds of photos:

``` text
HEIC/HEIF in R2
  ↓
Cloudinary Image Fetch
  ↓
Browser-compatible image
  ↓
Browser
```

Keep the original files in R2.

Use:

``` text
/image/fetch/f_auto,q_auto/
```

Example:

``` text
https://res.cloudinary.com/YOUR_CLOUD_NAME/image/fetch/f_auto,q_auto/ENCODED_R2_URL
```

-   `image/fetch` fetches the source from R2.
-   `f_auto` lets Cloudinary choose a suitable output format.
-   `q_auto` optimizes image quality.

# Implementing the workaround in `index.html`

The gallery's `mediaSrc()` helper can decide whether to serve directly
from R2 or route through Cloudinary.

Conceptually:

``` javascript
function mediaSrc(folder, filename) {
    const r2Url = `${R2_BASE}${folder}/${encodeURIComponent(filename)}`;

    // AVI → Cloudinary video conversion
    if (/\.avi$/i.test(filename)) {
        return `https://res.cloudinary.com/YOUR_CLOUD_NAME/video/fetch/f_mp4,q_auto/${encodeURIComponent(r2Url)}`;
    }

    // HEIC / HEIF → Cloudinary image conversion
    if (/\.(heic|heif)$/i.test(filename)) {
        return `https://res.cloudinary.com/YOUR_CLOUD_NAME/image/fetch/f_auto,q_auto/${encodeURIComponent(r2Url)}`;
    }

    // Normal browser-supported media → direct R2
    return r2Url;
}
```

Replace `YOUR_CLOUD_NAME` and `R2_BASE` with the project's actual
values.

## Why AVI and HEIC use different Cloudinary endpoints

Do not use the video endpoint for images or the image endpoint for
videos.

### Video

``` text
/video/fetch/f_mp4,q_auto/
```

### Image

``` text
/image/fetch/f_auto,q_auto/
```

# Adding another unsupported format

For another problematic image format:

``` javascript
if (/\.(heic|heif|someformat)$/i.test(filename)) {
    return `https://res.cloudinary.com/YOUR_CLOUD_NAME/image/fetch/f_auto,q_auto/${encodeURIComponent(r2Url)}`;
}
```

For another problematic video format:

``` javascript
if (/\.(avi|somevideoformat)$/i.test(filename)) {
    return `https://res.cloudinary.com/YOUR_CLOUD_NAME/video/fetch/f_mp4,q_auto/${encodeURIComponent(r2Url)}`;
}
```

Do not route every format through Cloudinary unnecessarily.

# Test a format before relying on it

For a new format:

1.  Upload one representative file to R2.
2.  Confirm the direct R2 URL works.
3.  Construct the Cloudinary Fetch URL.
4.  Confirm Cloudinary successfully converts/displays it.
5.  Only then add the extension to `mediaSrc()`.

This is especially important for AVI because different AVI files can
contain different codecs.

# Keep the originals

The workaround does not require deleting or replacing originals.

Recommended structure:

``` text
R2
└── gallery/
    ├── photos/
    │   ├── IMG_001.JPG
    │   ├── IMG_002.HEIC
    │   └── IMG_003.HEIC
    │
    └── Videos-Mini-Spy-Cam/
        ├── MOVI0001.AVI
        ├── MOVI0002.AVI
        └── MOVI0003.AVI
```

Delivery can then be:

``` text
HEIC → Cloudinary → browser
AVI  → Cloudinary → MP4 → browser
JPG  → R2 → browser
PNG  → R2 → browser
MP4  → R2 → browser
```

while the original archive remains untouched.

# Practical format policy

  Format     Storage   Delivery
  ---------- --------- ---------------------------------------
  JPG/JPEG   R2        Direct R2
  PNG        R2        Direct R2
  WebP       R2        Direct R2
  GIF        R2        Direct R2
  AVIF       R2        Direct R2
  MP4        R2        Direct R2
  WebM       R2        Direct R2
  MOV        R2        Direct R2 if browser-compatible
  AVI        R2        Cloudinary → MP4
  HEIC       R2        Cloudinary → browser-compatible image
  HEIF       R2        Cloudinary → browser-compatible image

# Future improvement

If media URL generation is eventually moved into the Cloudflare Worker,
the format policy can be centralized there:

``` text
                    ┌── JPG/PNG/MP4 ──→ R2 ──→ Browser
                    │
R2 → Worker ────────┼── HEIC/HEIF ────→ Cloudinary ──→ Browser
                    │
                    └── AVI ──────────→ Cloudinary → MP4 → Browser
```

This keeps format-handling logic in one place rather than in the
frontend.
