return {
  { 'nvim-treesitter/nvim-treesitter' },
  {
    'm4xshen/autoclose.nvim',
    config = function()
      require("autoclose").setup()
    end
  },
  {
    'goolord/alpha-nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
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
