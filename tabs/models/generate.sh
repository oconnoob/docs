#!/bin/bash

# Define the structure of directories and files in an associative array
declare -A directories=(
    ["LeMUR - LLMs for speech"]="Ask questions about your audio data
Summarize your audio data
Extract and generate data
Generate content based on your audio data
Customize parameters
LeMUR examples
Advanced"
    ["Audio Intelligence"]="Summarization
Content Moderation
Sentiment Analysis
Entity Detection
Topic Detection
Auto Chapters
Key Phrases
PII Redaction"
)

# Loop through the associative array
for directory in "${!directories[@]}"; do
    # Format directory name to lowercase and replace spaces with hyphens
    dir_name=$(echo "$directory" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
    # Create the directory if it doesn't exist
    mkdir -p "./$dir_name"
    # Read the file names for the current directory
    while read -r file_name; do
        # Format file name to lowercase and replace spaces with hyphens
        formatted_file_name=$(echo "$file_name" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
        # Create the .mdx file
        touch "./$dir_name/$formatted_file_name.mdx"
    done <<< "${directories[$directory]}"
done