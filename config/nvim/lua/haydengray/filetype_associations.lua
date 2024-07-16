vim.api.nvim_create_autocmd(
  { 'BufEnter', 'BufWinEnter' }, {
    pattern = { 'Jenkinsfile' },
    command = 'setfiletype groovy',
  })

vim.api.nvim_create_autocmd(
  { 'BufEnter', 'BufWinEnter' }, {
    pattern = { '*.tpp', '*.txx' },
    command = 'setfiletype cpp',
  })
