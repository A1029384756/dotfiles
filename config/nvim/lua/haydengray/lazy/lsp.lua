return {
  'neovim/nvim-lspconfig',
  config = function()
    vim.lsp.enable('ols')
    vim.lsp.config['lua_ls'] = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    }
    vim.lsp.config['pyright'] = {
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
    }

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      update_in_insert = true,
      underline = true,
      severity_sort = false,
    })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        -- mappings
        vim.keymap.set('n', 'rn', vim.lsp.buf.rename, { desc = 'rename current symbol' })
        vim.keymap.set('n', '<Leader>a', vim.lsp.buf.code_action, { desc = 'perform code action' })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'goto symbol definition' })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'goto symbol references' })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'view symbol hover info' })
        vim.keymap.set('n', 'cf', vim.lsp.buf.format, { desc = 'format code' })

        -- format on save
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = vim.api.nvim_create_augroup('UserLspConfig', { clear = false }),
            buffer = ev.buf,
            callback = function()
              vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
            end,
          })
        end
      end
    })
  end
}
