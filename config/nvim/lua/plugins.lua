local plugins = {
  { "catppuccin/nvim", name = "catppuccin" },
  { 'nvim-treesitter/nvim-treesitter' },
  { 'nvim-lualine/lualine.nvim' },
  { 'habamax/vim-godot' },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = true
  },
  {
    'goolord/alpha-nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup()
    end,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    lazy = false,
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig',            lazy = false },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  },
}

local opts = {}

require("lazy").setup(plugins, opts)
