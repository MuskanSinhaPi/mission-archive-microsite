# 🚀 Deployment Checklist - CanSat Mission Archive

Complete this checklist before deploying your website!

---

## 📋 Pre-Deployment Checklist

### Phase 1: Content Preparation (30-60 minutes)

#### Images
- [ ] **Hero Image** 
  - [ ] Selected best hero/banner image
  - [ ] Resized to ~1920x1080px
  - [ ] Compressed to <500KB
  - [ ] Saved as `/assets/images/hero-image.jpg`
  - [ ] Uncommented line ~151 in `index.html`

- [ ] **Gallery Images** (recommended: 12-24 images)
  - [ ] Selected best mission photos from 600+ images
  - [ ] Renamed as `gallery-1.jpg`, `gallery-2.jpg`, etc.
  - [ ] Resized to ~800x600px
  - [ ] Compressed to <200KB each
  - [ ] Saved in `/assets/images/gallery/`
  - [ ] Updated image paths in HTML (lines 421-432)
  - [ ] Added/removed gallery grid items as needed

- [ ] **Team Photos**
  - [ ] Collected all team member photos
  - [ ] Cropped to square (300x300px recommended)
  - [ ] Compressed to <100KB each
  - [ ] Saved as `/assets/images/team/member-name.jpg`
  - [ ] Updated team section in HTML (lines 584-620)
  - [ ] Updated names and roles for each member

#### Documents
- [ ] **PDF Files**
  - [ ] Moved `banner.pdf` to `/assets/documents/`
  - [ ] Moved `Standee final.pdf` to `/assets/documents/standee-final.pdf`
  - [ ] Moved `Certificate (1).pdf` to `/assets/documents/certificate.pdf`
  - [ ] Moved all presentation PDFs to `/assets/documents/presentations/`
  - [ ] Moved all docs to `/assets/documents/docs/`
  - [ ] Moved post-flight files to `/assets/documents/post-flight-review/`
  - [ ] Updated all document links in Technical Archive section (lines 472-550)

- [ ] **SolidWorks Files** (Choose one or more options from SOLIDWORKS_OPTIONS.md)
  - [ ] Option 1: Created ZIP and uploaded to Google Drive
  - [ ] Option 2: Exported as PDFs
  - [ ] Option 3: Exported as images
  - [ ] Updated CAD Files link in HTML (line ~534)

#### Text Content
- [ ] **Team Information**
  - [ ] Updated all team member names
  - [ ] Updated all team member roles
  - [ ] Verified spelling of names

- [ ] **Contact Information**
  - [ ] Updated contact email in footer (line ~641)
  - [ ] Tested `mailto:` link works

- [ ] **Custom Text** (if desired)
  - [ ] Modified project tagline if needed
  - [ ] Adjusted mission stats/numbers
  - [ ] Updated footer text

---

### Phase 2: Technical Verification (15 minutes)

#### File Structure
- [ ] Verified folder structure matches:
  ```
  /app/
  ├── index.html
  ├── assets/
  │   ├── images/
  │   │   ├── hero-image.jpg
  │   │   ├── gallery/
  │   │   └── team/
  │   └── documents/
  ```

