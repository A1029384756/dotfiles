local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Gruvbox dark, hard (base16)'
config.window_background_opacity = 0.9
config.use_fancy_tab_bar = true
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.integrated_title_button_style = "Gnome"
config.integrated_title_buttons = { 'Close' }

return config
