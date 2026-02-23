# Assets Folder Structure

This folder contains all media files for the CanSat mission archive website.

## 📁 Folder Structure

```
assets/
├── images/
│   ├── gallery/          ← Add your 500 mission photos/videos here
│   │   └── gallery-001.jpg, gallery-002.jpg, etc.
│   └── team/             ← (Not used - team section removed)
│
├── models/               ← Add your 21 glTF (.glb) 3D models here
│   └── part-01.glb, part-02.glb, etc.
│
└── documents/            ← Add your PDF documents here
    ├── presentations/    ← Round 1-4 PDRs, CDRs, etc.
    ├── docs/            ← Competition guidelines
    ├── post-flight-review/  ← Flight data and reports
    └── mechanical-parts/    ← (Optional - for non-glTF CAD files)
```

## 🚀 How to Add Your Files

### Gallery Images (500 files)
1. Rename files using provided scripts (or keep current names)
2. Place in: `assets/images/gallery/`
3. Update `TOTAL_ITEMS` in `index.html`

### 3D Models (21 files)  
1. Convert SolidWorks to .glb format
2. Place in: `assets/models/`
3. Update model-viewer paths in `index.html`

### Documents
1. Place PDFs in appropriate subfolders
2. Update links in Technical Archive section of `index.html`

## 📖 Documentation

- See `GALLERY_AND_3D_GUIDE.md` for gallery and 3D setup
- See `BATCH_RENAME_GUIDE.md` for automatic file renaming
- See `INSTRUCTIONS.md` for complete setup guide

## ⚠️ Note

These folders are currently empty (except for `.gitkeep` files). The `.gitkeep` files ensure Git tracks these folders even when empty. Once you add your media files, you can delete the `.gitkeep` files if desired (they're harmless either way).
