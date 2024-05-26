local wezterm = require 'wezterm'
local set_tab_theme = require 'helpers'.set_tab_theme
local table_utils = require 'table_merge'.table_utils

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config = {
  color_scheme = 'Catppuccin Mocha',
  -- window_background_opacity = 0.9,
  use_fancy_tab_bar = true,
  window_background_opacity = 0.9,
  window_frame = {
    font = wezterm.font { family = 'Cantarell', weight = 'Bold' },
    font_size = 12.0,
    active_titlebar_bg = '#303030',
    inactive_titlebar_bg = '#242424',
  },
  window_decorations = "INTEGRATED_BUTTONS | RESIZE",
  integrated_title_button_style = "Gnome",
  integrated_title_buttons = { 'Close' },
  font = wezterm.font_with_fallback({
    { family = 'JetBrainsMono Nerd Font', weight = "Medium", style = "Normal", stretch = "Normal" }
  }),
  font_size = 10.0,
}

wezterm.on(
  'format-tab-title',
  set_tab_theme
)

return table_utils.merge_all(
  config,
  require 'wsl',
  require 'keys',
  {}
)
