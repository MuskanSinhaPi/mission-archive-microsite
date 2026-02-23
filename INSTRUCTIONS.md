# N-SPACe CanSat Website - Setup Instructions

## 📁 Folder Structure

Create the following folder structure to organize your media files:

```
/app/
├── index.html                    (✅ Already created)
├── INSTRUCTIONS.md               (✅ This file)
├── assets/
│   ├── images/
│   │   ├── hero-image.jpg       (Your main hero/banner image)
│   │   ├── gallery/             (Gallery images folder)
│   │   │   ├── gallery-1.jpg
│   │   │   ├── gallery-2.jpg
│   │   │   ├── gallery-3.jpg
│   │   │   └── ... (add 12-20 images)
│   │   └── team/                (Team member photos)
│   │       ├── team-1.jpg
│   │       ├── team-2.jpg
│   │       └── ... (one per team member)
│   └── documents/               (PDF documents folder)
│       ├── banner.pdf
│       ├── standee-final.pdf
│       ├── certificate.pdf
│       ├── presentations/
│       │   ├── round-1-pdr.pdf
│       │   ├── round-2-cdr.pdf
│       │   ├── round-3-pa.pdf
│       │   └── round-4-frr.pdf
│       ├── docs/
│       │   └── (8 competition guideline documents)
│       ├── post-flight-review/
│       │   ├── flight-data.csv
│       │   ├── post-flight-report-1.pdf
│       │   └── post-flight-report-2.pdf
│       └── mechanical-parts/
│           └── (SolidWorks files - see note below)
```

---

## 🖼️ Adding Your Images

### 1. Hero Image
**Location:** `/app/assets/images/hero-image.jpg`

**Instructions:**
1. Choose your best mission photo (launch site, team photo, or CanSat beauty shot)
2. Recommended size: 1920x1080px or larger
3. Save as `hero-image.jpg` in `/assets/images/`
4. Open `index.html` and find line ~151 (in the Hero Section)
5. Uncomment this line:
   ```html
   <!-- <div class="absolute inset-0 bg-cover bg-center opacity-20" style="background-image: url('assets/images/hero-image.jpg');"></div> -->
   ```
   Remove the `<!--` and `-->` so it looks like:
   ```html
   <div class="absolute inset-0 bg-cover bg-center opacity-20" style="background-image: url('assets/images/hero-image.jpg');"></div>
   ```

---

### 2. Gallery Images
**Location:** `/app/assets/images/gallery/`

**From your "memories" folder with 600+ images:**
1. Select your best 12-24 images that showcase:
   - Launch day
   - Team working on assembly
   - Testing phases
   - CanSat hardware close-ups
   - Ground control station
   - Flight preparations
   - Team celebrations
   
2. Rename them as: `gallery-1.jpg`, `gallery-2.jpg`, `gallery-3.jpg`, etc.
3. Save them in `/assets/images/gallery/`
4. Open `index.html` and find line ~415 (Gallery Section)
5. Update each gallery item:
   ```html
   <div class="mission-card rounded-lg overflow-hidden cursor-pointer gallery-item" onclick="openModal('assets/images/gallery/gallery-1.jpg')">
       <img src="assets/images/gallery/gallery-1.jpg" alt="Launch Setup" class="w-full h-48 object-cover">
   </div>
   ```
   
6. **To add more gallery items**, copy-paste this block and increment the numbers:
   ```html
   <div class="mission-card rounded-lg overflow-hidden cursor-pointer gallery-item" onclick="openModal('assets/images/gallery/gallery-9.jpg')">
       <img src="assets/images/gallery/gallery-9.jpg" alt="Description" class="w-full h-48 object-cover">
   </div>
   ```

---

### 3. Team Photos
**Location:** `/app/assets/images/team/`

**Instructions:**
1. Collect individual team member photos (preferably square/circular crops)
2. Recommended size: 300x300px minimum
3. Name them: `team-1.jpg`, `team-2.jpg`, etc.
4. Save in `/assets/images/team/`
5. Open `index.html` and find line ~578 (Team Section)
6. Update each team member card:
   ```html
   <div class="text-center">
       <div class="w-32 h-32 mx-auto rounded-full overflow-hidden border-4 border-cyan-400 mb-4">
           <img src="assets/images/team/team-1.jpg" alt="Member Name" class="w-full h-full object-cover">
       </div>
       <h3 class="text-lg font-bold text-white">Member Name</h3>
       <p class="text-sm text-cyan-400">Their Role</p>
   </div>
   ```

7. **To add more team members**, copy-paste this entire block and update the image path, name, and role.

---

## 📄 Adding Your Documents

### 1. PDFs and Presentations
**Location:** `/app/assets/documents/`

**From your local folders:**
- Move `banner.pdf` → `/assets/documents/banner.pdf`
- Move `Standee final.pdf` → `/assets/documents/standee-final.pdf`
- Move `Certificate (1).pdf` → `/assets/documents/certificate.pdf`
- Move presentations folder → `/assets/documents/presentations/`
- Move docs folder → `/assets/documents/docs/`
- Move post-flight-review folder → `/assets/documents/post-flight-review/`

### 2. Linking Documents in HTML
Open `index.html` and find line ~465 (Technical Archive Section)

Update the `href` attributes to point to your files:

```html
<!-- Example: Preliminary Design Review -->
<a href="assets/documents/presentations/round-1-pdr.pdf" class="mission-card rounded-xl p-6 text-center hover:scale-105 transition-transform block" target="_blank">
    <div class="text-4xl mb-3">📋</div>
    <h3 class="text-xl font-bold text-cyan-400 mb-2">Preliminary Design Review</h3>
    <p class="text-sm text-gray-400">Round 1 - PDR Document</p>
</a>
```

