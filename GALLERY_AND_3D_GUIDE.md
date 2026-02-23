# Gallery Pagination & 3D Models - Quick Setup Guide

## 🖼️ Gallery with Pagination (500+ Images)

### Option 1: Manual Setup (Recommended for mixed content)

**Step 1:** Name your files with 3-digit numbers:
```
gallery-001.jpg
gallery-002.jpg
gallery-003.jpg
...
gallery-500.jpg
```

**Step 2:** Place all files in `/assets/images/gallery/`

**Step 3:** The first 4 sample items are already in the HTML. To add more, copy this template:

```html
<div class="mission-card rounded-lg overflow-hidden cursor-pointer gallery-item" data-page="1" onclick="openModal('assets/images/gallery/gallery-005.jpg')">
    <img src="assets/images/gallery/gallery-005.jpg" alt="Mission Photo 5" class="w-full h-48 object-cover" loading="lazy">
</div>
```

**Important:** Update `data-page` attribute:
- Items 1-24: `data-page="1"`
- Items 25-48: `data-page="2"`
- Items 49-72: `data-page="3"`
- Formula: `Math.ceil(item_number / 24)`

### Option 2: Auto-Generate (Easier for uniform content)

If all your files follow the naming pattern `gallery-001.jpg` to `gallery-500.jpg`:

**Step 1:** Open `index.html` and find the JavaScript section (line ~900)

**Step 2:** Update the configuration:
```javascript
const ITEMS_PER_PAGE = 24; // Images per page
const TOTAL_ITEMS = 500;   // Your total count (UPDATE THIS!)
```

**Step 3:** Uncomment this line in the `initializeGallery()` function:
```javascript
// generateGalleryItems();  // Remove the // to uncomment
```

**Step 4:** The script will automatically generate all HTML!

### Adding Videos to Gallery

For video files, use this template instead:
```html
<div class="mission-card rounded-lg overflow-hidden cursor-pointer gallery-item" data-page="1">
    <video class="w-full h-48 object-cover" controls loading="lazy">
        <source src="assets/images/gallery/video-001.mp4" type="video/mp4">
    </video>
</div>
```

---

## 🔷 3D Models Setup (glTF)

### Step 1: Convert & Prepare Files

You mentioned you've already converted to glTF - perfect! 

**File naming convention:**
```
part-01.glb
part-02.glb
part-03.glb
...
part-21.glb
```

**Best format:** Use `.glb` (binary glTF) for best performance and smaller file size.

### Step 2: Place Files

Move all `.glb` files to:
```
/app/assets/models/
```

### Step 3: Update HTML

The HTML already has 6 example model viewers. To add your remaining 15 parts, copy this template:

```html
<div class="mission-card rounded-xl p-4">
    <model-viewer 
        src="assets/models/part-07.glb"
        alt="Part Name"
        auto-rotate
        camera-controls
        shadow-intensity="1"
        class="w-full">
    </model-viewer>
    <h3 class="text-center mt-4 text-lg font-semibold text-cyan-400">Part Name</h3>
    <p class="text-center text-sm text-gray-400">Part description here</p>
</div>
```

**Customization options:**
- Remove `auto-rotate` if you don't want auto-rotation
- Add `exposure="1.5"` to brighten the model
- Add `environment-image="neutral"` for better lighting
- Alternate colors: `text-cyan-400` and `text-purple-400`

### Step 4: Name Your Parts

Update the part names and descriptions. Examples:
- Main Body
- Parachute Lid
- Electronics Bay
- Battery Compartment
- Sensor Mount
- Gimbal Assembly
- PCB Holder
- Deployment Mechanism
- etc.

---

## 📊 Performance Tips

