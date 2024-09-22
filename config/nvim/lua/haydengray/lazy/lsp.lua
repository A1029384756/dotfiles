local window_borders = 'rounded'

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'L3MON4D3/LuaSnip',
    'onsails/lspkind.nvim',
    'saadparwaiz1/cmp_luasnip',
  },

  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local lspconfig = require('lspconfig')
    require('lspconfig.ui.windows').default_options.border = window_borders

    local lsp_capabilites = require('cmp_nvim_lsp').default_capabilities()

    lspconfig.ols.setup({})
    require('mason').setup({
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗'
        },
      },
    })
    require('mason-lspconfig').setup()
    require('mason-lspconfig').setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = lsp_capabilites,
        })
      end,
      ['lua_ls'] = function()
        lspconfig.lua_ls.setup({
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' },
              },
            },
          },
        })
      end,
      ['pyright'] = function()
        lspconfig.pyright.setup({
          pyright = {
            disableOrganizeImports = true,
            disableTaggedHints = true,
          },
          python = {
            analysis = {
              diagnosticSeverityOverrides = {
                -- https://github.com/microsoft/pyright/blob/main/docs/configuration.md#type-check-diagnostics-settings
                reportUndefinedVariable = "none",
              },
            },
          },
        })
      end
    })

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
        { name = 'nvim_lsp_signature_help' },
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

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      update_in_insert = true,
      underline = true,
      severity_sort = false,
      float = { border = 'rounded' },
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

    -- format on save
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

    -- rounded windows
    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = window_borders,
        close_events = { "BufHidden", "InsertLeave" },
      }
    )

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = window_borders,
      }
    )

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        -- mappings
        vim.keymap.set('n', 'rn', vim.lsp.buf.rename, {
          desc = 'rename current symbol'
        })
        vim.keymap.set('n', '<Leader>a', vim.lsp.buf.code_action, {
          desc = 'list code actions at symbol'
        })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {
          desc = 'goto symbol definition'
        })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, {
          desc = 'goto symbol references'
        })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {
          desc = 'view symbol hover info'
        })
        vim.keymap.set('n', 'cf', vim.lsp.buf.format, {
          desc = 'format code'
        })
      end
    })
  end
}
