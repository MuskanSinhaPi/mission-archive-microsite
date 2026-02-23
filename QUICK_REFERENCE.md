# Quick Reference: File Locations in HTML

This document shows you exactly which line numbers in `index.html` to edit for different content.

---

## 🎯 Quick Jump Guide

| Content Type | Line Number | Search For |
|--------------|-------------|------------|
| Hero Image | ~151 | `📸 HERO IMAGE PLACEHOLDER` |
| Gallery Images | ~415 | `📸 GALLERY IMAGES PLACEHOLDER` |
| Team Members | ~578 | `👥 TEAM MEMBERS PLACEHOLDER` |
| Document Links | ~465 | `📄 DOCUMENT LINKS PLACEHOLDER` |
| Contact Email | ~640 | `📧 CONTACT EMAIL PLACEHOLDER` |
| Loading Duration | ~683 | `setTimeout` |

---

## 📝 Common Edits

### 1. Change Project Name or Tagline
**Lines: 158-166**
```html
<h1 class="text-5xl md:text-7xl font-bold mb-6 gradient-text">
    IN-SPACe CanSat  <!-- Change this -->
</h1>
<p class="text-xl md:text-2xl text-gray-300 mb-8 max-w-3xl mx-auto">
    India Student Competition 2022-'24  <!-- Change this -->
</p>
```

---

### 2. Add Hero Background Image
**Line: ~151**

Find:
```html
<!-- <div class="absolute inset-0 bg-cover bg-center opacity-20" style="background-image: url('assets/images/hero-image.jpg');"></div> -->
```

Change to:
```html
<div class="absolute inset-0 bg-cover bg-center opacity-20" style="background-image: url('assets/images/hero-image.jpg');"></div>
```

---

### 3. Update Gallery Image
**Lines: 421-432 (repeat for each image)**

Template:
```html
<div class="mission-card rounded-lg overflow-hidden cursor-pointer gallery-item" 
     onclick="openModal('assets/images/gallery/gallery-1.jpg')">
    <img src="assets/images/gallery/gallery-1.jpg" 
         alt="Your Description" 
         class="w-full h-48 object-cover">
</div>
```

**Important:** Update BOTH occurrences:
1. `onclick="openModal('path/here')"` 
2. `<img src="path/here"`

---

### 4. Add New Gallery Image
Copy this block and paste it in the gallery grid (after line 432):

```html
<div class="mission-card rounded-lg overflow-hidden cursor-pointer gallery-item" 
     onclick="openModal('assets/images/gallery/gallery-NEW.jpg')">
    <img src="assets/images/gallery/gallery-NEW.jpg" 
         alt="Description" 
         class="w-full h-48 object-cover">
</div>
```

---

### 5. Link a PDF Document
**Lines: 472-550 (Technical Archive section)**

Find a card template and update the `href`:
```html
<a href="assets/documents/YOUR-FILE.pdf" 
   target="_blank"
   class="mission-card rounded-xl p-6 text-center hover:scale-105 transition-transform block">
    <div class="text-4xl mb-3">📋</div>
    <h3 class="text-xl font-bold text-cyan-400 mb-2">Document Title</h3>
    <p class="text-sm text-gray-400">Description</p>
</a>
```

---

### 6. Update Team Member
**Lines: 584-620 (Team section)**

Template:
```html
<div class="text-center">
    <div class="w-32 h-32 mx-auto rounded-full overflow-hidden border-4 border-cyan-400 mb-4">
        <img src="assets/images/team/member-name.jpg" 
             alt="Member Name" 
             class="w-full h-full object-cover">
    </div>
    <h3 class="text-lg font-bold text-white">Full Name</h3>
    <p class="text-sm text-cyan-400">Role/Title</p>
</div>
```

**Border colors alternate:**
- `border-cyan-400` (cyan)
- `border-purple-400` (purple)

---

### 7. Add New Team Member
Copy the entire block (lines 584-593) and paste it inside the team grid.

---

### 8. Change Contact Email
**Line: ~641**

Find:
```html
📧 Contact: <a href="mailto:team@nspace-cansat.edu" 
                class="text-cyan-400 hover:text-cyan-300">
                team@nspace-cansat.edu
            </a>
```

Update both the `mailto:` and the displayed text.

---

### 9. Update Footer Text
**Lines: 635-650**

