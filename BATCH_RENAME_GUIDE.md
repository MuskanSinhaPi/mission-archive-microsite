# 🚀 Automatic Batch Rename Guide - No Manual Work!

## Don't worry! I've created scripts that will rename ALL your files in seconds.

---

## 📝 Quick Summary

**You have 3 options:**
1. **Python script** (recommended - works on all systems)
2. **Bash script** (Mac/Linux)
3. **PowerShell script** (Windows)

All scripts do the same thing: automatically rename your files to:
- `gallery-001.jpg`
- `gallery-002.jpg`
- `gallery-003.jpg`
- ... and so on

**Time required: 5-10 seconds** ⚡

---

## ✨ Option 1: Python Script (Recommended - Works Everywhere!)

### Step 1: Download the script
The script is already here: `/app/rename_gallery.py`

### Step 2: Run it

**On Mac/Linux:**
```bash
cd /path/to/your/images/folder
python3 /app/rename_gallery.py .
```

**On Windows:**
```cmd
cd C:\path\to\your\images\folder
python rename_gallery.py .
```

**Alternative - Interactive mode:**
```bash
python3 rename_gallery.py
# Then enter your folder path when asked
```

### Step 3: Done! ✅
All your files are now renamed with the gallery-001, gallery-002 format!

---

## 🍎 Option 2: Bash Script (Mac/Linux)

### Step 1: Make script executable
```bash
chmod +x /app/rename_gallery.sh
```

### Step 2: Run it
```bash
# Navigate to your images folder first
cd /path/to/your/images/folder

# Run the script
/app/rename_gallery.sh .
```

**Or specify the path directly:**
```bash
/app/rename_gallery.sh /path/to/your/images/folder
```

### Step 3: Done! ✅

---

## 🪟 Option 3: PowerShell Script (Windows)

### Step 1: Copy script to your images folder
Copy `/app/rename_gallery.ps1` to the folder with your images.

### Step 2: Enable script execution (first time only)
Open PowerShell as Administrator and run:
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Step 3: Run the script
Right-click on the folder containing your images, select "Open PowerShell window here", then run:
```powershell
.\rename_gallery.ps1
```

### Step 4: Done! ✅

---

## 🎯 What These Scripts Do

**Before:**
```
IMG_20220514_143022.jpg
DSC_0123.jpg
photo.png
my_cansat_pic.jpg
20230515_flight_test.jpg
```

**After:**
```
gallery-001.jpg
gallery-002.jpg
gallery-003.png
gallery-004.jpg
gallery-005.jpg
```

**Features:**
✅ Automatically adds leading zeros (001, 002, 003)
✅ Preserves file extensions (.jpg, .png, .webp, etc.)
✅ Converts extension to lowercase
✅ Maintains chronological order (sorts by filename)
✅ Shows progress with each file
✅ Safe - won't overwrite existing gallery-XXX files
✅ Works with 500+ files in seconds

---

## 📸 For Videos Too!

The scripts also work with video files! Just modify the extensions:

**In Python script (line 13):**
```python
EXTENSIONS = ('.jpg', '.jpeg', '.png', '.webp', '.mp4', '.mov', '.avi')
```

**In Bash script:**
```bash
for ext in jpg jpeg png webp mp4 mov avi; do
```

**In PowerShell script:**
```powershell
$extensions = @("*.jpg", "*.jpeg", "*.png", "*.webp", "*.mp4", "*.mov")
```

---

## ⚠️ Important Notes

### Before Running:
1. **Backup your files first** (optional but recommended)
2. Make sure you're in the correct folder
3. Close any programs that might have the files open

### After Running:
1. Check that files were renamed correctly
2. First few should be gallery-001, gallery-002, etc.
3. Update `TOTAL_ITEMS` in your website's JavaScript

---

## 🔧 Troubleshooting

### "Permission denied" error
**Mac/Linux:**
```bash
chmod +x rename_gallery.sh
# or
sudo python3 rename_gallery.py
```

**Windows:**
- Run PowerShell as Administrator
- Or use the Python script instead

### "Python not found"
Download Python from [python.org](https://www.python.org/downloads/)

### Files already named gallery-XXX
The script will skip them automatically!

### Mixed file types (images + videos)
Modify the `EXTENSIONS` list in the script to include video formats.

---

## 💡 Pro Tips

### Rename in Subfolders Too

**Python script - rename in all subfolders:**
```python
# Modify line 38 to:
image_files.extend(folder.rglob(f"*{ext}"))  # Note: rglob instead of glob
```

### Preview Changes First (Python)
Add this before the rename line:
```python
print(f"Would rename: {file_path.name} → {new_name}")
# Comment out the actual rename line to just preview
```

### Keep Original Names in Log
Redirect output to a file:
```bash
python3 rename_gallery.py > rename_log.txt
```

---

## 🎬 Quick Video Tutorial

### Mac/Linux Terminal:
```bash
# 1. Navigate to images
cd ~/Desktop/cansat_photos

# 2. Run script
python3 /app/rename_gallery.py .

# 3. Wait 5 seconds
# 4. Done! ✅
```

### Windows PowerShell:
```powershell
# 1. Navigate to images
cd C:\Users\You\Desktop\cansat_photos

# 2. Run script
python rename_gallery.py .

# 3. Wait 5 seconds
# 4. Done! ✅
```

---

## 🆘 Still Don't Want to Rename?

### Alternative: Modify the JavaScript Instead

If you absolutely cannot rename files, I can modify the website's auto-generate function to work with your existing file names. 

**Just tell me:**
1. What are your current file names like? (e.g., `IMG_1234.jpg`, `photo1.jpg`)
2. Are they in any particular order?
3. What extensions do you have? (.jpg, .png, .mp4, etc.)

And I'll update the JavaScript to match your naming pattern!

---

## ✅ After Renaming

1. **Move files to website:**
   ```
   /app/assets/images/gallery/
   ```

2. **Update JavaScript in index.html:**
   ```javascript
   const TOTAL_ITEMS = 500;  // Your actual count
   ```

3. **Uncomment auto-generate:**
   ```javascript
   generateGalleryItems();  // Remove the // at the start
   ```

4. **Test it:**
   Open `index.html` in your browser and check if gallery works!

---

## 📞 Need Help?

Choose the easiest option for your system:
- **Any system:** Python script (most reliable)
- **Mac:** Bash script (fastest)
- **Windows:** Python or PowerShell

All three do the exact same thing - just pick whichever you're comfortable with!

**The rename takes literally 5-10 seconds for 500 files.** 🚀

---

## Summary

1. Download one of the scripts (already in `/app/`)
2. Run it in your images folder
3. Wait a few seconds
4. All files automatically renamed!
5. Move renamed files to website folder
6. Update website config
7. Done! 🎉

**No manual work required!** Just run the script and grab a coffee ☕
