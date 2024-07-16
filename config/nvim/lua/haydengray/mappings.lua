vim.keymap.set('n', '<esc>', ':noh<CR>', {
  desc = 'remove highlighting'
})
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', {
  desc = 'exit terminal mode'
})

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {
  desc = 'go to previous [D]iagnostic message'
})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {
  desc = 'go to next [D]iagnostic message'
})
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {
  desc = 'show diagnostic [E]rror messages'
})
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {
  desc = 'open diagnostic [Q]uickfix list'
})
