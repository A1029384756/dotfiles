return {
	'catppuccin/nvim',
	name = 'catppuccin',
	priority = 1000,
	config = function()
		vim.opt.termguicolors = true
		require('catppuccin').setup({
			auto_integrations = true,
			transparent_background = true,
		})
		vim.cmd.colorscheme('catppuccin-mocha')
		vim.opt.background = 'dark'
		vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
		vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
	end
}
