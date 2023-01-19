#!/bin/bash

# Set up .config directory
config_dirs="$(pwd)""/config/*"
for entry in $config_dirs; do
  folder_name=$(basename $entry)
  echo $entry
  echo "$HOME/.config/$folder_name"
  ln -s $entry "$HOME/.config/${folder_name}"
done

# Set up ZSH
ln -sf "$(pwd)/.zshrc" $HOME/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
