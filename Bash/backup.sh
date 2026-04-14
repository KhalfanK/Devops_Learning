#!/bin/bash

# This script backs up all .txt files from one directory to another and adds a timestamp to the backup directory. And also displays count of files backed up.


read -p "Enter source directory: " src_dir
timestamp=$(date +"%Y-%m-%d_%H-%M")

backup_dir="backup_$timestamp"

if [[ -d "$src_dir" ]]; then
    mkdir -p "$backup_dir"
    cp "$src_dir"/*.txt "$backup_dir"/
    echo "Backup directory created:'$backup_dir' Copying .txt files."
else
    echo "Error: Source directory '$src_dir' does not exist."
fi

file_count=$(ls "$backup_dir"/*.txt 2>/dev/null | wc -l)
echo "Backup completed. Files backed up: $file_count"

