return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    local present, toggleterm = pcall(require, 'toggleterm')

    if not present then
      return
    end

    toggleterm.setup({
      open_mapping = [[<c-\>]],
      direction = 'float',
    })
  end
}