#### File Paths
- [ ] All image paths use lowercase
- [ ] No spaces in any file names
- [ ] All paths use forward slashes `/` not backslashes `\`
- [ ] All paths are relative (not absolute like `C:\Users\...`)

#### HTML Validation
- [ ] No broken `<a href="#">` tags remain
- [ ] All `onclick="openModal(...)"` have matching image paths
- [ ] All `<img src="...">` paths are correct
- [ ] All document links have `target="_blank"`
- [ ] No placeholder URLs remain (`via.placeholder.com`)

---

### Phase 3: Testing (20 minutes)

#### Desktop Testing
Open `index.html` in your browser and test:

- [ ] **Loading Screen**
  - [ ] Satellite animation appears
  - [ ] Fades out after 2 seconds
  - [ ] Page content loads correctly

- [ ] **Hero Section**
  - [ ] Background image displays (if added)
  - [ ] Text is readable
  - [ ] "Explore the Mission" button works
  - [ ] Smooth scroll to Mission Overview

- [ ] **Mission Overview**
  - [ ] All 3 cards display correctly
  - [ ] Hover effects work

- [ ] **System Architecture**
  - [ ] All 4 cards display correctly
  - [ ] Icons and text aligned

- [ ] **Flight & Testing Videos**
  - [ ] Launch footage video loads
  - [ ] All parachute test videos load (4 videos)
  - [ ] Structural analysis videos load (2 videos)
  - [ ] Environmental testing videos load (2 videos)
  - [ ] GCS videos load (5 videos)
  - [ ] Hardware assembly videos load (4 videos)
  - [ ] Market pitch video loads
  - [ ] All videos can play
  - [ ] Videos don't autoplay

- [ ] **Gallery**
  - [ ] All images display correctly
  - [ ] Click any image → modal opens
  - [ ] Modal shows full-size image
  - [ ] Click X or outside modal → closes
  - [ ] ESC key closes modal

- [ ] **Technical Archive**
  - [ ] All PDF links work
  - [ ] PDFs open in new tab
  - [ ] Google Drive links work (PCB, Expenses)
  - [ ] No `#` broken links remain
  - [ ] CAD files link works

- [ ] **GitHub Section**
  - [ ] GitHub link opens correctly
  - [ ] Opens in new tab

- [ ] **Team Section**
  - [ ] All team photos display
  - [ ] Names and roles are correct
  - [ ] Circular borders display correctly

- [ ] **Footer**
  - [ ] Contact email link works
  - [ ] Opens mail client with correct address
  - [ ] Year is correct (update if needed)

#### Mobile Testing
Use browser dev tools (F12) → Toggle device toolbar, or test on actual phone:

- [ ] Responsive layout works
- [ ] All text is readable
- [ ] Images scale properly
- [ ] Videos are not too small
- [ ] Gallery grid adapts to mobile
- [ ] Team photos display in grid
- [ ] No horizontal scrolling
- [ ] Touch interactions work
- [ ] Modal works on touch

#### Browser Testing
Test in multiple browsers:
- [ ] Chrome/Edge
- [ ] Firefox
- [ ] Safari (if available)

#### Performance Testing
- [ ] Page loads in <3 seconds (excluding videos)
- [ ] No console errors (F12 → Console tab)
- [ ] Images are optimized (<200KB each for gallery)
- [ ] Smooth scrolling works

---

### Phase 4: Final Review (10 minutes)

#### Content Accuracy
- [ ] All information is accurate
- [ ] No placeholder text remains
- [ ] Spelling and grammar checked
- [ ] Mission specs are correct
- [ ] YouTube links all work
- [ ] External links (Google Drive, GitHub) work

#### Visual Polish
- [ ] Colors look professional
- [ ] Spacing is consistent
- [ ] Alignment is correct
- [ ] No overlapping text
- [ ] Icons display correctly
- [ ] Gradient effects work

#### SEO & Meta
- [ ] Page title is correct (appears in browser tab)
- [ ] Meta description is relevant
- [ ] Favicon works (if you added one)

---

### Phase 5: Deployment (10-30 minutes)

Choose your deployment method:

#### Option A: GitHub Pages
- [ ] Created GitHub repository
- [ ] Pushed all files to main branch
- [ ] Enabled GitHub Pages in Settings
- [ ] Tested live URL: `https://yourusername.github.io/repo-name/`
- [ ] All assets load correctly on live site
- [ ] Videos play on live site

#### Option B: Netlify
- [ ] Dragged `/app/` folder to Netlify Drop
- [ ] Received live URL
- [ ] Tested live URL
- [ ] All assets load correctly
- [ ] Videos play on live site
- [ ] Optional: Custom domain configured

#### Option C: Local Server (Testing Only)
- [ ] Ran local server: `python3 -m http.server 8000`
- [ ] Tested at `http://localhost:8000`
- [ ] Shared URL with team for review

---

### Phase 6: Post-Deployment (15 minutes)

