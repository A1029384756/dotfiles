vim.g.mapleader = ' '

-- Install package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('plugins')

require('haydengray/mappings')
require('haydengray/vimopts')

require('plugin_config.filetype')
require('plugin_config.mason')
require('plugin_config.lualine')
require('plugin_config.lsp')
require('plugin_config.telescope')
require('plugin_config.toggleterm')
