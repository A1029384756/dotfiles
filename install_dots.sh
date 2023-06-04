#!/bin/bash

# Set up .config directory
config_dirs="$(pwd)""/config/*"
for entry in $config_dirs; do
  folder_name=$(basename $entry)
  echo $entry
  echo "$HOME/.config/$folder_name"
  ln -s $entry "$HOME/.config/${folder_name}"
done
