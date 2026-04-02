return {
	{
		'folke/which-key.nvim',
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
	},
	{
		'NeogitOrg/neogit',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'sindrets/diffview.nvim',
			'nvim-telescope/telescope.nvim',
		},
		cmd = "Neogit",
		keys = {
			{ "<leader>ng", "<cmd>Neogit<cr>", desc = "Neogit UI" },
		},
	},
	{
		'lewis6991/gitsigns.nvim',
		opts = {
			signs = {
				add = { text = '│' },
				change = { text = '│' },
				delete = { text = '󰍵' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
				untracked = { text = '│' },
			},
			preview_config = {
				border = 'rounded',
				style = 'minimal',
				relative = 'cursor',
				row = 0,
				col = 1
			},
			on_attach = function(bufnr)
				local gs = require('gitsigns')

				local function opts(desc)
					return { buffer = bufnr, desc = desc }
				end

				vim.keymap.set('n', '<leader>rh', gs.reset_hunk, opts 'reset hunk')
				vim.keymap.set('n', '<leader>ph', gs.preview_hunk, opts 'preview hunk')
				vim.keymap.set('n', '<leader>gb', gs.blame_line, opts 'blame line')
			end,
		}
	},
}
