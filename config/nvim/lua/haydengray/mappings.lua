vim.keymap.set('n', '<esc>', ':noh<CR>', {
  desc = 'remove highlighting'
})
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', {
  desc = 'Exit terminal mode'
})

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {
  desc = 'Go to previous [D]iagnostic message'
})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {
  desc = 'Go to next [D]iagnostic message'
})
vim.keymap.set('n', '<learder>e', vim.diagnostic.open_float, {
  desc = 'Show diagnostic [E]rror messages'
})
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {
  desc = 'Open diagnostic [Q]uickfix list'
})
vim.keymap.set('n', '<Leader>tb', '<cmd> DapToggleBreakpoint <CR>', {
  desc = 'Toggle breakpoint'
})
