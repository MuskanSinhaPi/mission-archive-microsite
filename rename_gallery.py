#!/usr/bin/env python3
"""
Cross-Platform Batch Rename Script
Renames all images to gallery-001.jpg, gallery-002.jpg, etc.

Works on: Windows, Mac, Linux

Usage:
    python3 rename_gallery.py /path/to/your/images
    
Or just double-click this file if Python is installed!
"""

import os
import sys
from pathlib import Path

# Supported extensions
EXTENSIONS = ('.jpg', '.jpeg', '.png', '.webp', '.gif', '.bmp', 
              '.JPG', '.JPEG', '.PNG', '.WEBP', '.GIF', '.BMP')

def rename_files(folder_path=None):
    """Rename all images in folder to gallery-XXX format"""
    
    # Use provided path or ask user
    if not folder_path:
        if len(sys.argv) > 1:
            folder_path = sys.argv[1]
        else:
            folder_path = input("Enter the folder path (or press Enter for current folder): ").strip()
            if not folder_path:
                folder_path = "."
    
    folder = Path(folder_path)
    
    if not folder.exists():
        print(f"❌ Error: Folder '{folder_path}' does not exist!")
        return
    
    print(f"🚀 Starting batch rename in: {folder.absolute()}")
    print()
    
    # Get all image files
    image_files = []
    for ext in EXTENSIONS:
        image_files.extend(folder.glob(f"*{ext}"))
    
    # Sort files by name
    image_files.sort()
    
    if not image_files:
        print("❌ No image files found!")
        return
    
    print(f"📁 Found {len(image_files)} images")
    print()
    
    # Rename files
    counter = 1
    renamed_count = 0
    
    for file_path in image_files:
        # Get extension (lowercase)
        ext = file_path.suffix.lower()
        
        # Generate new name
        new_name = f"gallery-{counter:03d}{ext}"
        new_path = file_path.parent / new_name
        
        # Rename if different
        if file_path.name != new_name:
            try:
                file_path.rename(new_path)
                print(f"✅ Renamed: {file_path.name} → {new_name}")
                renamed_count += 1
            except Exception as e:
                print(f"❌ Error renaming {file_path.name}: {e}")
        
        counter += 1
    
    print()
    print(f"🎉 Done! Renamed {renamed_count} files")
    print()
    print("Files are now named:")
    print("  gallery-001.jpg")
    print("  gallery-002.jpg")
    print("  ...")
    print(f"  gallery-{counter-1:03d}.jpg")
    print()

if __name__ == "__main__":
    try:
        rename_files()
    except KeyboardInterrupt:
        print("\n⚠️  Cancelled by user")
    except Exception as e:
        print(f"\n❌ Error: {e}")
    
    # Keep window open on Windows
    if sys.platform == "win32":
        input("\nPress Enter to close...")
