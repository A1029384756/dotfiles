local lspconfig = require('lspconfig')
local lsp_capabilites = require('cmp_nvim_lsp').default_capabilities()

require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = lsp_capabilites,
    })
  end,
  ['lua_ls'] = function()
    require('lspconfig').lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    })
  end,
  ['arduino_language_server'] = function()
    require('lspconfig').arduino_language_server.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = {
        'arduino-language-server',
        '-fqbn',
        'arduino:avr:mega'
      },
    }
  end,
  ['ruff_lsp'] = function()
    require('lspconfig').ruff_lsp.setup {
      on_attach = function(client, bufnr)
        client.server_capabilities.hoverProvider = false
      end,
    }
  end,
  ['pyright'] = function()
    require('lspconfig').pyright.setup {
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
      end,
    }
  end,
})

lspconfig.ols.setup({})

local cmp = require('cmp')
local luasnip = require('luasnip')
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'buffer' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      local kind = require('lspkind').cmp_format({ mode = 'symbol_text', maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, '%s', { trimempty = true })
      kind.kind = ' ' .. (strings[1] or '') .. ' '
      kind.menu = '    (' .. (strings[2] or '') .. ')'

      return kind
    end,
  }
})

local ts = require('nvim-treesitter.configs')
ts.setup({
  ensure_installed = { 'rust', 'c', 'cpp', 'lua' },
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  highlight = { enable = true, },
  indent = { enable = true, },
  modules = {}
})

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})

vim.o.updatetime = 250
vim.api.nvim_create_autocmd(
  { 'CursorHold' }, {
    callback = function()
      local opts = {
        focusable = false,
        close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
        border = 'rounded',
        source = 'always',
        prefix = ' ',
        scope = 'cursor',
      }
      vim.diagnostic.open_float(nil, opts)
    end
  })

local get_lsp_client = function()
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.buf_get_clients()
  if next(clients) == nil then
    return nil
  end

  for _, client in pairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return client
    end
  end

  return nil
end

vim.api.nvim_create_autocmd(
  'BufWritePost',
  {
    callback = function()
      local client = get_lsp_client()
      if client then
        if client.server_capabilities.documentFormattingProvider then
          vim.lsp.buf.format()
        end
      end
    end
  }
)

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or 'rounded'
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
