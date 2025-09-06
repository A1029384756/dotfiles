return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local options = {
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--with-filename", "--line-number",
					"--column",
					"--smart-case",
				},
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
			}
		}

		require('telescope').setup(options)
		require('telescope').load_extension('harpoon')

		vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {
			desc = 'find files'
		})
		vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {
			desc = 'grep files'
		})
		vim.keymap.set('n', '<leader>fs', require('telescope.builtin').lsp_workspace_symbols, {
			desc = 'find symbols'
		})
		vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {
			desc = 'find in buffers'
		})
		vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, {
			desc = 'find harpoon marks'
		})
		vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, {
			desc = 'find diagnostics'
		})
	end
}
