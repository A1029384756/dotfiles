return {
  'catppuccin/nvim',
  name = 'catppuccin',
  config = function()
    vim.opt.termguicolors = true
    local theme_present, theme = pcall(require, 'catppuccin')
    if theme_present then
      theme.setup({
        themes = function()
          return {
            Normal = { bg = '#1F2223' },
            Comment = { fg = '#928374', italic = true },
            ErrorMsg = { fg = 'black', bg = '#ec6075', standout = true },
            NormalFloat = { link = 'Normal' },
          }
        end,
        transparent_background = true,
        integrations = {
          notify = true,
        },
      })
      vim.cmd([[colorscheme catppuccin-mocha]])
    end
  end
}
