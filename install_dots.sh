#!/bin/bash

platform=$(uname | tr '[:upper:]' '[:lower:]')
declare -a dots_to_install=()

if [[ $platform == 'linux' ]]; then
  dots_to_install=( 'alacritty' 'fish' 'ghostty' 'kitty' 'nix' 'nvim' 'wezterm' )
elif [[ $platform == 'darwin' ]]; then
  dots_to_install=('fish' 'nix' 'nvim' 'yabai' 'skhd')
else
  echo "Unsupported platform"
  exit 1
fi

echo "Detected platform $platform"

for entry in "${dots_to_install[@]}"; do
  folder_name=$(basename $entry)
  echo "Installing $folder_name"
  ln -sf "$(pwd)/config/$entry" "$HOME/.config/${folder_name}"
done
