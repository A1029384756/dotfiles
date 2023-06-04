if status is-interactive
    # Commands to run in interactive sessions can go here
end

function wezterm
  flatpak run org.wezfurlong.wezterm $argv &; disown
end

function ls
  exa --icons -F -H --group-directories-first --git -h $argv
end

function cat
  bat --theme="Catppuccin-mocha" $argv
end

function vi
  nvim $argv
end

function dnf
  sudo dnf $argv
end

fish_add_path ~/.cargo/bin/
rtx activate fish | source
starship init fish | source
