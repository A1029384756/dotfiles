local rust_tools = require('rust-tools')

rust_tools.setup({
  server = {
    on_attach = function (_, bufnr)
      vim.keymap.set('n', '<C-Space>', rust_tools.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set('n', '<Leader>a', rust_tools.code_action_group.code_action_group, { buffer = bufnr })
    end
  }
})
