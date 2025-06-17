return {
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets'
    },

    version = '1.*',
    opts = {
      keymap = {
        preset = 'enter',
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
      },

      appearance = {
        nerd_font_variant = 'mono'
      },

      completion = {
        accept = { auto_brackets = { enabled = false } },
        documentation = { auto_show = true },
      },
      signature = { enabled = true },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
  {
    {
      "supermaven-inc/supermaven-nvim",
      config = function()
        require('supermaven-nvim').setup({
          keymaps = {
            accept_suggestion = '<C-y>',
            accept_word = '<C-S-y>',
          },
        })
      end
    },
  }
}
