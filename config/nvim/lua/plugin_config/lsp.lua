local lsp = require('lsp-zero')
local ts = require('nvim-treesitter.configs')
local cmp = require('cmp')

lsp.preset('recommended')
lsp.nvim_workspace()
lsp.setup_nvim_cmp({
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp', keyword_length = 3 },
    { name = 'buffer',   keyword_length = 3 },
    { name = 'luasnip',  keyword_length = 2 },
  },
  formatting = {
    fields = { 'menu', 'abbr', 'kind' },
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '',
        nvim_lua = 'Π',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
  documentation = {
    max_height = 15,
    max_width = 60,
    border = 'rounded',
    col_offset = 0,
    side_padding = 1,
    winhighlight = 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None',
    zindex = 1001
  }
})
lsp.setup()

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  }
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})

ts.setup({
  ensure_installed = 'all',
  highlight = { enable = true },
  indent = { enable = true }
})

require 'lspconfig'.gdscript.setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  flags = {
    debounce_text_changes = 150
  }
}

require 'lspconfig'.svlangserver.setup {
  on_init = function(client)
    client.config.settings.systemverilog = {
      includeIndexing     = { '**/*.{sv,svh}' },
      excludeIndexing     = { 'test/**/*.sv*' },
      defines             = {},
      launchConfiguration = '/tools/verilator -sv -Wall --lint-only',
      formatCommand       = '/tools/verible-verilog-format'
    }

    client.notify('workspace/didChangeConfiguration')
    return true
  end
}

require 'lspconfig'.clangd.setup {
  on_attach = function()
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, {})
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, {})
  end,
  cmd = { 'clangd', '--background-index', '--clang-tidy' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto', 'txx', 'tpp' },
}
