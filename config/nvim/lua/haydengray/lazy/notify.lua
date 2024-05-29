return {
  'rcarriga/nvim-notify',
  priority = 250,
  config = function()
    require('notify').setup({
      background_colour = '#000000',
    })

    vim.notify = require('notify')
  end
}
