
#!/bin/bash

# Define the directory containing wallpapers (you can change this path)
WALLPAPER_DIR="$HOME/.config/hypr/wallpapers"

# Define the cache directory for thumbnails
CACHE_DIR="$HOME/.cache/wallpaper_selector"

# Make sure the cache directory exists
mkdir -p "$CACHE_DIR"

# Function to generate thumbnails for the images in the wallpaper directory
generate_thumbnails() {
    for img in "$WALLPAPER_DIR"/*.{jpg,jpeg,png}; do
        # Skip directories or non-image files
        [ ! -f "$img" ] && continue

        # Generate a thumbnail if it doesn't exist
        thumb="$CACHE_DIR/$(basename "$img").thumb.png"
        if [ ! -f "$thumb" ]; then
            magick "$img" -thumbnail 1280x720 "$thumb"
        fi
    done
}

# Function to build a rofi-compatible list of wallpapers and thumbnails
build_wallpaper_list() {
    wallpaper_list=()
    for img in "$WALLPAPER_DIR"/*.{jpg,jpeg,png}; do
        # Skip directories or non-image files
        [ ! -f "$img" ] && continue

        thumb="$CACHE_DIR/$(basename "$img").thumb.png"
        wallpaper_list+=("$(basename "$img")" "$thumb")
    done
}

# Function to set the selected wallpaper using feh
set_wallpaper() {
    selected_wallpaper="$1"
    swww img "$WALLPAPER_DIR/$selected_wallpaper"
}

# Generate thumbnails for all wallpapers
generate_thumbnails

# Build the wallpaper list
build_wallpaper_list

# Use rofi to display the wallpaper options with thumbnails
selected_wallpaper=$(for ((i=0; i<${#wallpaper_list[@]}; i+=2)); do
    echo -e "${wallpaper_list[$i]}\x00icon\x1f${wallpaper_list[$i+1]}"
done | rofi -dmenu -i -theme "~/.config/rofi/wallpaper.rasi" -show-icons -p "Select Wallpaper")

# If a wallpaper was selected, set it
if [ -n "$selected_wallpaper" ]; then
    set_wallpaper "$selected_wallpaper"
fi

