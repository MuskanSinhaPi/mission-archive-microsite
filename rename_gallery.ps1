# ============================================
# Windows PowerShell Batch Rename Script
# ============================================
# This script renames all images in a folder to:
# gallery-001.jpg, gallery-002.jpg, etc.

# HOW TO USE:
# 1. Save this file as: rename_gallery.ps1
# 2. Open PowerShell in the folder with your images
# 3. Run: .\rename_gallery.ps1

# ============================================

Write-Host "🚀 Starting batch rename..." -ForegroundColor Cyan
Write-Host ""

$counter = 1
$extensions = @("*.jpg", "*.jpeg", "*.png", "*.webp", "*.JPG", "*.JPEG", "*.PNG", "*.WEBP")

foreach ($ext in $extensions) {
    Get-ChildItem -Filter $ext | ForEach-Object {
        $extension = $_.Extension.ToLower()
        $newName = "gallery-{0:D3}$extension" -f $counter
        
        if ($_.Name -ne $newName) {
            Rename-Item $_.FullName -NewName $newName
            Write-Host "✅ Renamed: $($_.Name) → $newName" -ForegroundColor Green
            $counter++
        }
    }
}

Write-Host ""
Write-Host "🎉 Done! Renamed $($counter - 1) files" -ForegroundColor Green
Write-Host ""
Write-Host "Files are now named:"
Write-Host "  gallery-001.jpg"
Write-Host "  gallery-002.jpg"
Write-Host "  ..."
Write-Host "  gallery-$($counter - 1).jpg"
Write-Host ""
Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