```html
<h3 class="text-2xl font-bold mb-4 gradient-text">IN-SPACe CanSat Team</h3>
<p class="text-gray-400 mb-6">India Student Competition 2022-'24</p>
```

---

### 10. Change Loading Screen Duration
**Line: ~684**

```javascript
setTimeout(function() {
    document.getElementById('loading-screen').classList.add('fade-out');
}, 2000);  // 2000 = 2 seconds, 3000 = 3 seconds, etc.
```

---

## 🎨 Color Customization

**Lines: 17-23**

```css
:root {
    --bg-primary: #0B0F19;      /* Main background */
    --accent-cyan: #00D4FF;      /* Cyan highlights */
    --accent-purple: #7C3AED;    /* Purple highlights */
    --text-primary: #F1F5F9;     /* Main text */
    --text-secondary: #94A3B8;   /* Secondary text */
}
```

Change the hex codes to your preferred colors. Use [coolors.co](https://coolors.co/) for palette inspiration.

---

## 🔍 Finding Specific Content

Use your text editor's search function (Ctrl+F / Cmd+F) to find:

| Search For | To Edit |
|------------|---------|
| `PLACEHOLDER` | Any section with placeholder instructions |
| `via.placeholder` | Placeholder images that need replacing |
| `onclick="openModal` | Gallery images |
| `<a href="#"` | Broken links that need PDF paths |
| `Team Member` | Team section placeholders |
| `mailto:` | Contact email |

---

## ⚠️ Common Mistakes to Avoid

1. **File paths are case-sensitive!**
   - ✅ `assets/images/gallery/launch.jpg`
   - ❌ `Assets/Images/Gallery/Launch.jpg`

2. **No spaces in file names!**
   - ✅ `team-photo-1.jpg`
   - ❌ `team photo 1.jpg`

3. **Update BOTH src and onclick for gallery images**
   - `onclick="openModal('path')"`
   - `<img src="path">`

4. **Always close HTML tags**
   - ✅ `<div>...</div>`
   - ❌ `<div>...`

5. **Use relative paths, not absolute**
   - ✅ `assets/images/photo.jpg`
   - ❌ `/Users/you/Desktop/photo.jpg`

---

## 💡 Pro Tips

### Batch Rename Files
If you have 600 images with random names:

**Mac/Linux:**
```bash
cd assets/images/gallery
i=1; for file in *.jpg; do mv "$file" "gallery-$i.jpg"; i=$((i+1)); done
```

**Windows PowerShell:**
```powershell
$i=1; Get-ChildItem *.jpg | ForEach-Object {Rename-Item $_ -NewName "gallery-$i.jpg"; $i++}
```

### Optimize Images
Large images slow down your site. Compress them:
- Online: [TinyPNG](https://tinypng.com/)
- Mac: Use Preview → Export → Reduce Quality
- Windows: Use Paint → Save As → JPEG (reduce quality slider)

**Recommended sizes:**
- Hero image: 1920x1080px, 200-500KB
- Gallery images: 800x600px, 100-200KB each
- Team photos: 300x300px, 50-100KB each

---

## 🐛 Troubleshooting

### Image not showing?
1. Check file path spelling (case-sensitive!)
2. Verify file actually exists in that location
3. Make sure it's .jpg, .png, or .webp (not .heic or .raw)
4. Open browser console (F12) to see error messages

### PDF not opening?
1. Verify `href="assets/documents/file.pdf"` path
2. Check that `target="_blank"` is present
3. Ensure PDF is not corrupted

### Modal not opening?
1. Check `onclick="openModal('path')"` has correct path
2. Make sure JavaScript at bottom of HTML is intact

---

## 📋 Pre-Launch Checklist

Before deploying, test these:

- [ ] Click every gallery image → modal opens?
- [ ] Click every PDF link → opens in new tab?
- [ ] Check on mobile (use browser dev tools)
- [ ] All YouTube videos play?
- [ ] Loading screen appears and fades?
- [ ] Scroll is smooth?
- [ ] All team photos load?
- [ ] Email link works (`mailto:`)?
- [ ] GitHub link works?
- [ ] Google Drive links work?

---

## 📞 Help Commands

**View file tree:**
```bash
tree -L 3 /app/
```

**Check file sizes:**
```bash
du -sh assets/images/*
```

**Test locally:**
```bash
cd /app
python3 -m http.server 8000
# Visit: http://localhost:8000
```

---

That's it! This should make editing your website quick and painless. 🚀
