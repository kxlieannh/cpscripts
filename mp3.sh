#!/bin/bash

# Directory to search for mp3 files
DIRECTORY="/path/to/your/directory"

# Find and delete all mp3 files
find "$DIRECTORY" -type f -name "*.mp3" -exec rm -f {} \;

echo "All mp3 files have been deleted from $DIRECTORY and its subdirectories."
