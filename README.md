# IN-SPACe CanSat Mission Archive 🛰️
* Re-run the bash script to make sure assets/images/gallery/index.json is up to date, since that's what powers your gallery.
* Open with VS Code live server to ensure rendering of glb files

* The 7-8 minute load time is because Netlify's free tier has no CDN caching for large binary files — it serves them fresh from their origin server every time. Hence,
##Cloudflare R2 
- Free for first 10GB storage + 1M requests/month 
- Much faster than Netlify for binary files since it's a proper object store with CDN 
- Upload your assets/images/gallery/, assets/models/ folders to R2, then update the paths in index.html to point to your R2 public URL 
- Keep index.html and the rest of the code on Netlify - offloads the heavy assets to R2
- Updated with cloudflare r2 wrangler binding to sync with the bucket in real time, instead of relying on index.json generated from running bash script (on media stored locally)

For embedding the Instagram feed:
https://fouita.com

> India Student Competition 2022-'24 | Official Mission Archive Website 

![CanSat](https://img.shields.io/badge/CanSat-India%202022--24-00D4FF?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Ready%20to%20Deploy-7C3AED?style=for-the-badge)

https://time-capsule-cansat.netlify.app/
---

## 🚀 About

A single-page, aerospace-themed mission archive showcasing our dual-parachute CanSat project with:
- 📡 Telemetry systems & ground control station
- 🪂 Novel descent control (800-900m altitude)
- 📹 20+ test videos embedded
- 📊 Complete technical documentation
- 🔧 Open-source flight software

**Tech Stack:** Pure HTML + TailwindCSS + Vanilla JS (No frameworks, no build tools!)

---

## 📁 Project Structure

```
/app/
├── index.html                    # Main website (single file!)
├── INSTRUCTIONS.md               # Detailed setup guide
├── QUICK_REFERENCE.md            # Quick edit reference
├── README.md                     # This file
└── assets/
    ├── images/
    │   ├── hero-image.jpg       # Main banner (add yours)
    │   ├── gallery/             # Mission photos (12-24 images)
    │   └── team/                # Team member photos
    └── documents/
        ├── presentations/       # PDR, CDR, PA, FRR
        ├── docs/                # Competition guidelines
        ├── post-flight-review/  # Flight data & reports
        └── mechanical-parts/    # CAD files
```

---

## ⚡ Quick Start

### Option 1: Open Locally
```bash
# Just open the file in your browser
open index.html

# Or use a local server
python3 -m http.server 8000
# Visit: http://localhost:8000
```

### Option 2: Deploy to GitHub Pages
```bash
git init
git add .
git commit -m "Initial CanSat website"
git remote add origin https://github.com/yourusername/cansat-archive.git
git push -u origin main

# Then: Settings → Pages → Enable from main branch
```

### Option 3: Deploy to Netlify (Instant!)
1. Visit [https://app.netlify.com/drop](https://app.netlify.com/drop)
2. Drag and drop your `/app/` folder
3. Done! Get instant live URL 🎉

---

## 🎨 Adding Your Content

### 1️⃣ Add Images
```bash
# Place your files here:
/app/assets/images/hero-image.jpg          # Main hero image
/app/assets/images/gallery/gallery-1.jpg   # Gallery images (1-24)
/app/assets/images/team/member-1.jpg       # Team photos
```

### 2️⃣ Add Documents
```bash
# Place your PDFs here:
/app/assets/documents/presentations/round-1-pdr.pdf
/app/assets/documents/certificate.pdf
# etc...
```

### 3️⃣ Update Links in HTML
Open `index.html` and search for `PLACEHOLDER` comments. Follow instructions in:
- **Detailed guide:** Read `INSTRUCTIONS.md`
- **Quick edits:** Read `QUICK_REFERENCE.md`

---

## ✨ Features

✅ **Fully Responsive** - Looks great on mobile, tablet, and desktop  
✅ **20+ Embedded Videos** - All YouTube links pre-configured  
✅ **Interactive Gallery** - Click-to-expand modal viewer  
✅ **Animated Loading** - Rotating satellite CSS animation  
✅ **Smooth Scrolling** - Elegant navigation  
✅ **Dark Aerospace Theme** - Professional color scheme  
✅ **Zero Dependencies** - No npm, no build process, just HTML!  
✅ **SEO Optimized** - Proper meta tags included  
✅ **Fast Loading** - TailwindCSS via CDN  

---

## 🎥 Already Embedded Videos

All your YouTube videos are already embedded in the HTML:

### 🚀 Launch & Flight
- Launch Footage
- Parachute Drop Test (4 videos)

### 🔬 Testing
- Vacuum Chamber Test (2 videos)
- Stress Analysis (2 videos)
- Fit Checks (2 videos)

### 📡 Ground Control Station
- GCS Antenna Test
- GUI Screens (5 videos)
- Command Driven Telemetry

### 🔩 Hardware
- Gimbals Assembly (2 videos)

### 💼 Pitch
- Market Pitch Video

---

## 🔗 Already Linked

✅ **PCB Files:** [Google Drive](https://drive.google.com/drive/folders/1-6vWWqyMcqOk9krhG9UcuysliCXriQcr?usp=sharing)  
✅ **Expenses Sheet:** [Google Sheets](https://docs.google.com/spreadsheets/d/1UrNcDHcNbDJlOdZoYKsPUh3RoyIXFAcneJwhZDgFGjg/edit?usp=sharing)  
✅ **GitHub Repo:** [GitFront](https://gitfront.io/r/Muskan-Sinha/5N6r48CaceFi/CanSat-India-Updated/)  

---

## 📱 Mobile QR Code Ready

This website is optimized for QR code sharing! Perfect for:
- Competition presentations
- Portfolio showcases
- Team recruiting
- Academic submissions

Generate QR code at: [qr-code-generator.com](https://www.qr-code-generator.com/)

---

## 🎨 Customization

### Change Colors
Edit CSS variables in `index.html` (lines 17-23):
```css
:root {
    --bg-primary: #0B0F19;      /* Background */
    --accent-cyan: #00D4FF;      /* Primary accent */
    --accent-purple: #7C3AED;    /* Secondary accent */
    --text-primary: #F1F5F9;     /* Text color */
}
```

### Change Loading Duration
Find line ~684 in `index.html`:
```javascript
setTimeout(function() {
    document.getElementById('loading-screen').classList.add('fade-out');
}, 2000);  // Change milliseconds here
```

---

## 📊 Performance

- **Page Size:** ~50KB (HTML only)
- **Load Time:** <2 seconds (excluding images)
- **Dependencies:** TailwindCSS CDN only
- **Browser Support:** All modern browsers
- **Mobile Optimized:** Yes, responsive design

---

## 🐛 Troubleshooting

**Images not showing?**
- Check file paths (case-sensitive!)
- Verify files exist in `/assets/images/`
- Open browser console (F12) for errors

**PDFs not opening?**
- Check `href` paths in HTML
- Ensure `target="_blank"` is present
- Verify PDFs are in `/assets/documents/`

**Videos not playing?**
- YouTube links are already embedded
- Check internet connection
- Verify video IDs are correct

---

## 📝 To-Do Checklist

Before going live:

- [ ] Add your hero image
- [ ] Add 12-24 gallery images
- [ ] Add team member photos
- [ ] Upload all PDF documents
- [ ] Update team names and roles
- [ ] Update contact email
- [ ] Test all links and images
- [ ] Test on mobile device
- [ ] Deploy to hosting platform
- [ ] Generate QR code

---

## 🤝 Credits

**Team:** IN-SPACe CanSat  
**Competition:** India Student Competition 2022-'24  
**Design:** Aerospace-inspired dark theme  
**Built with:** HTML5, TailwindCSS, JavaScript  

---

## 📄 License

This website template is open for educational use. Feel free to modify and adapt for your own CanSat or aerospace projects!

---

## 🆘 Need Help?

📖 Read: `INSTRUCTIONS.md` for detailed setup  
⚡ Quick edits: `QUICK_REFERENCE.md`  
🐛 Issues: Check browser console (F12)  

---

**Made with 🚀 for aerospace excellence**
