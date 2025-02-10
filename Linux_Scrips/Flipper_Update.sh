#!/bin/bash
folders=("badusb" "infrared" "Ifrfid" "nfc" "subghz" "u2f" "dolphin")
backup_folder="/home/$USER/.FlipperBackup"
archive=$(find . -name "flipper-z-f7-update-mntm-dev*.tgz" 2>/dev/null | head -n 1)
if [[ -z "$archive" ]]; then
  echo "Error: Archive flipper-z-f7-update-mntm-dev not found."
  exit 1
fi
echo "Found archive: $archive"
tar -xzf "$archive" >/dev/null 2>&1
extracted_folder=$(tar -tf "$archive" | head -n 1 | cut -d '/' -f 1)
if [ ! -d "$extracted_folder" ]; then
  echo "Error: Unable to find extracted folder '$extracted_folder'."
  exit 1
fi
resources_tmp="$extracted_folder/resources_tmp"
mkdir -p "$resources_tmp"
resources_archive="$extracted_folder/resources.tar.gz"
if [ -f "$resources_archive" ]; then
  tar -xzf "$resources_archive" -C "$resources_tmp" >/dev/null 2>&1
  for folder in "${folders[@]}"; do
    [ -d "$resources_tmp/$folder" ] && rm -rf "$resources_tmp/$folder"
  done
  if [ -d "$backup_folder" ]; then
    cp -r "$backup_folder"/* "$resources_tmp"
  else
    echo "Warning: Folder '$backup_folder' not found."
  fi
  if [[ "$(ls -A "$resources_tmp")" ]]; then
    (cd "$resources_tmp" && tar -czf "../resources.tar.gz" *) >/dev/null 2>&1
    echo "Archived: Custom resources.tar.gz"
  else
    echo "Warning: 'resources' folder is empty, resources.tar.gz was not created."
    rm -f "$resources_archive"
  fi
  rm -rf "$resources_tmp"
else
  echo "Warning: File 'resources.tar.gz' not found in '$extracted_folder'."
fi
if [ -d "$extracted_folder" ]; then
  tar -czf "$archive" "$extracted_folder" >/dev/null 2>&1
  echo "Done! Archive '$archive' has been created."
else
  echo "Error: Folder '$extracted_folder' not found, archive was not created."
  exit 1
fi
  rm -rf "$extracted_folder"