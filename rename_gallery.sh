#!/bin/bash

# ============================================
# Batch Rename Script for Gallery Images
# ============================================
# This script renames all images in a folder to:
# gallery-001.jpg, gallery-002.jpg, etc.

# HOW TO USE:
# 1. Save this file as: rename_gallery.sh
# 2. Make it executable: chmod +x rename_gallery.sh
# 3. Run it: ./rename_gallery.sh /path/to/your/images/folder

# ============================================

FOLDER_PATH="${1:-./}"  # Use provided path or current directory

echo "🚀 Starting batch rename in: $FOLDER_PATH"
echo ""

# Change to the folder
cd "$FOLDER_PATH" || exit

# Counter
counter=1

# Supported image extensions
for ext in jpg jpeg png webp JPG JPEG PNG WEBP; do
    for file in *.$ext; do
        # Skip if no files found
        [ -e "$file" ] || continue
        
        # Generate new name with leading zeros (3 digits)
        new_name=$(printf "gallery-%03d.${ext,,}" $counter)
        
        # Rename the file
        if [ "$file" != "$new_name" ]; then
            mv "$file" "$new_name"
            echo "✅ Renamed: $file → $new_name"
            counter=$((counter + 1))
        fi
    done
done

echo ""
echo "🎉 Done! Renamed $((counter - 1)) files"
echo ""
echo "Files are now named:"
echo "  gallery-001.jpg"
echo "  gallery-002.jpg"
echo "  ..."
echo "  gallery-$((counter - 1)).jpg"
