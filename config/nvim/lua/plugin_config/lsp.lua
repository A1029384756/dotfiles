local lspconfig = require('lspconfig')
local lsp_capabilites = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup()
require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = lsp_capabilites
    })
  end
})

local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'buffer' },
  },
  mapping = cmp.mapping.preset.insert({
    ['j'] = cmp.mapping.scroll_docs(-4),
    ['k'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  })
})

local ts = require('nvim-treesitter.configs')
ts.setup({
  ensure_installed = { 'rust', 'c', 'cpp', 'lua' },
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  highlight = { enable = true },
  indent = { enable = true },
  modules = {}
})
