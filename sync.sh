#!/bin/bash

# Variables
source_folder="$HOME/Documents"
destination_server="100.110.187.131"
user="mjr"
destination_folder="~/Documents"
exclude_folders=("node_modules" "node-modules")

# Build exclude options for rsync
exclude_options=()
for folder in "${exclude_folders[@]}"; do
	exclude_options+=("--exclude=$folder")
done

# rsync command
rsync -avz --progress "${exclude_options[@]}" -e "ssh" "$source_folder/" "$user@$destination_server:$destination_folder/"

# rsync from server to local
rsync -avz --progress "${exclude_options[@]}" -e "ssh " "$destination_server:$destination_folder/" "$source_folder/"
