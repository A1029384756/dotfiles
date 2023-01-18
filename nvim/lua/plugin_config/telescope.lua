local present, telescope = pcall(require, 'telescope')

if not present then
  return
end

local options = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
  }
}

telescope.setup(options)
telescope.load_extension('harpoon')