**Repeat for all documents:**
- Round 2 CDR → `assets/documents/presentations/round-2-cdr.pdf`
- Round 3 PA → `assets/documents/presentations/round-3-pa.pdf`
- Round 4 FRR → `assets/documents/presentations/round-4-frr.pdf`
- Certificate → `assets/documents/certificate.pdf`
- Banner → `assets/documents/banner.pdf`
- Standee → `assets/documents/standee-final.pdf`

---

## 🔧 SolidWorks Files (.sldasm / .sldprt)

**Important:** Web browsers **cannot directly display** SolidWorks files.

### Options:

#### Option 1: Link to Download (Easiest)
Create a ZIP file of all 21 mechanical parts and upload to Google Drive, then link it:
```html
<a href="https://drive.google.com/your-link-here" target="_blank" class="mission-card...">
    <h3>CAD Files</h3>
    <p>Download SolidWorks Models (21 parts)</p>
</a>
```

#### Option 2: Export as PDF
1. Open each SolidWorks file
2. Export as PDF (File → Save As → PDF)
3. Create a combined PDF or individual PDFs
4. Save in `/assets/documents/mechanical-parts/`
5. Link in the Technical Archive section

#### Option 3: Export as 3D Web Format
1. Export SolidWorks files as `.glTF` or `.obj` format
2. Use a web-based 3D viewer library like [Three.js](https://threejs.org/) or [model-viewer](https://modelviewer.dev/)
3. This requires additional JavaScript setup (let me know if you want help with this!)

#### Option 4: Use External Viewer
Upload to a 3D model hosting service like:
- Sketchfab
- GrabCAD
- Autodesk Viewer

Then embed using iframe.

---

## 👥 Updating Team Information

Find line ~578 in `index.html` (Team Section)

For each team member, update:
```html
<div class="text-center">
    <div class="w-32 h-32 mx-auto rounded-full overflow-hidden border-4 border-cyan-400 mb-4">
        <img src="assets/images/team/member-name.jpg" alt="Member Name" class="w-full h-full object-cover">
    </div>
    <h3 class="text-lg font-bold text-white">Full Name</h3>
    <p class="text-sm text-cyan-400">Role/Title</p>
</div>
```

**To add more team members:**
Copy-paste the entire block and update the information.

---

## 📧 Adding Contact Email

Find line ~640 in `index.html` (Footer Section)

Update the email:
```html
<p class="text-gray-300 mb-8">
    📧 Contact: <a href="mailto:your-email@example.com" class="text-cyan-400 hover:text-cyan-300">your-email@example.com</a>
</p>
```

---

## 🎨 Customization Tips

### Changing Colors
The color scheme is defined at the top of the `<style>` section (line ~20):
```css
:root {
    --bg-primary: #0B0F19;      /* Dark background */
    --accent-cyan: #00D4FF;      /* Cyan accent */
    --accent-purple: #7C3AED;    /* Purple accent */
    --text-primary: #F1F5F9;     /* Light text */
    --text-secondary: #94A3B8;   /* Secondary text */
}
```

### Adjusting Loading Screen Duration
Find line ~683:
```javascript
setTimeout(function() {
    document.getElementById('loading-screen').classList.add('fade-out');
}, 2000);  // Change 2000 to desired milliseconds (2000 = 2 seconds)
```

---

## 🚀 Deployment

### GitHub Pages
1. Create a new repository on GitHub
2. Upload all files (index.html + assets folder)
3. Go to Settings → Pages
4. Select main branch as source
5. Your site will be live at: `https://yourusername.github.io/repo-name/`

### Netlify
1. Drag and drop your entire `/app/` folder to [Netlify](https://app.netlify.com/drop)
2. Done! You'll get a live URL instantly
3. Optional: Connect to GitHub for automatic updates

### Local Testing
Simply open `index.html` in your web browser. Some features may require a local server:
```bash
# Python 3
python -m http.server 8000

# Node.js
npx serve
```
Then visit: `http://localhost:8000`

---

## ✅ Checklist

- [ ] Create `/assets/images/` folder
- [ ] Create `/assets/images/gallery/` folder
- [ ] Create `/assets/images/team/` folder
- [ ] Create `/assets/documents/` folder
- [ ] Add hero image and uncomment line in HTML
- [ ] Add 12-24 gallery images
- [ ] Update gallery image paths in HTML
- [ ] Add team member photos
- [ ] Update team member names and roles
- [ ] Move all PDF documents to `/assets/documents/`
- [ ] Update document links in Technical Archive section
- [ ] Handle SolidWorks files (choose option 1-4 above)
- [ ] Update contact email in footer
- [ ] Test all links and images locally
- [ ] Deploy to GitHub Pages or Netlify

---

## 🆘 Need Help?

If you encounter any issues:
1. Check browser console for errors (F12 → Console tab)
2. Verify all file paths are correct (case-sensitive!)
3. Make sure images are in supported formats (.jpg, .png, .webp)
4. Ensure file names don't have spaces (use hyphens instead)

---

## 📊 Video Links Already Embedded

✅ All 20+ YouTube videos are already embedded in the HTML:
- Launch footage
- Parachute tests (4 videos)
- Structural analysis (2 videos)
- Vacuum chamber tests (2 videos)
- GCS/GUI demos (5 videos)
- Hardware assembly (4 videos)
- Market pitch

✅ External links already configured:
- PCB Files (Google Drive)
- Expenses Sheet (Google Sheets)
- GitHub Repository (GitFront)

---

## 🎉 You're All Set!

Once you've completed the checklist above, your CanSat mission archive website will be fully functional and ready to share via QR code or URL. The design is mobile-optimized and will look great on all devices!

**Estimated time to complete:** 2-3 hours (depending on image selection and organization)
