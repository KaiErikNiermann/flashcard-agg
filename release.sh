#!/bin/bash

# Create a release folder if it doesn't exist
mkdir -p release

# Copy all non-hidden folders into the release folder, excluding 'release'
find . -mindepth 1 -maxdepth 1 -type d ! -name "release" ! -name ".*" -exec cp -r {} release/ \;

# Go through all folders
cd release || exit

for folder in */; do
    cd "$folder" || exit
    
    # Remove files that don't have the name of the folder or "target"
    for file in *; do
        if [[ -f "$file" && "$file" != "$(basename "$folder")" && "$file" != "target" ]]; then
            rm -f "$file"
        fi
    done
    
    cd ..
done

# Delete any other files
find . -mindepth 1 -type f -delete
