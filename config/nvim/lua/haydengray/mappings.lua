vim.keymap.set('n', '<leader>fe', ':Explore<CR><CR>', {
  desc = 'netrw'
})
vim.keymap.set('n', '<esc>', ':noh<CR>', {
  desc = 'remove highlighting'
})

local telescope_present, builtin = pcall(require, 'telescope.builtin')
if telescope_present then
  vim.keymap.set('n', '<leader>ff', builtin.find_files, {
    desc = 'find files'
  })
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, {
    desc = 'grep files'
  })
  vim.keymap.set('n', '<leader>fb', builtin.buffers, {
    desc = 'find in buffers'
  })
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {
    desc = 'find harpoon marks'
  })
end

local harpoon_present = pcall(require, 'harpoon')
if harpoon_present then
  vim.keymap.set('n', '<leader>mf', require('harpoon.mark').add_file, {
    desc = 'mark file'
  })
  vim.keymap.set('n', '<leader>rm', require('harpoon.mark').rm_file, {
    desc = 'remove mark'
  })
  vim.keymap.set('n', '<leader>hf', require('harpoon.ui').toggle_quick_menu, {
    desc = 'harpoon'
  })
  vim.keymap.set('n', '<leader>fh', ':Telescope harpoon marks<CR>', {
    desc = 'telescope harpoon'
  })
end

vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, {
  desc = 'Rename current symbol'
})
vim.keymap.set('n', '<Leader>a', vim.lsp.buf.code_action, {
  desc = 'List code actions at symbol'
})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {
  desc = 'Goto symbol definition'
})
vim.keymap.set('n', 'gr', vim.lsp.buf.references, {
  desc = 'Goto symbol references'
})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {
  desc = 'View symbol hover info'
})
vim.keymap.set('n', 'cf', vim.lsp.buf.format, {
  desc = 'Format code'
})
vim.keymap.set('n', '<Leader>tb', '<cmd> DapToggleBreakpoint <CR>', {
  desc = 'Toggle breakpoint'
})
