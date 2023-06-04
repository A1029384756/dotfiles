vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.ch = 0
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 10

local theme_present, theme = pcall(require, 'catppuccin')
if theme_present then
  theme.setup({
    themes = function ()
      return {
        Normal = { bg = '#1F2223'},
        Comment = { fg = '#928374', italic = true },
        ErrorMsg = { fg = "black", bg = "#ec6075", standout = true },
        NormalFloat = { link = "Normal" },
      }
    end,
  })
  vim.cmd([[colorscheme catppuccin-mocha]])
end

--Folding options
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
