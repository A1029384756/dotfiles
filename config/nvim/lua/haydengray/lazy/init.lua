return {
	{
		'vyfor/cord.nvim',
		build = ':Cord update',
		event = 'VeryLazy',
		opts = {
			assets = {
				odin = {
					name = 'Odin', -- 'Grug braining'
					icon = 'https://github.com/odin-lang/artwork/blob/master/logo/emblem-260.png?raw=true',
					tooltop = 'odin-lang.org',
					type = 0,
				},
			},
		},
	},
	{
		'folke/which-key.nvim',
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require('which-key').setup()
		end,
	},
	{
		'NeogitOrg/neogit',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'sindrets/diffview.nvim',
			'nvim-telescope/telescope.nvim',
		},
		config = function()
			local ng = require('neogit')
			ng.setup {}
			vim.keymap.set('n', '<leader>ng', ng.open, { desc = 'open neogit' })
		end,
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
