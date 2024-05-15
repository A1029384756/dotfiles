return {
  'ThePrimeagen/harpoon',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
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
}
