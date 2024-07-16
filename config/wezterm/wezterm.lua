local wezterm = require 'wezterm'
require("bar").setup({
  dividers = false, -- or "slant_left", "arrows", "rounded", false
  indicator = {
    leader = {
      enabled = true,
      off = " ",
      on = " ",
    },
    mode = {
      enabled = true,
      names = {
        resize_mode = "RESIZE",
        copy_mode = "VISUAL",
        search_mode = "SEARCH",
      },
    },
  },
  tabs = {
    numerals = "arabic",
    pane_count = "superscript",
    brackets = {
      active = { "", ":" },
      inactive = { "", ":" },
    },
  },
  clock = {
    enabled = false,
    format = "%H:%M",
  },
})

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config = {
  window_decorations = 'RESIZE',
  color_scheme = 'Catppuccin Mocha',
  font_size = 11,
  font = wezterm.font 'Maple Mono NF CN',
  window_background_opacity = 0.9,
  warn_about_missing_glyphs = false,
  enable_tab_bar = true,
  use_fancy_tab_bar = false,
  tab_max_width = 22,
  tab_bar_at_bottom = true,
  window_padding = {
    left = '1cell',
    right = '1cell',
    top = '1cell',
    bottom = '0cell',
  }
}

return config