#### Quality Assurance
- [ ] Opened live URL on desktop
- [ ] Opened live URL on mobile phone
- [ ] Tested all links on live site
- [ ] Tested all videos on live site
- [ ] Tested gallery modal on live site
- [ ] Loaded site on 3G/4G (not just WiFi)
- [ ] Checked page load speed

#### Sharing
- [ ] Generated QR code for live URL
- [ ] Tested QR code with phone camera
- [ ] Shared URL with team members
- [ ] Collected feedback
- [ ] Made any final adjustments

#### Documentation
- [ ] Saved live URL
- [ ] Documented any custom changes made
- [ ] Backed up all source files
- [ ] Took screenshots of live site

---

## 🎯 Quick Test Script

Run through this 2-minute test on your live site:

1. ⏱️ **Load Test:** Open site → Loading animation → Content appears
2. 🖼️ **Images:** Scroll through → All images load
3. 🎥 **Videos:** Click play on 3 random videos → All play
4. 🖱️ **Gallery:** Click 3 gallery images → Modal works
5. 📄 **Docs:** Click 3 PDF links → PDFs open
6. 🔗 **External:** Click GitHub, Google Drive links → Work
7. 📱 **Mobile:** Open on phone → Looks good

If all 7 pass → **You're ready to launch!** 🚀

---

## 🐛 Common Issues & Fixes

| Issue | Likely Cause | Fix |
|-------|-------------|-----|
| Images don't load | Wrong file path | Check capitalization, use relative paths |
| PDF doesn't open | Missing `target="_blank"` | Add attribute to `<a>` tag |
| Modal doesn't open | Wrong onclick path | Match path in both `onclick` and `src` |
| Videos don't play | YouTube link issue | Verify embed URL format |
| Mobile looks broken | Missing viewport meta | Already included in template |
| Slow loading | Large images | Compress images to <200KB |

---

## 📊 Optimization Checklist (Optional)

Want to make your site even better?

- [ ] Compressed all images with [TinyPNG](https://tinypng.com/)
- [ ] Added favicon (16x16 icon in browser tab)
- [ ] Optimized PDFs with [SmallPDF](https://smallpdf.com/compress-pdf)
- [ ] Enabled HTTPS (automatic on GitHub Pages & Netlify)
- [ ] Added Open Graph meta tags for social sharing
- [ ] Tested with Google Lighthouse (score >90)
- [ ] Added Google Analytics (if needed)

---

## ✅ Launch Announcement

Once deployed, share with:

- [ ] Competition organizers
- [ ] Team members
- [ ] University/institution
- [ ] Social media (LinkedIn, Twitter)
- [ ] Portfolio websites
- [ ] Resume/CV

**Template message:**
```
🚀 Excited to share our IN-SPACe CanSat mission archive! 

Our team competed in the India Student Competition 2022-'24, 
designing a dual-parachute deployment system launched to 800-900m.

Check out our flight tests, telemetry systems, and complete 
technical documentation:

[YOUR-LIVE-URL]

#CanSat #Aerospace #Engineering #StudentProject
```

---

## 🎉 You're Done!

Congratulations! Your CanSat mission archive website is now live and ready to share with the world.

**Final checklist items:**
- ✅ All content added
- ✅ All tests passed  
- ✅ Site deployed
- ✅ QR code generated
- ✅ URL shared

**Your website showcases:**
- 📡 20+ test videos
- 🖼️ Mission photo gallery
- 📄 Complete technical documentation
- 👥 Team information
- 💻 Open-source code
- 🔗 All external resources

---

**Need to make updates later?**
1. Edit `index.html`
2. Update assets in `/assets/` folder
3. Re-deploy (push to GitHub or re-upload to Netlify)

**Questions?**
Refer to:
- `INSTRUCTIONS.md` - Detailed setup guide
- `QUICK_REFERENCE.md` - Quick editing tips
- `SOLIDWORKS_OPTIONS.md` - CAD file display options
- `README.md` - Project overview

---

**Made with 🚀 for aerospace excellence**

Good luck with your CanSat project! 🛰️
