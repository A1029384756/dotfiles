return {
  'nvim-treesitter/nvim-treesitter',
  priority = 500,
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'rust', 'c', 'cpp', 'lua', 'odin' },
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      highlight = { enable = true, },
      injections = { enable = true, },
      indent = { enable = true, },
      modules = {}
    }
  end
}
