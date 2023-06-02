vim.api.nvim_create_autocmd(
  { 'BufEnter', 'BufWinEnter' }, {
    pattern = { '*.tfvars' },
    command = 'setfiletype terraform',
  })
