cd /Users/muskanshomef/Desktop/mission-archive-microsite

bash << 'EOF'
ROOT="assets/images/gallery"
OUT="$ROOT/index.json"

echo "{" > "$OUT"

declare -a FOLDERS=("good-times" "photos" "Photos-Mini-Spy-Cam" "Presentation" "Videos" "Grand-Finale" "Videos-Mini-Spy-Cam" "good-times-2")
declare -a IDS=("good-times" "photos" "mini-spy-cam" "presentation" "videos" "grand-finale" "videos-mini-spy" "good-times-2")

LAST=${#FOLDERS[@]}
for i in "${!FOLDERS[@]}"; do
    folder="${FOLDERS[$i]}"
    aid="${IDS[$i]}"
    path="$ROOT/$folder"
    
    echo -n "  \"$aid\":{\"folder\":\"$folder\",\"files\":[" >> "$OUT"
    
    first=1
    if [ -d "$path" ]; then
        while IFS= read -r file; do
            fname=$(basename "$file")
            [[ "$fname" == .* ]] && continue
            ext="${fname##*.}"
            ext=$(echo "$ext" | tr '[:upper:]' '[:lower:]')
            case "$ext" in
                jpg|jpeg|png|webp|gif) t="image" ;;
                mp4|mov|webm|avi|mkv)          t="video" ;;
                *) continue ;;
            esac
            # escape any quotes in filename
            safe="${fname//\"/\\\"}"
            [ $first -eq 0 ] && echo -n "," >> "$OUT"
            echo -n "{\"f\":\"$safe\",\"t\":\"$t\"}" >> "$OUT"
            first=0
        done < <(find "$path" -maxdepth 1 -type f | sort)
    fi
    
    count=$(find "$path" -maxdepth 1 -type f 2>/dev/null | wc -l | tr -d ' ')
    echo -n "]}" >> "$OUT"
    [ $((i+1)) -lt $LAST ] && echo -n "," >> "$OUT"
    echo ""
    echo "  $folder → $count files"
done

echo "}" >> "$OUT"
echo ""
echo "Done → $OUT"
EOF
