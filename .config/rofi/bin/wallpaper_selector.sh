
#!/bin/bash

# Define the directory containing wallpapers (you can change this path)
WALLPAPER_DIR="$HOME/.config/hypr/wallpapers"

# Define the cache directory for thumbnails
CACHE_DIR="$HOME/.cache/wallpaper_selector"

CONFIG_RASI="$HOME/.config/rofi/config.rasi"
WALLPAPER_TXT="$HOME/.wallpaper.txt"

# Make sure the cache directory exists
mkdir -p "$CACHE_DIR"

# Function to generate thumbnails for the images in the wallpaper directory (only if they don't exist)
generate_thumbnails() {
    for img in "$WALLPAPER_DIR"/*.{jpg,jpeg,png}; do
        # Skip directories or non-image files
        [ ! -f "$img" ] && continue

        # Get the file extension of the image
        ext="${img##*.}"

        # Generate the thumbnail with the same extension as the image
        thumb="$CACHE_DIR/$(basename "$img" .$ext).thumb.$ext"
        # Generate the thumbnail if it doesn't exist
        if [ ! -f "$thumb" ]; then
            magick "$img" -thumbnail 1280x720 "$thumb" &
	    sleep 0.5;
        fi
    done
    wait  # Wait for all background thumbnail generation tasks to finish
}

# Function to build a rofi-compatible list of wallpapers and thumbnails
build_wallpaper_list() {
    wallpaper_list=()
    for img in "$WALLPAPER_DIR"/*.{jpg,jpeg,png}; do
        # Skip directories or non-image files
        [ ! -f "$img" ] && continue

        ext="${img##*.}"
        thumb="$CACHE_DIR/$(basename "$img" .$ext).thumb.$ext"
        wallpaper_list+=("$(basename "$img")" "$thumb")
    done
}

# Function to set the selected wallpaper using swww and save to .wallpaper.txt
set_and_save_wallpaper() {
    selected_wallpaper="$1"
    # Set the wallpaper
    swww img "$WALLPAPER_DIR/$selected_wallpaper" --transition-fps 60 --transition-type grow --transition-pos 0.925,0.977 --transition-duration 2

    # Save the selected wallpaper path to .wallpaper.txt
    echo "$WALLPAPER_DIR/$selected_wallpaper" > "$WALLPAPER_TXT"
}

# Check if thumbnails already exist, if not, generate them
if [ ! "$(ls -A $CACHE_DIR)" ]; then
    generate_thumbnails
fi

# Build the wallpaper list
build_wallpaper_list

# Get the current wallpaper from .wallpaper.txt
if [ -f "$HOME/.wallpaper.txt" ]; then
    current_wallpaper=$(basename "$(cat "$HOME/.wallpaper.txt")")
else
    current_wallpaper=""
fi

# Use rofi to display the wallpaper options with thumbnails
selected_wallpaper=$(for ((i=0; i<${#wallpaper_list[@]}; i+=2)); do
    echo -e "${wallpaper_list[$i]}\x00icon\x1f${wallpaper_list[$i+1]}"
done | rofi -dmenu -i -theme "~/.config/rofi/wallpaper.rasi" -show-icons -p "Select Wallpaper" -selected-row "$(for i in "${!wallpaper_list[@]}"; do
    if [ "${wallpaper_list[$i]}" = "$current_wallpaper" ]; then
        echo $((i / 2))  # Every wallpaper item is added as a pair (name, thumbnail), so divide by 2
    fi
done)")

# Function to update the Rofi config with the current wallpaper
update_rofi_config() {
    current_wallpaper=$(cat "$WALLPAPER_TXT")
    # Update the background image URL in the Rofi config file
    sed -i "s|background-image:.*|background-image: url(\"$current_wallpaper\", height);|" "$CONFIG_RASI"
}

# If a wallpaper was selected, set it and save to .wallpaper.txt
if [ -n "$selected_wallpaper" ]; then
    set_and_save_wallpaper "$selected_wallpaper"
    # Now that the wallpaper is set, update Rofi config
    update_rofi_config
    # Restart Rofi to reflect the changes
    pkill -USR1 rofi  # This reloads Rofi configuration (use another method if needed)
fi
