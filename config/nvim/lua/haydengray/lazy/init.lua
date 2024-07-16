return {
  {
    'vyfor/cord.nvim',
    build = 'fish ./build',
    event = 'VeryLazy',
    opts = {
      assets = {
        odin = {
          name = "Odin", -- "Grug braining"
          icon = "https://github.com/odin-lang/artwork/blob/master/logo/emblem-260.png?raw=true",
          tooltop = "odin-lang.org",
          type = 0,
        },
      },
    },
  },
  {
    'goolord/alpha-nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('alpha').setup(require 'alpha.themes.startify'.config)
    end
  },
  {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup()
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
      },
      preview_config = {
        border = 'rounded',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
      on_attach = function()
        local gs = require('gitsigns')

        local function opts(desc)
          return { buffer = bufnr, desc = desc }
        end

        local map = vim.keymap.set

        map("n", "<leader>rh", gs.reset_hunk, opts "Reset Hunk")
        map("n", "<leader>ph", gs.preview_hunk, opts "Preview Hunk")
        map("n", "<leader>gb", gs.blame_line, opts "Blame Line")
      end,
    }
  },
}
