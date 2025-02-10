#!/bin/bash
folders_to_delete=("" "")
deleted_folders=()
not_deleted_folders=()
for folder in "${folders_to_delete[@]}"; do
  if [ -d "Momentum-Firmware/applications/external/$folder" ]; then
    rm -rf "Momentum-Firmware/applications/external/$folder"
    deleted_folders+=("$folder")
  else
    not_deleted_folders+=("$folder")
  fi
done
if [ ${#deleted_folders[@]} -gt 0 ]; then
  deleted_folders_str=$(IFS=" "; echo "${deleted_folders[*]}")
  echo "Deleted Apps: $deleted_folders_str"
else
  echo "No folders were deleted"
fi
if [ ${#not_deleted_folders[@]} -gt 0 ]; then
  not_deleted_folders_str=$(IFS=" "; echo "${not_deleted_folders[*]}")
  echo "Not deleted folders: $not_deleted_folders_str"
else
  echo "All folders were deleted"
fi