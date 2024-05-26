set fish_greeting

function remove_path
  if set -l index (contains -i "$argv" $fish_user_paths)
    set -e fish_user_paths[$index]
    echo "Removed $argv from the path"
  end
end

function wezterm
  flatpak run org.wezfurlong.wezterm $argv &; disown
end

function ls
  eza --icons -F -H --group-directories-first --git -h $argv
end

function cat
  bat --theme="Catppuccin Mocha" $argv
end

function vi
  nvim $argv
end

function dnf
  sudo dnf $argv
end

fish_add_path ~/.local/bin/
fish_add_path ~/.spicetify
fish_add_path ~/Odin
fish_add_path ~/ols

switch (uname)
  case Darwin
    fish_add_path /opt/homebrew/bin/
  case Linux
    . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
end

set EDITOR nvim
starship init fish | source
mise activate fish | source
