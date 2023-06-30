local wezterm = require 'wezterm'
local set_tab_theme = require 'helpers'.set_tab_theme
local table_utils = require 'table_merge'.table_utils

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Catppuccin Mocha'
config.window_background_opacity = 0.9
config.use_fancy_tab_bar = true

config.window_frame = {
  font = wezterm.font { family = 'Cantarell', weight = 'Bold' },
  font_size = 11.0,
  active_titlebar_bg = '#303030',
  inactive_titlebar_bg = '#242424',
}

wezterm.on(
  'format-tab-title',
  set_tab_theme
)

config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.integrated_title_button_style = "Gnome"
config.integrated_title_buttons = { 'Close' }

return table_utils.merge_all(
  config,
  require 'wsl',
  require 'keys',
  {}
)