### For Gallery:
1. **Optimize images before upload:**
   - Max size: 1200x900px
   - Target file size: <200KB each
   - Use tools like [TinyPNG](https://tinypng.com/)

2. **Lazy loading is enabled** - images load as you scroll

3. **Pagination helps:** Only 24 items load at once

### For 3D Models:
1. **Optimize glTF files:**
   - Use [gltf-pipeline](https://github.com/CesiumGS/gltf-pipeline) to compress
   - Target: <5MB per model
   - Command: `gltf-pipeline -i input.glb -o output.glb -d`

2. **Remove `auto-rotate`** if you have many models - saves CPU

3. **Consider using lower poly versions** for web

---

## 🎮 User Controls

### Gallery:
- **Click image** → Full-size modal
- **ESC key** → Close modal
- **← → Arrow keys** → Navigate pages
- **Click page numbers** → Jump to page
- **Previous/Next buttons** → Navigate sequentially

### 3D Models:
- **Click & drag** → Rotate model
- **Scroll** → Zoom in/out
- **Right-click drag** → Pan
- **Double-click** → Reset view
- **Auto-rotate** → Models spin automatically

---

## 🔧 Configuration Options

### Change items per page:
```javascript
const ITEMS_PER_PAGE = 30; // Change from 24 to 30
```

### Change total items:
```javascript
const TOTAL_ITEMS = 600; // Update to your actual count
```

### Disable auto-rotate on 3D models:
Remove the `auto-rotate` attribute:
```html
<model-viewer 
    src="assets/models/part-01.glb"
    camera-controls>
</model-viewer>
```

---

## 📁 Final Folder Structure

```
/app/
├── index.html
├── assets/
│   ├── images/
│   │   └── gallery/
│   │       ├── gallery-001.jpg
│   │       ├── gallery-002.jpg
│   │       ├── ...
│   │       └── gallery-500.jpg
│   └── models/
│       ├── part-01.glb
│       ├── part-02.glb
│       ├── ...
│       └── part-21.glb
```

---

## ✅ Quick Checklist

### Gallery:
- [ ] Renamed all images to gallery-001.jpg format
- [ ] Placed in /assets/images/gallery/
- [ ] Updated TOTAL_ITEMS in JavaScript
- [ ] Chose manual or auto-generate method
- [ ] Tested pagination controls

### 3D Models:
- [ ] Converted all SolidWorks to .glb format
- [ ] Placed in /assets/models/
- [ ] Updated all 21 model-viewer src paths
- [ ] Added descriptive names and descriptions
- [ ] Tested 3D viewer controls

### Testing:
- [ ] Page 1 shows items 1-24
- [ ] Next button works
- [ ] Page numbers appear correctly
- [ ] Modal opens on image click
- [ ] 3D models load and are interactive
- [ ] Models can rotate/zoom

---

## 🐛 Troubleshooting

**Gallery images not showing:**
- Check file paths (case-sensitive!)
- Verify files are actually in /assets/images/gallery/
- Check browser console (F12) for errors
- Ensure file names match exactly (gallery-001 not gallery-1)

**Pagination not working:**
- Make sure TOTAL_ITEMS is set correctly
- Check that data-page attributes are correct
- Open console and look for JavaScript errors

**3D models not loading:**
- Verify .glb files are in /assets/models/
- Check file sizes (if >10MB, may be slow to load)
- Ensure model-viewer script loaded (check <head> section)
- Test with one model first before adding all 21

**Models appear black:**
- Add `exposure="1.5"` attribute
- Add `environment-image="neutral"`
- Check if model has materials/textures

---

## 💡 Pro Tips

1. **Test with small batch first:** Start with 50 images, verify pagination works, then add rest

2. **Use consistent naming:** Stick to gallery-001, gallery-002 format (with leading zeros)

3. **Compress everything:** Both images and 3D models should be optimized

4. **Mobile testing:** Pagination and 3D controls work great on touch devices

5. **Load testing:** With 500 images, only 24 load at once - very efficient!

---

Need help? Check the main INSTRUCTIONS.md or QUICK_REFERENCE.md files!
