#!/bin/bash

# Get the font file path from the first argument
font_file="$1"

# Extract the filename without the extension
filename=$(basename -- "$font_file")
extension="${filename##*.}"
filename="${filename%.*}"

# Extract the weight from the filename (e.g., "IosBerkMono-SemiBold" -> "SemiBold")
weight=$(echo "$filename" | sed 's/IosBerkMono-//')

# Construct the new font name
new_name="IosBerkMonoNF-$weight"

# Run the font-patcher with the new name
./font-patcher --complete --mono --adjust-line-height --makegroups -1 --name "$new_name" "$font_file"
