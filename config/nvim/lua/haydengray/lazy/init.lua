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
}
