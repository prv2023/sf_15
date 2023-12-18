#!/bin/bash

# Source and destination folders
source_folder="/path/to/source"
destination_folder="/path/to/destination"

# Check if source folder exists
if [ ! -d "$source_folder" ]; then
    echo "Source folder does not exist."
    exit 1
fi

# Check if destination folder exists; if not, create it
if [ ! -d "$destination_folder" ]; then
    mkdir -p "$destination_folder"
fi

# Copy files from source to destination
cp -r "$source_folder"/* "$destination_folder"

echo "Files copied successfully from $source_folder to $destination_folder."
